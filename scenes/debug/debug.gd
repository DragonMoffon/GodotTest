extends Node

var phrase_set : Array[Phrase] = [
	Phrase.new("you look like a %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you smell like a %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i'd rather be %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you're taking the %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'm better than %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i'm cooler than %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're lamer than %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'm smarter than %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you're stupider than %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("where did you %s ?", [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("why are you %s ?", [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("stop being %s", [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("i'll %s you for real", [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("you cannot %s me", [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("take a %s %s", [Blank.new(1, Word.Type.ADJ), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you are %s %s", [Blank.new(2, Word.Type.ADJ), Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("you look like my %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("your momma so %s", [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("%s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("and those shoes ? %s", [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("only %s could be your fan", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you can't even %s", [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("you couldn't even afford %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you seem like a love child born of %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i see you drove here in a %s", [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're fake as hell you'll only ever be a %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you %s like a %s", [Blank.new(1, Word.Type.VERB), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("smoked by the %s", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("fuck %s all my homies hate %s", [Blank.new(1, Word.Type.NOUN), Blank.new(1, Word.Type.NOUN)])
]

var word_set : Array[StringName] = [
	"brain",
	"simple",
	"smoked",
	"truck",
	"duck",
	"brick",
	"Fish",
	"Garbage",
	"Dumpster",
	"Cheese",
	"L",
	"You",
	"Me",
	"Anyone",
	"Loser",
	"Winner",
	"Dinner",
	"Chicken",
	"Potato",
	"Tomato",
	"Water",
	"Father",
	"Mother",
	"Sister",
	"Brother",
	"Fool",
	"School",
	"Tool",
	"Bars",
	"Cars",
	"Flows",
	"Rhymes",
	"Lyrics",
	"Songs",
	"Verses",
	"Dog",
	"Cat",
	"Rat",
	"Gun",
	"Bat",
	"Knife",
	"Ball",
	"Pizza",
	"Soda",
	"Burger",
	"Toaster",
	"Blender",
	"Microwave",
	"Fridge",
	"Keyboard",
	"Pen",
	"Pencil",
	"Run",
	"Walk",
	"Rap",
	"Bounce",
	"Play",
	"Eat",
	"Drink",
	"Poop",
	"Pee",
	"Learn",
	"Sing",
	"Write",
	"Love",
	"Hate",
	"Trash",
	"Plane",
	"Jet",
	"Rapping",
	"Writing",
	"Winning",
	"Losing",
	"Balling",
	"Pooping",
	"Peeing",
	"Singing",
	"Eating",
	"Drinking",
	"Loving",
	"Hating",
	"Stinky",
	"Smelly",
	"Awesome",
	"Greatest",
	"Lamest",
	"Great",
	"Lame",
	"Stupid",
	"Silly",
	"Crazy",
	"Amazing",
	"Spooky",
	"Funny",
	"Awful",
	"Terrible",
	"Bad",
	"Good",
	"Shocking",
	"Confusing",
	"Mediocre",
	"So-so",
	"Mid",
	"Die",
	"Try",
	"Buy",
	"Money",
	"Cash",
	"Honey",
	"Lunch",
	"Crunch",
	"Munch",
	"Bunch",
	"Scrunch",
	"Smell",
	"Taste",
	"Sand",
	"Canned",
	"Band",

]


func _ready() -> void:
	var words = DebugWordList.new()
	words.list = WordData.player_words_manual
	ResourceSaver.save(words, "res://scenes/debug/editor/player_words_manual.tres")
	pass
	# var dict = DictData.new(words)
	# ResourceSaver.save(dict, "res://data/dictionary.tres")
	#var phrase_data = PhraseSet.new(phrase_set)
	#ResourceSaver.save(phrase_data, "res://data/base_phrases.tres")
	#var word_data = WordSet.new(word_set)
	#ResourceSaver.save(word_data, "res://data/base_words.tres")


func _find_amounts_rhyme(words: Array[Word]):
	var amounts = {}
	for word in words:
		if word.rhyme not in amounts:
			amounts[word.rhyme] = [0]
		amounts[word.rhyme][0] += 1
		amounts[word.rhyme].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Rhyme.keys()[key], amounts[key].slice(1), amounts[key][0]])


func _find_amounts_alliteration(words: Array[Word]):
	var amounts = {}
	for word in words:
		if word.alliteration not in amounts:
			amounts[word.alliteration] = [0]
		amounts[word.alliteration][0] += 1
		amounts[word.alliteration].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Sounds.keys()[key], amounts[key].slice(1), amounts[key][0]])


func _find_amounts_assonance(words: Array[Word]):
	var amounts = {}
	for word in words:
		if word.assonance not in amounts:
			amounts[word.assonance] = [0]
		amounts[word.assonance][0] += 1
		amounts[word.assonance].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Sounds.keys()[key], amounts[key].slice(1), amounts[key][0]])


func _find_amounts_group(words: Array[Word]):
	var amounts = {}
	for word in words:
		if word.group not in amounts:
			amounts[word.group] = [0]
		amounts[word.group][0] += 1
		amounts[word.group].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Group.keys()[key], amounts[key].slice(1), amounts[key][0]])
