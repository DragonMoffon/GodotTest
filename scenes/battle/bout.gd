extends AudioStreamPlayer2D

signal callout_finished

@export
var start: AudioStream
@export
var numbers: Array[AudioStream]

var bout: int = -1
var calling_number: bool = false

func start_bout(bout_: int):
	stream = start
	play()
	
	bout = bout_
	calling_number = false

func _on_finished() -> void:
	if calling_number:
		callout_finished.emit()
		calling_number = false
	elif bout > 0:
		stream = numbers[bout - 1]
		play()
		calling_number = true
	bout = 0
