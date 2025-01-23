class_name VerseBar
extends RefCounted

var phrase: Phrase
var words: Array[Word]

func _init(phrase_: Phrase, words_: Array[Word] = []) -> void:
	phrase = phrase_
	words = words_
