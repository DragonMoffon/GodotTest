extends Node

var data: Character

var word_pool: Array[Word] = []
var phrase_pool: Array[Phrase] = []

var type_map: Dictionary = {}
var rhyme_map: Dictionary = {}
var group_map: Dictionary = {}
var all_map: Dictionary = {}
var ass_map: Dictionary = {}

func set_data(data_: Character):
	data = data_
	
	word_pool = data.word_deck.words.duplicate()
	word_pool.shuffle()
	phrase_pool = data.phrase_deck.phrases.duplicate()
	phrase_pool.shuffle()
	
	refil_maps()
	
func refil_maps():
	type_map = { }
	for type in Word.Type.values():
		type_map[type] = []
	rhyme_map = {}
	for rhyme in Word.Rhyme.values():
		rhyme_map[rhyme] = []
	group_map = {}
	for group in Word.Group.values():
		group_map[group] = []
	all_map = {}
	for all in Word.Sounds.values():
		all_map[all] = []
	ass_map = {}
	for ass in Word.Vowels.values():
		ass_map[ass] = []
	
	for word in word_pool:
		type_map[word.type].append(word)
		rhyme_map[word.rhyme].append(word)
		group_map[word.group].append(word)
		all_map[word.alliteration].append(word)
		ass_map[word.assonance].append(word)
		
func remove_word(word: Word):
	word_pool.erase(word)
	type_map[word.type].erase(word)
	rhyme_map[word.rhyme].erase(word)
	group_map[word.group].erase(word)
	all_map[word.alliteration].erase(word)
	ass_map[word.assonance].erase(word)
	
	if word_pool.size() <= 0:
		word_pool = data.word_deck.words.duplicate()
		word_pool.shuffle()
		refil_maps()

func get_verse() -> Verse:
	var bars : Array[VerseBar] = []
	var rhymes : Array[Word.Rhyme] = []
	var groups : Array[Word.Group] = []
	for line in 4:
		var phrase := get_phrase()
		var words : Array[Word] = []
		for blank in phrase.blanks:
			var choices = get_options(rhymes, groups, blank)
			var word = choices.pick_random()
			rhymes.append(word.rhyme)
			groups.append(word.group)
			words.append(word)
			remove_word(word)
		bars.append(VerseBar.new(phrase, words))

	return Verse.new(bars)

func get_options(rhymes: Array[Word.Rhyme], groups: Array[Word.Group], blank: Blank):
	var options: Array[Word] = []
	for rhyme in rhymes:
		options.append_array(rhyme_map[rhyme])
	for group in groups:
		options.append_array(group_map[group])
	options.append_array(type_map[blank.types])
	if blank.group != Word.Group.NONE:
		options.append_array(group_map[blank.group])
	
	if options.size() == 0:
		options = word_pool
	return options
	
func get_phrase() -> Phrase:
	var phrase = phrase_pool.pop_back()
	if phrase_pool.size() <= 0:
		phrase_pool = data.phrase_deck.phrases.duplicate()
		phrase_pool.shuffle()
	return phrase
