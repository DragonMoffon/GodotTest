extends AnimatedSprite2D

signal finished_line(line: int)
signal finished_singing

@onready
var voice: AudioStreamPlayer2D = $Voice

var current_verse: Verse = null
var current_bar: Array[Word] = []
var current_word: int = 0
var current_line: int = 0

func create(data: Character):
	sprite_frames = data.animations

func sing_verse(verse: Verse):
	current_verse = verse
	current_bar = []
	current_word = 0
	current_line = 0
	voice.play()

func _on_voice_finished():
	current_word += 1
	if current_word >= current_bar.size():
		finished_line.emit()
		current_line += 1
		if current_line >= 4:
			finished_singing.emit()
		return
	print("Start Next Line")
