extends Node

@onready
var cover = $Cover

var best_score = 99

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

func update_best_score(new: int):
	if new > best_score:
		best_score = new
	
func get_next_score():
	var random = RandomNumberGenerator.new()
	return random.randi_range(best_score - 15, best_score + 45)
