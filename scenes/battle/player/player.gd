extends Node

const DICT : Dict = preload("res://data/dictionary.tres")
const PHRASES : PhraseSet = preload("res://data/base_phrases.tres")
const WORDS : WordSet = preload("res://data/base_words.tres")

@onready
var hands := $Hands

@onready
var lyrics := $Lyrics

func _ready() -> void:
	var phrases = []
	phrases.resize(6)
	phrases.fill(PHRASES.phrases[1])
	hands.phrase_hand.draw_cards(phrases)
	
	var words = []
	words.resize(8)
	words.fill(DICT.words[WORDS.words[1]])
	hands.word_hand.draw_cards(words)

func _process(_dt: float) -> void:
	if Input.is_action_just_pressed("ScrollDown") or Input.is_action_just_pressed("ScrollUp"):
		hands.toggle()
	elif Input.is_action_just_pressed("Select"):
		if hands.active_hand == hands.phrase_hand:
			lyrics.add_card(VerseBar.new(hands.active_hand.get_selected().content, []))
			hands.active_hand.remove_card(hands.active_hand.selected_card)
		else:
			lyrics.bars[0].content.add_word(hands.active_hand.get_selected().content)
			hands.active_hand.remove_card(hands.active_hand.selected_card)
	elif Input.is_action_just_pressed("Deselect"):
		if hands.active_hand.cards.size() >= 1:
			hands.active_hand.remove_card(hands.active_hand.selected_card)
	elif Input.is_action_just_pressed("ScrollNext"):
		hands.select_next()
	elif Input.is_action_just_pressed("ScrollPrev"):
		hands.select_prev()
