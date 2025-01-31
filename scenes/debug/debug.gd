extends Node

var phrase_set : Array[Phrase] = [
	Phrase.new("are you %s ?",                                      [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("stop being %s",                                     [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("i'm cooler than %s",                                [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you're fake as hell , you'll only ever be a %s",    [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i'm smarter than %s",                               [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'll put you in a %s",                              [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("why are you %s ?",                                  [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("eat your %s , %s",                                  [Blank.new(1, Word.Type.NOUN), Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("and those shoes ? %s",                              [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("you're the love child of %s and %s",                [Blank.new(1, Word.Type.NOUN), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("on your tomb , they write %s",                      [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("take a %s and %s it",                               [Blank.new(1, Word.Type.NOUN), Blank.new(1, Word.Type.VERB)]),
	Phrase.new("%s",                                                [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'm like %s , you're like %s",                      [Blank.new(1, Word.Type.NOUN), Blank.new(3, Word.Type.NOUN)]),
	Phrase.new("you're the human version of %s",                    [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're taking the %s",                              [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you are %s %s",                                     [Blank.new(2, Word.Type.ADJ), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("take a %s %s",                                      [Blank.new(1, Word.Type.ADJ), Blank.new(1, Word.Type.VERB)]),
	Phrase.new("your head looks like a %s",                         [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("your haircut look %s",                              [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("i see you drove here in a %s",                      [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'm 100 percent %s",                                [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("you look like you'd die to a %s",                   [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i'd rather be %s",                                  [Blank.new(2, Word.Type.VERB)]),
	Phrase.new("you won't be %s anymore",                           [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("you're stupider than %s",                           [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("don't make me %s you",                              [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("bet you couldn't even take a %s",                   [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you look like my %s",                               [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'll end up with a %s",                             [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("bet your %s thought you could do better than this", [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("drink a %s , %s",                                   [Blank.new(1, Word.Type.NOUN), Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you'll end up in a %s",                             [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("no %s ?",                                           [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're scared of %s",                               [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i never wanna see you %s",                          [Blank.new(1, Word.Type.NONE)]),
	Phrase.new("keep your head up , at least you %s",               [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("i'll take your %s",                                 [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you'll never be %s",                                [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("i see you have a %s",                               [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you couldn't even afford %s",                       [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("i'm a lyrical %s",                                  [Blank.new(3, Word.Type.NOUN)]),
	Phrase.new("only %s could be your fan",                         [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("your momma so %s",                                  [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("you make me wanna %s",                              [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("you don't want to see me %s",                       [Blank.new(2, Word.Type.VERB)]),
	Phrase.new("you look like a %s",                                [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you're 100 percent %s",                             [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're lamer than %s",                              [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you %s like a %s",                                  [Blank.new(1, Word.Type.VERB), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you smell like a %s",                               [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("if you had goons , they'd all be %s",               [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("so broke , so %s",                                  [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("i'll %s you for real",                              [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("i'll always be %s",                                 [Blank.new(2, Word.Type.ADJ)]),
	Phrase.new("i'm better than %s",                                [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you're like a %s",                                  [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("i'm %s you for real",                               [Blank.new(2, Word.Type.VERB)]),
	Phrase.new("the paparazzi'd call you %s",                       [Blank.new(1, Word.Type.ADJ)]),
	Phrase.new("your %s is a %s",                                   [Blank.new(1, Word.Type.NOUN), Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you seem a love child born of %s",                  [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("eat my %s",                                         [Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("where did you %s ?",                                [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("i'll give you a %s",                                [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("you're like a %s , %s",                             [Blank.new(1, Word.Type.NOUN), Blank.new(1, Word.Type.NOUN)]),
	Phrase.new("you can't even %s",                                 [Blank.new(2, Word.Type.VERB)]),
	Phrase.new("you cannot %s me",                                  [Blank.new(1, Word.Type.VERB)]),
	Phrase.new("you end up with a %s",                              [Blank.new(2, Word.Type.NOUN)]),
	Phrase.new("smoked by the %s",                                  [Blank.new(2, Word.Type.NOUN)]),
]

var word_set : Array[StringName] = [
	"affinity",
	"amazing",
	"ant",
	"anyone",
	"awesome",
	"awful",
	"back seat",
	"bad",
	"ball",
	"balling",
	"ban",
	"band",
	"bars",
	"base",
	"bat",
	"bed",
	"beer",
	"biting",
	"bleat",
	"blender",
	"blossom",
	"blues",
	"boos",
	"bounce",
	"brick",
	"broke",
	"brother",
	"burger",
	"butt",
	"can",
	"car",
	"case",
	"cash flow",
	"cat",
	"cell",
	"cheat",
	"cheese",
	"chicken",
	"coke",
	"confusing",
	"control",
	"crazy",
	"crime",
	"criminal",
	"crooks",
	"cut",
	"dead",
	"dead meat",
	"deadbeat",
	"dinner",
	"disclaimer",
	"divinity",
	"dog",
	"dove",
	"drama",
	"dread",
	"drink",
	"drinking",
	"duck",
	"dumpster",
	"eat",
	"eating",
	"erase",
	"face",
	"father",
	"fish",
	"flamer",
	"flathead",
	"flea",
	"flee",
	"flirt",
	"flows",
	"fool",
	"fridge",
	"frog",
	"funny",
	"garbage",
	"gongs",
	"good",
	"great",
	"greatest",
	"greet",
	"gun",
	"hand",
	"hate",
	"hating",
	"hazy",
	"infinity",
	"ink",
	"jet",
	"jo-schmo",
	"joke",
	"karma",
	"keyboard",
	"knife",
	"l",
	"lame",
	"lazy",
	"lead",
	"learn",
	"llama",
	"loser",
	"losing",
	"love",
	"loving",
	"lyrics",
	"mace",
	"man",
	"martyr",
	"me",
	"meal",
	"meat hooks",
	"mediocre",
	"microwave",
	"mid",
	"miracle",
	"monologue",
	"mother",
	"mutt",
	"no cap",
	"obsolete",
	"orange",
	"pan",
	"pants",
	"pea",
	"pee",
	"peeing",
	"pen",
	"pencil",
	"petite",
	"pizza",
	"plane",
	"play",
	"poke",
	"poop",
	"pooping",
	"possum",
	"potato",
	"prongs",
	"psychodrama",
	"purple",
	"ran",
	"rap",
	"rap sheet",
	"rapping",
	"rat",
	"red",
	"rhymes",
	"run",
	"ruse",
	"silly",
	"school",
	"self-love",
	"shirt",
	"shmooze",
	"shocking",
	"shove",
	"silly-billy",
	"sing",
	"singing",
	"sister",
	"skirt",
	"slog",
	"smell",
	"smelly",
	"smoke",
	"smut",
	"snap",
	"so-so",
	"soda",
	"songs",
	"spews",
	"spiritual",
	"spooky",
	"squee",
	"squirt",
	"stepfather ",
	"stinky",
	"strut",
	"stupid",
	"sublime",
	"sugar mama",
	"take a seat",
	"terrible",
	"think",
	"time",
	"toaster",
	"toilet seat",
	"tomato",
	"tool",
	"trash",
	"truck",
	"tweet",
	"verses",
	"walk",
	"wallstreet",
	"water",
	"wet feet",
	"willy-nilly",
	"winner",
	"winning",
	"write",
	"writing",
	"wrongs",
	"yap",
	"you",
	"zeal",
	"affair",
	"awake",
	"bake",
	"baloney",
	"band",
	"bloke",
	"boor",
	"bop",
	"bored",
	"brain",
	"break",
	"bunch",
	"buy",
	"bye",
	"cake",
	"canned",
	"care",
	"cash",
	"chair",
	"choke",
	"choked",
	"chop",
	"cigarette",
	"cooky",
	"corn",
	"croak",
	"crunch",
	"debt",
	"debtor",
	"die",
	"discord",
	"flake",
	"flop",
	"fly",
	"forbid",
	"glare",
	"glop",
	"gore",
	"gourd",
	"government",
	"hair",
	"honey",
	"ignored",
	"lair",
	"lonely",
	"lunch",
	"lure",
	"mild",
	"mistake",
	"money",
	"mop",
	"mourn",
	"munch",
	"pet",
	"phoney",
	"pore",
	"quake",
	"record",
	"ruler",
	"sand",
	"scrunch",
	"shake",
	"skid",
	"slop",
	"smell",
	"smoked",
	"snake",
	"square",
	"stand",
	"stepchild",
	"sword",
	"taste",
	"tear",
	"the",
	"the man",
	"try",
	"wake",
	"wet",
	"wetter",
	"white collar criminal",
	"woke",
	"yarn",
]

var groups = ["phrase_words", "phrase_words_manual", "player_words", "player_words_manual"]

func _ready() -> void:
	pass
	# var words : Array[Word] = []
	# for list in groups:
	# 	var debug_list = load("res://scenes/debug/editor/%s.tres" % [list])
	#	words.append_array(debug_list.list)
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
