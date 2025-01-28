extends AudioStreamPlayer2D

@export
var versus: AudioStream

var character_1: Character
var character_2: Character

var line: int = 0

func callout(a: Character, b: Character):
	character_1 = a
	character_2 = b
	
	line = 0
	
	stream = character_1.intro
	play()
	

func _on_finished() -> void:
	if line == 0:
		line += 1
		stream = versus
		play()
	elif line == 1:
		line += 1
		stream = character_2.intro
		play()
		
