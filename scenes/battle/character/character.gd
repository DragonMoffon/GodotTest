class_name CharacterSprite
extends AnimatedSprite2D

signal finished_line(line: int)
signal finished_singing

@onready
var voice: AudioStreamPlayer2D = $Voice

var data: Character

var current_verse: Verse = null
var current_bar: Array[AudioStream] = []
var current_word: int = 0
var current_line: int = 0

func update_data(data_: Character):
	data = data_
	sprite_frames = data_.animations

func sing_verse(verse: Verse):
	current_verse = verse
	current_bar = decompose_bar(verse.bars[0])
	current_word = 0
	current_line = 0
	
	voice.stream = current_bar[current_word]
	voice.play()
	
func decompose_bar(bar: VerseBar):
	var sounds : Array[AudioStream] = []
	var words = (bar.phrase.text % bar.words.map(func(word): word.text)).split(" ")
	for word in words:
		var word_data = Dict.fetch(word)
		if word_data == null:
			word_data = Dict.fetch("by")
		for s in word_data.syllables:
			sounds.append(data.voice.pick_random())
	return sounds

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
	voice.play()
