extends Node

const DICT : Dict = preload("res://data/dictionary.tres")
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

func _ready() -> void:
	var phrases = []
	phrases.resize(6)
	phrases.fill(PHRASES.phrases[1])
	phrase_hand.draw_cards(phrases)
	
	var words = []
	words.resize(8)
	words.fill(DICT.words[WORDS.words[1]])
	word_hand.draw_cards(words)
	
	active_hand = phrase_hand
	inactive_hand = word_hand
	
	active_hand.activate()
	inactive_hand.deactivate()

func _process(dt: float) -> void:
	if Input.is_action_just_pressed("ScrollDown") or Input.is_action_just_pressed("ScrollUp"):
		toggle()
	elif Input.is_action_just_pressed("Select"):
		pass
	elif Input.is_action_just_pressed("ScrollNext"):
		select_next()
	elif Input.is_action_just_pressed("ScrollPrev"):
		select_prev()

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
	active_hand.get_selected().still()
	active_hand.select_next()
	active_hand.get_selected().shake()

func select_prev():
	active_hand.get_selected().still()
	active_hand.select_prev()
	active_hand.get_selected().shake()
	
func select():
	pass

# TODO: Make this the interface for the battle_scene to control the player's stuff.
# The battle scene asks for the player's lyrics, gives it cards to draw, etc.
