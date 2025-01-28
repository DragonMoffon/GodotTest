extends Node2D


func _on_button_pressed() -> void:
	var battle = load("res://scenes/battle/battle_scene.tscn").instantiate()
	$/root/Main.add_child(battle)
	queue_free()
