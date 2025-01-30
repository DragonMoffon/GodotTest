extends Node2D


var pressed: bool = false

func _on_button_pressed() -> void:
	if pressed:
		return
	pressed = true
	$/root/Main.change_scene(load("res://scenes/battle/battle_scene.tscn"), self, 0)
