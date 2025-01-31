extends Node

@onready
var cover = $Cover

@onready
var audio = $Audio

var best_score = 120

func _ready():
	change_scene(load("res://scenes/main_menu.tscn"), null, -1)

func change_scene(next: PackedScene, old: Node = null, track: int = -1):
	cover.cover()
	await cover.hide_finished
	if track >= 0:
		audio.set_track(track)
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
	return random.randi_range(best_score - 10, best_score + 90)
