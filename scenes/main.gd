extends Node

@onready
var cover = $Cover

func _ready():
	change_scene(load("res://scenes/main_menu.tscn"), null)

func change_scene(next: PackedScene, old: Node = null):
	cover.cover()
	await cover.hide_finished
	var node = next.instantiate()
	add_child(node)
	if old != null:
		remove_child(old)
		old.queue_free() # Maybe not???
	cover.uncover()
