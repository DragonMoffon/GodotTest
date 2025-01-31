class_name CharacterSprite
extends AnimatedSprite2D

signal finished_line(line: int)
signal finished_singing

@onready
var voice: AudioStreamPlayer2D = $Voice
@onready
var random := RandomNumberGenerator.new()

var data: Character

@onready
var position_origin: Vector2 = position
@onready
var scale_origin: Vector2 = scale

var current_verse: Verse = null
var current_bar: Array[AudioStream] = []
var current_word: int = 0
var current_line: int = 0

var selected: bool = false

var rhyme_sounds: Dictionary = {}

func _ready() -> void:
	_highlight(0.0)

func update_data(data_: Character):
	data = data_
	sprite_frames = data_.animations
	animation = "idle"
	play()
	voice.pitch_scale = data_.pitch

func sing_verse(verse: Verse):
	rhyme_sounds = {}
	current_verse = verse
	current_bar = decompose_bar(verse.bars[0])
	current_word = 0
	current_line = 0
	
	voice.stream = current_bar[current_word]
	voice.pitch_scale = data.pitch + random.randf_range(-data.pitch_variation, data.pitch_variation)
	voice.play()
	
func decompose_bar(bar: VerseBar):
	var strings = (bar.phrase.text).split(" ")
	var words: Array[Word] = [] 
	for string in strings:
		if string == "?" or string == "," or string == "." or string == "!" or string == "%s":
			continue
		var word = Dict.fetch(string)
		if word == null:
			word = Dict.fetch("by")
		words.append(word)
	words.append_array(bar.words)
	
	var sounds : Array[AudioStream] = []
	print(words)
	for word in words:
		for s in word.syllables:
				sounds.append(data.voice.pick_random())
	
	if bar.words[-1].rhyme not in rhyme_sounds:
		rhyme_sounds[bar.words[-1].rhyme] = data.rhymes.pick_random()
	sounds.append(rhyme_sounds[bar.words[-1].rhyme])
	
	return sounds

func select():
	if selected:
		return
	selected = true
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(_highlight, 0.0, 1.0, 0.6)
	tween.play()
	
func deselect():
	if not selected:
		return
	selected = false
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(_highlight, 1.0, 0.0, 0.6)
	tween.play()

func _highlight(t: float):
	var c = 0.5 + 0.5*t
	modulate = Color(c, c, c, 1.0)
	if flip_h:
		position = position_origin + Vector2(100 * (1 - t), 0.0)
	else:
		position = position_origin - Vector2(100 * (1 - t), 0.0)
	scale = scale_origin * (0.8 + 0.2 * t)
	
func _on_voice_finished():
	current_word += 1
	if current_word >= current_bar.size():
		finished_line.emit(current_line)
		current_line += 1
		current_word = 0
		if current_line >= 4:
			finished_singing.emit()
			return
		current_bar = decompose_bar(current_verse.bars[current_line])
	# play next word
	voice.stream = current_bar[current_word]
	voice.pitch_scale = data.pitch + random.randf_range(-data.pitch_variation, data.pitch_variation)
	voice.play()
