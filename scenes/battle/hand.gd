extends Node2D

@export
var text_bubble : Texture
@export
var width : float
@export
var height : float
@export
var start: float
var cards: Array[Card]

var card_scene : PackedScene = preload("res://scenes/battle/Card.tscn")
var selected_card: int = 0

func _ready() -> void:
	cards = []
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_SPACE:
				add_card()
			KEY_UP:
				select_up()
			KEY_DOWN:
				select_down()
		
func add_card() -> void:
	var new_card: Card = card_scene.instantiate()
	add_child(new_card)
	new_card.create(text_bubble, "Test String")
	cards.append(new_card)
	
	position_cards()
	# new_card.position = new_card.target
		
func position_cards():
	var count = cards.size()
	
	if count == 1:
		var card = cards[0]
		card.target = Vector2(width, 0.0)
		card.modulate = Color.ORANGE
		return
	
	var step = 2 * start / float(count - 1)
	var offset = selected_card * step - start
	
	for idx in count:
		var card = cards[idx]
		var angle = idx * step - start
		card.target = Math.ellipse(width, height, deg_to_rad(angle))
		if idx == selected_card:
			card.modulate = Color.ORANGE
			card.target.x += 60.0
		else:
			card.modulate = Color.WHITE
		card.z_index = (selected_card - abs(idx - selected_card))	
		
			
func select_up():
	selected_card -= 1
	if selected_card < 0:
		selected_card = cards.size() - 1
	position_cards()
	
func select_down():
	selected_card += 1
	if selected_card >= cards.size():
		selected_card = 0
	position_cards()
