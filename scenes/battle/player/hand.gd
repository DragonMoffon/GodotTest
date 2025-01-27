class_name Hand
extends Node2D

signal card_hovered
signal content_selected(items: Array)

const card_scene : PackedScene = preload("res://scenes/battle/player/card.tscn")

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

var active: bool = false

var cards: Array[Card] = []
var selected_count: int = -1
var selected: Array[Card] = []
var highlighted: Card = null

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
		return
	
	var step = max_shift / float(count - 1)
	if ideal_step < step:
		step = ideal_step
	# var offset = start + (count - 1 - selected_card) * step
	
	for idx in count:
		var card = cards[idx]
		var angle = start + (count - 1 - idx) * step
		card.target = Math.ellipse(width_, height_, deg_to_rad(angle))
		card.z_index = idx
		
		if card in selected:
			card.target += select
		# card.z_index = (selected_card - abs(idx - selected_card))	
	
	if active and highlighted != null:
		highlighted.z_index = count + 1
		highlighted.target += select
		move_child(highlighted, -1)

func select_prev():
	if highlighted != null:
		highlighted.unhover()
	if mirrored:
		decr()
	else:
		incr()
	highlighted.hover()


func select_next():
	if highlighted != null:
		highlighted.unhover()
	if mirrored:
		incr()
	else:
		decr()
	highlighted.hover()

func make_card(content) -> Card:
	var new_card : Card = card_scene.instantiate()
	add_child(new_card)
	new_card.create(content)
	if mirrored:
		new_card.flip()
	cards.append(new_card)
	new_card.position = spawn
	
	new_card.card_clicked.connect(_on_card_clicked)
	new_card.card_entered.connect(_on_card_entered)
	new_card.card_exited.connect(_on_card_exited)
	return new_card
	
func draw_card(content) -> void:
	make_card(content)
	position_cards()
	
func draw_cards(contents: Array) -> void:
	for content in contents:
		make_card(content)
	position_cards()

func remove_card(card : Card):
	var idx = cards.find(card)
	if card == highlighted and idx >= cards.size() - 1:
		idx = 0
	
	if card in selected:
		selected.erase(card)
		content_selected.emit(selected)
	cards.erase(card)
	card.card_clicked.disconnect(_on_card_clicked)
	card.card_entered.disconnect(_on_card_entered)
	card.card_exited.disconnect(_on_card_exited)
	
	
	if card == highlighted and cards.size() > 0:
		highlighted = cards[idx]
		if active:
			highlighted.hover()
	
	card.queue_free()
	position_cards()

func remove_cards(items: Array[Card]):
	var selected_removed := false
	for card in items:
		var idx = cards.find(card)
		if card in selected:
			selected_removed = true
		selected.erase(card)
		cards.remove_at(idx)
		card.card_clicked.disconnect(_on_card_clicked)
		card.card_entered.disconnect(_on_card_entered)
		card.card_exited.disconnect(_on_card_exited)
		
		card.queue_free()
		if card == highlighted and cards.size() > 0:
			if idx >= cards.size():
				idx = 0
			highlighted = cards[idx]
			if active:
				highlighted.hover()
	
	position_cards()
	if selected_removed:
		content_selected.emit(selected)
	
func set_selected_count(count: int):
	selected_count = count
	if 0 <= count and count < selected.size():
		var diff = selected.size() - count
		for card in selected.slice(count):
			card.deselect()
		selected.resize(count)
	position_cards()

func select_card(card: Card = null):
	if card == null:
		card = highlighted
		
	if card == null:
		return
	
	if card in selected:
		selected.erase(card)
		card.deselect()
	elif 0 <= selected_count and selected_count <= selected.size():
		for card_ in selected.slice(selected_count - 1):
			card_.deselect()
		card.select()
		selected.resize(selected_count)
		selected[selected_count - 1] = card
	else:
		selected.append(card)
		card.select()
	
	content_selected.emit(selected)
	position_cards()
		
func deselect_card(card: Card = null):
	if card == null:
		card = highlighted
		
	if card == null or card not in selected:
		return

	selected.erase(card)
	card.deselect()
	
	content_selected.emit(selected)
	position_cards()

func activate():
	active = true
	position_cards()
	if cards.size() > 0 and highlighted != null:
		highlighted.hover()

func deactivate():
	active = false
	z_index = -cards.size()
	position_cards()
	if cards.size() > 0 and highlighted != null:
		highlighted.unhover()

func incr():
	if cards.size() <= 0:
		return
	
	if highlighted == null:
		highlighted = cards[0]
		position_cards()
		return
	
	var idx = cards.find(highlighted) + 1
	if idx >= cards.size():
		idx = 0
	highlighted = cards[idx]
	position_cards()

func decr():
	if cards.size() <= 0:
		return
		
	if highlighted == null:
		highlighted = cards[cards.size() - 1]
		position_cards()
		return
	
	var idx = cards.find(highlighted) - 1
	if idx < 0:
		idx = cards.size() - 1
	highlighted = cards[idx]
	position_cards()
	
func _on_card_clicked(card: Card, pressed: bool):
	if pressed or card not in cards or not active:
		# We work on release to be nice
		return
		
	select_card(card)
	
func _on_card_entered(card: Card):
	if card not in cards:
		return
	card_hovered.emit()
	
	if highlighted != null:
		highlighted.unhover()
		
	highlighted = card
	if active:
		card.hover()
	
	position_cards()
	
	
func _on_card_exited(card: Card):
	if card not in cards:
		return
	
	if highlighted != null:
		highlighted.unhover()
	
	highlighted = null
	position_cards()
	
