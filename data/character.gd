class_name Character
extends Resource

var animations: SpriteFrames
var voice: Resource # ???

var phrase_deck: PhraseSet
var word_deck: WordSet

var phrase_size: int = 8
var word_size: int = 10

var discard_count: int = 8

func _init() -> void:
	animations = null
	voice = null
	
	word_deck = load("res://data/base_words.tres")
	phrase_deck = load("res://data/base_phrases.tres")
