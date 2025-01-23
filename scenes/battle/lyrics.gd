extends Node2D

const card_scene : PackedScene = preload("res://scenes/battle/Card.tscn")

@export
var card_texture : Texture2D

var bars: Array[Card] = []
var uncommited_bar: Card

func _process(_dt: float):
	if uncommited_bar != null:
		uncommited_bar.label.text = uncommited_bar.content.text

	for bar in bars:
		bar.label.text = bar.content.text

func add_card(bar: VerseBar):
	var new_card = card_scene.instantiate()
	add_child(new_card)
	new_card.create(card_texture, bar)
	bars.append(new_card)

func place_bars():
	pass

func start_bar(bar: VerseBar):
	pass

func validate_bar() -> bool:
	return false

func commit_bar():
	pass

func discard_bar():
	pass
