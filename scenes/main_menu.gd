extends Node2D


func _on_button_pressed() -> void:
	$/root/Main.change_scene(load("res://scenes/battle/battle_scene.tscn"), self)
