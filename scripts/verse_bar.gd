class_name VerseBar
extends RefCounted

var text: String
var phrase: Phrase
var words: Array[Word]

func _init(phrase_: Phrase, words_: Array[Word] = []) -> void:
	phrase = phrase_
	words = words_
	words.resize(phrase.blanks.size())
	update_text()

func add_word(word: Word):
	if null not in words:
		# TODO: handle properly
		return # Ignore adding a word when the verse is 'full'
	words[words.find(null)] = word
	update_text()
	
func update_text():
	text = phrase.text % words.map(func(word): return ("[]" if word == null else word.text))
