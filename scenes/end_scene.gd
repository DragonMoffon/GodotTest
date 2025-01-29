extends Node2D


var changing = false


func _unhandled_input(event: InputEvent) -> void:
	if changing:
		return
	if event is InputEventKey or event is InputEventMouseButton:
		changing = true
		$/root/Main.change_scene(load("res://scenes/main_menu.tscn"), self)
