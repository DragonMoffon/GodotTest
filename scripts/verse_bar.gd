class_name VerseBar
extends RefCounted

var text: String
var phrase: Phrase
var words: Array[Word]

func _init(phrase_: Phrase, words_: Array[Word] = []) -> void:
	phrase = phrase_
	words = words_

func is_valid_bar():
	if phrase == null or words.size() != phrase.count:
		return false
	for word in words:
		if word == null:
			return false
	return true
