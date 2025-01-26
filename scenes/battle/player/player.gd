extends Node

signal phrase_selected(phrase: Phrase)
signal words_selected(words: Array[Word])

const PHRASES : PhraseSet = preload("res://data/base_phrases.tres")
const WORDS : WordSet = preload("res://data/base_words.tres")

@export
var active_target : Vector2
@export
var inactive_target : Vector2
@export
var move_speed : float = 0.4
@export
var fade_speed : float = 0.1

@onready
var phrase_hand : Hand = $PhraseHand
@onready
var word_hand : Hand = $WordHand

var active_hand : Hand
var inactive_hand : Hand
var brain_active: bool = false

func _ready() -> void:
	var phrases: Array[Phrase] = []
	phrases.resize(6)
	phrases.fill(PHRASES.phrases[1])
	draw_phrases(phrases)
	
	var words: Array[Word] = []
	words.resize(8)
	words.fill(Dict.fetch(WORDS.words[1]))
	draw_words(words)
	
	phrase_hand.set_selected_count(1)
	
	active_hand = phrase_hand
	inactive_hand = word_hand
	
	active_hand.activate()
	inactive_hand.deactivate()

func _process(dt: float) -> void:
	if Input.is_action_just_pressed("ScrollDown") or Input.is_action_just_pressed("ScrollUp"):
		toggle()
	elif Input.is_action_just_pressed("ScrollNext"):
		select_next()
	elif Input.is_action_just_pressed("ScrollPrev"):
		select_prev()
	
	if Input.is_action_just_pressed("Select"):
		active_hand.select_card()
	elif Input.is_action_just_pressed("Deselect"):
		active_hand.deselect_card()

	active_hand.position = Anim.slerp(active_hand.position, active_target, move_speed, dt)
	inactive_hand.position = Anim.slerp(inactive_hand.position, inactive_target, move_speed, dt)
	
	var c = Anim.slerp(active_hand.modulate.r, 1.0, fade_speed, dt)
	active_hand.modulate = Color(c, c, c)
	
	c = Anim.slerp(inactive_hand.modulate.r, 0.5, fade_speed, dt)
	inactive_hand.modulate = Color(c, c, c)

func toggle():
	var swap = active_hand
	active_hand = inactive_hand
	inactive_hand = swap
	
	active_hand.activate()
	inactive_hand.deactivate()
	
func select_next():
	if active_hand.highlighted != null:
		active_hand.highlighted.still()
	active_hand.select_next()
	active_hand.highlighted.shake()

func select_prev():
	if active_hand.highlighted != null:
		active_hand.highlighted.still()
	active_hand.select_prev()
	active_hand.highlighted.shake()
	
func toggle_deck():
	if brain_active:
		disable_deck()
	else:
		enable_deck()
		
func enable_deck():
	brain_active = true
	
	active_hand.deactivate()
	inactive_hand.deactivate()
	
func disable_deck():
	brain_active = false
	
	active_hand.activate()
	inactive_hand.deactivate()
	
func draw_word(word: Word):
	word_hand.draw_card(word)

func draw_words(words: Array[Word]):
	word_hand.draw_cards(words)

func draw_phrase(phrase: Phrase):
	phrase_hand.draw_card(phrase)
	
func draw_phrases(phrases: Array[Phrase]):
	phrase_hand.draw_cards(phrases)

func get_selected_phrase():
	if phrase_hand.selected.size() > 0:
		return phrase_hand.selected[0]
	else:
		return null
	
func get_selected_words():
	return word_hand.selected
	

# TODO: Make this the interface for the battle_scene to control the player's stuff.
# The battle scene asks for the player's lyrics, gives it cards to draw, etc.


func _on_phrase_hand_hovered() -> void:
	active_hand = phrase_hand
	inactive_hand = word_hand
	
	disable_deck()
	
	active_hand.activate()
	inactive_hand.deactivate()

func _on_word_hand_hovered() -> void:
	active_hand = word_hand
	inactive_hand = phrase_hand
	
	disable_deck()
	
	active_hand.activate()
	inactive_hand.deactivate()

func _on_commit_clicked() -> void:
	pass # Replace with function body.

func _on_discard_clicked() -> void:
	pass # Replace with function body.

func _on_phrase_content_selected(items: Array) -> void:
	if items.size() < 1:
		phrase_selected.emit(null)
		word_hand.set_selected_count(-1)
	else:	
		phrase_selected.emit(items[0].content)
		word_hand.set_selected_count(items[0].content.count)

func _on_word_content_selected(items: Array) -> void:
	var words : Array[Word] = []
	words.resize(items.size())
	for idx in items.size():
		words[idx] = items[idx].content
	words_selected.emit(words)
