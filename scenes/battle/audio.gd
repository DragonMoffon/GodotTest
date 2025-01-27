extends Node

@onready
var music = $Music

@onready
var ambience = $Ambience

func _on_music_finished():
	music.play()

func _on_ambience_finish():
	ambience.play()
