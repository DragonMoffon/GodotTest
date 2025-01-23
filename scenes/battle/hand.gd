class_name Hand
extends Node2D

@export
var text_bubble : Texture
@export
var width : float
@export
var height : float
@export_range(-180.0, 180.0)
var start: float
@export_range(-360.0, 360.0)
var range : float
@export
var select : Vector2

var cards: Array[Card]
var active: bool = true

var card_scene : PackedScene = preload("res://scenes/battle/Card.tscn")
var selected_card: int = 0

func _ready() -> void:
	cards = []

func _process(delta: float) -> void:
	if not active:
		return

	if Input.is_action_just_pressed("Select"):
		add_card()
	elif Input.is_action_just_pressed("ScrollNext"):
		select_next()
	elif Input.is_action_just_pressed("ScrollPrev"):
		select_prev()
		
func add_card() -> void:
	var new_card: Card = card_scene.instantiate()
	add_child(new_card)
	new_card.create(text_bubble, "TEST STRING")
	cards.append(new_card)
	
	position_cards()
		
func position_cards():
	var count = cards.size()
	
	if count == 1:
		var card = cards[0]
		var angle = start + range / 2.0
		card.target = Math.ellipse(width, height, deg_to_rad(angle))
		
		if active:
			card.modulate = Color.ORANGE
		return
	
	var step = range / float(count - 1)
	var offset = start + selected_card * step
	
	for idx in count:
		var card = cards[idx]
		var angle = start + idx * step
		card.target = Math.ellipse(width, height, deg_to_rad(angle))
		if idx == selected_card and active:
			card.modulate = Color.ORANGE
			card.target += select
		else:
			card.modulate = Color.WHITE
		card.z_index = (selected_card - abs(idx - selected_card))	
			
func select_prev():
	selected_card -= 1
	if selected_card < 0:
		selected_card = cards.size() - 1
	position_cards()
	
func select_next():
	selected_card += 1
	if selected_card >= cards.size():
		selected_card = 0
	position_cards()
	
func deactivate():
	active = false
	z_index = -10
	
	position_cards()
	
	
func activate():
	active = true
	z_index = 10
	
	position_cards()
