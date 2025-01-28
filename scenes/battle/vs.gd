extends AudioStreamPlayer2D

signal finished_callout
signal finished_winner

@export
var versus: AudioStream

@export
var winner: AudioStream

var character_1: Character
var character_2: Character

func callout(a: Character, b: Character):
	character_1 = a
	character_2 = b
	
	stream = character_1.intro
	play()
	await finished
	stream = versus
	play()
	await finished
	stream = character_2.intro
	play()
	
	finished_callout.emit()

func call_winner(win: Character):
	stream = win.intro
	play()
	
	await finished
	stream = winner
	play()
	
	finished_winner.emit()
