class_name Hand
extends Node2D

const card_scene : PackedScene = preload("res://scenes/battle/player/card.tscn")

@export_category("Card Details")
@export
var texture : Texture

@export_category("Placement Details")
@export
var width : float
@export
var height : float
@export_range(-180.0, 180.0)
var start: float
@export_range(-360.0, 360.0)
var max_shift : float
@export
var ideal_step : float
@export
var select : Vector2
@export
var spawn : Vector2
@export
var mirrored : bool = false

var cards: Array[Card] = []
var selected: Array[Card] = []
var active: bool = true

var highlighted: int = 0

func _ready() -> void:
	cards = []
	selected = []


func position_cards():
	var count = cards.size()
	if active:
		z_index = count
		
	var width_ = width
	var height_ = height
	
	if mirrored:
		width_ = -width
	
	if count == 0:
		return
	elif count == 1:
		var card = cards[0]
		var angle = start
		card.target = Math.ellipse(width_, height_, deg_to_rad(angle))
		
		# if active:
		# 	card.modulate = Color.ORANGE
		return
	
	var step = max_shift / float(count - 1)
	if ideal_step < step:
		step = ideal_step
	# var offset = start + (count - 1 - selected_card) * step
	
	for idx in count:
		var card = cards[idx]
		var angle = start + (count - 1 - idx) * step
		card.target = Math.ellipse(width_, height_, deg_to_rad(angle))
		if idx == highlighted and active:
			# card.modulate = Color.ORANGE
			card.target += select
			card.z_index = count + 1
		else:
			card.modulate = Color.WHITE
			card.z_index = idx
		# card.z_index = (selected_card - abs(idx - selected_card))	


func select_prev():
	cards[highlighted].deselect()
	if mirrored:
		decr()
	else:
		incr()
	cards[highlighted].select()


func select_next():
	cards[highlighted].deselect()
	if mirrored:
		incr()
	else:
		decr()
	cards[highlighted].select()


func draw_card(content) -> void:
	var new_card: Card = card_scene.instantiate()
	add_child(new_card)
	new_card.create(texture, content)
	cards.append(new_card)
	new_card.position = spawn
	position_cards()
	
func draw_cards(contents: Array) -> void:
	for content in contents:
		var new_card = card_scene.instantiate()
		add_child(new_card)
		new_card.create(texture, content)
		cards.append(new_card)
		new_card.position = spawn
	if active:
		cards[highlighted].select()
	position_cards()

func remove_card(idx: int):
	if idx == highlighted and idx + 1 >= cards.size():
		highlighted = 0
	
	var card = cards.pop_at(idx)
	card.queue_free()
	position_cards()
	
	if active and cards.size() > 0:
		cards[highlighted].select()
		
	return card

func get_selected():
	return cards[highlighted]

func activate():
	active = true
	position_cards()
	if cards.size() > 0:
		cards[highlighted].select()
		cards[highlighted].shake()

func deactivate():
	active = false
	z_index = -cards.size()
	position_cards()
	if cards.size() > 0:
		cards[highlighted].deselect()
		cards[highlighted].still()

func incr():
	highlighted += 1
	if highlighted >= cards.size():
		highlighted = 0
	position_cards()

func decr():
	highlighted -= 1
	if highlighted < 0:
		highlighted = cards.size() - 1
	position_cards()
