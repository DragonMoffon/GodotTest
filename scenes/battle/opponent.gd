extends Node

var data: Character

var word_pool: Array[Word] = []
var phrase_pool: Array[Phrase] = []

func set_data(data_: Character):
	data = data_
	
	word_pool = data.word_deck.words.duplicate()
	word_pool.shuffle()
	phrase_pool = data.phrase_deck.phrases.duplicate()
	phrase_pool.shuffle()

func get_verse() -> Verse:
	var bars : Array[VerseBar] = []
	for line in 4:
		var phrase := get_phrase()
		var words : Array[Word] = []
		words.assign(phrase.blanks.map(func(item): return get_word()))
		bars.append(VerseBar.new(phrase, words))
	return Verse.new(bars)

func get_word() -> Word:
	var word = word_pool.pop_back()
	if word_pool.size() <= 0:
		word_pool = data.word_deck.words.duplicate()
		word_pool.shuffle()
	return word
	
func get_phrase() -> Phrase:
	var phrase = phrase_pool.pop_back()
	if phrase_pool.size() <= 0:
		phrase_pool = data.phrase_deck.phrases.duplicate()
		phrase_pool.shuffle()
	return phrase
