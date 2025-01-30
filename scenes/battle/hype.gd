extends AudioStreamPlayer2D

@export
var levels : Array[AudioStream] = []

func play_level(lvl: int):
	stream = levels[lvl]
	play()
