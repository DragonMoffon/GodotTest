extends Node

@export
var tracks: Array[AudioStream] = []

@onready
var music_a = $Music_1
@onready
var music_b = $Music_2

@onready
var ambience = $Ambience


func set_track(idx: int):
	var tween = get_tree().create_tween()
	tween.tween_method(_fade, 1.0, 0.0, 3.0)
	music_a.finished.disconnect(_on_music_finished)
	music_b.stream = tracks[idx]
	music_b.play()
	tween.play()
	await tween.finished
	var m = music_a
	music_a = music_b
	music_b = m
	
	music_a.finished.connect(_on_music_finished)
	
func _fade(t: int):
	music_a.volume_db = linear_to_db(t)
	music_b.volume_db = linear_to_db(1.0 - t)
	
func _on_music_finished():
	music_a.play()

func _on_ambience_finish():
	ambience.play()
