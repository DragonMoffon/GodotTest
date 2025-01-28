class_name Player
extends Node

signal phrase_selected(phrase: Phrase)
signal words_selected(words: Array[Word])
signal discard_selected
signal play_selected

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
@onready
var deck : Deck = $Deck

var active_hand : Hand
var inactive_hand : Hand

var disabled : bool = false

var player_data: Character

var discards: int = 0
var word_pool: Array[Word] = []
var phrase_pool: Array[Phrase] = []
var verses: Array[Verse] = []

func set_player(data : Character):
	player_data = data
	
	word_pool = data.word_deck.words.duplicate()
	word_pool.shuffle()
	phrase_pool = data.phrase_deck.phrases.duplicate()
	phrase_pool.shuffle()
	
	discards = data.discard_count
	deck.set_discard_count(discards)
	
	deck.disable_commit()
	deck.enable_discard()

func _ready() -> void:
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
		
	if disabled:
		var c = Anim.slerp(word_hand.modulate.r, 0.5, fade_speed, dt)
		word_hand.position = Anim.slerp(word_hand.position, inactive_target, move_speed, dt)
		word_hand.modulate = Color(c, c, c)
		
		c = Anim.slerp(phrase_hand.modulate.r, 0.5, fade_speed, dt)
		phrase_hand.position = Anim.slerp(phrase_hand.position, inactive_target, move_speed, dt)
		phrase_hand.modulate = Color(c, c, c)
	else:
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
	active_hand.select_next()

func select_prev():
	active_hand.select_prev()
	
func enable():
	disabled = false
	
	active_hand.activate()
	inactive_hand.deactivate()
	
func disable():
	disabled = true
	
	word_hand.deactivate()
	phrase_hand.deactivate()
	
func draw_word():
	draw_words(1)

func draw_words(count: int):
	if count > word_pool.size():
		var sub = word_pool.size()
		draw_words(sub)
		word_pool = player_data.word_deck.words.duplicate()
		word_pool.shuffle()
		draw_words(count - sub)
		return
	word_hand.draw_cards(word_pool.slice(0, count))
	word_pool = word_pool.slice(count)
	if word_pool.size() == 0:
		word_pool = player_data.word_deck.words.duplicate()
		word_pool.shuffle()

func draw_phrase():
	draw_phrases(1)

func draw_phrases(count: int):
	if count > phrase_pool.size():
		var sub = phrase_pool.size()
		draw_phrases(sub)
		phrase_pool = player_data.phrase_deck.phrases.duplicate()
		phrase_pool.shuffle()
		draw_phrases(count - sub)
		return
	phrase_hand.draw_cards(phrase_pool.slice(0, count))
	phrase_pool = phrase_pool.slice(count)
	if phrase_pool.size() == 0:
		phrase_pool = player_data.phrase_deck.phrases.duplicate()
		phrase_pool.shuffle()

func get_selected_phrase() -> Word:
	if phrase_hand.selected.size() > 0:
		return phrase_hand.selected[0].content
	else:
		return null

func get_selected_words() -> Array[Word]:
	var words : Array[Word] = []
	words.assign(word_hand.selected.map(func(item): return item.content))
	return words

func get_cards_selected() -> bool:
	
	return phrase_hand.selected.size() > 0 or word_hand.selected.size() > 0

func discard_cards():
	phrase_hand.remove_cards(phrase_hand.selected.duplicate())
	word_hand.remove_cards(word_hand.selected.duplicate())
	
func refill_hand():
	var diff_word = player_data.word_size - word_hand.cards.size()
	var diff_phrase = player_data.phrase_size - phrase_hand.cards.size()
	
	draw_words(diff_word)
	draw_phrases(diff_phrase)

# TODO: Make this the interface for the battle_scene to control the player's stuff.
# The battle scene asks for the player's lyrics, gives it cards to draw, etc.

func _on_phrase_hand_hovered() -> void:
	if disabled:
		return
	active_hand = phrase_hand
	inactive_hand = word_hand
	
	active_hand.activate()
	inactive_hand.deactivate()

func _on_word_hand_hovered() -> void:
	if disabled:
		return
	active_hand = word_hand
	inactive_hand = phrase_hand
	
	active_hand.activate()
	inactive_hand.deactivate()

func _on_phrase_content_selected(items: Array) -> void:
	if items.size() < 1:
		word_hand.set_selected_count(-1)
		phrase_selected.emit(null)
	else:	
		word_hand.set_selected_count(items[0].content.count)
		phrase_selected.emit(items[0].content)

func _on_word_content_selected(items: Array) -> void:
	var words : Array[Word] = []
	words.assign(items.map(func(item): return item.content))
	words_selected.emit(words)

func _on_discard_clicked() -> void:
	if disabled:
		return
	discard_selected.emit()

func _on_play_clicked() -> void:
	if disabled:
		return
	play_selected.emit()
