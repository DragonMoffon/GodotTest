extends Node

var words : Array[Word] = [
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("bet", Word.Type.VERB, 1),
	Word.new("i", Word.Type.NOUN, 1),
	Word.new("i'd", Word.Type.OTHER, 1),
	Word.new("i'll", Word.Type.OTHER, 1),
	Word.new("i'm", Word.Type.OTHER, 1),
	Word.new("only", Word.Type.OTHER, 1),
	Word.new("so", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("and", Word.Type.OTHER, 1),
	Word.new("by", Word.Type.OTHER, 1),
	Word.new("the", Word.Type.OTHER, 1),
	Word.new("brain", Word.Type.NOUN, 1, Word.Rhyme.AIN, Word.Sounds.b, Word.Vowel.aɪ),
	Word.new("truck", Word.Type.NOUN, 1),
	Word.new("duck", Word.Type.NOUN, 1),
	Word.new("brick", Word.Type.NOUN, 1),
	Word.new("fish", Word.Type.NOUN, 1),
	Word.new("garbage", Word.Type.NOUN, 2),
	Word.new("dumpster", Word.Type.NOUN, 2),
	Word.new("cheese", Word.Type.NOUN, 1),
	Word.new("L", Word.Type.NOUN, 1),
	Word.new("you", Word.Type.NOUN, 1),
	Word.new("me", Word.Type.NOUN, 1),
	Word.new("anyone", Word.Type.NOUN, 2),
	Word.new("loser", Word.Type.NOUN, 2),
	Word.new("winner", Word.Type.NOUN, 2),
	Word.new("dinner", Word.Type.NOUN, 2),
	Word.new("chicken", Word.Type.NOUN, 2),
	Word.new("potato", Word.Type.NOUN, 3),
	Word.new("tomato", Word.Type.NOUN, 3),
	Word.new("water", Word.Type.NOUN, 2),
	Word.new("father", Word.Type.NOUN, 2),
	Word.new("mother", Word.Type.NOUN, 2),
	Word.new("sister", Word.Type.NOUN, 2),
	Word.new("brother", Word.Type.NOUN, 2),
	Word.new("fool", Word.Type.NOUN, 1),
	Word.new("school", Word.Type.NOUN, 1),
	Word.new("tool", Word.Type.NOUN, 1),
	Word.new("bars", Word.Type.NOUN, 1),
	Word.new("cars", Word.Type.NOUN, 1),
	Word.new("flows", Word.Type.NOUN, 1),
	Word.new("lyrics", Word.Type.NOUN, 2),
	Word.new("Rhymes", Word.Type.NOUN, 1),
	Word.new("songs", Word.Type.NOUN, 1),
	Word.new("verses", Word.Type.NOUN, 2),
	Word.new("dog", Word.Type.NOUN, 1),
	Word.new("cat", Word.Type.NOUN, 1),
	Word.new("rat", Word.Type.NOUN, 1),
	Word.new("bat", Word.Type.NOUN, 1),
	Word.new("gun", Word.Type.NOUN, 1),
	Word.new("knife", Word.Type.NOUN, 1),
	Word.new("ball", Word.Type.NOUN, 1),
	Word.new("pizza", Word.Type.NOUN, 2),
	Word.new("soda", Word.Type.NOUN, 2),
	Word.new("burger", Word.Type.NOUN, 2),
	Word.new("toaster", Word.Type.NOUN, 2),
	Word.new("blender", Word.Type.NOUN, 2),
	Word.new("microwave", Word.Type.NOUN, 3),
	Word.new("fridge", Word.Type.NOUN, 1),
	Word.new("keyboard", Word.Type.NOUN, 2),
	Word.new("pen", Word.Type.NOUN, 1),
	Word.new("pencil", Word.Type.NOUN, 1),
	Word.new("plane", Word.Type.NOUN, 1),
	Word.new("jet", Word.Type.NOUN, 1),
	Word.new("run", Word.Type.VERB, 1),
	Word.new("walk", Word.Type.VERB, 1),
	Word.new("rap", Word.Type.VERB, 1),
	Word.new("bounce", Word.Type.VERB, 1),
	Word.new("play", Word.Type.VERB, 1),
	Word.new("eat", Word.Type.VERB, 1),
	Word.new("drink", Word.Type.VERB, 1),
	Word.new("poop", Word.Type.VERB, 1),
	Word.new("pee", Word.Type.VERB, 1),
	Word.new("learn", Word.Type.VERB, 1),
	Word.new("sing", Word.Type.VERB, 1),
	Word.new("write", Word.Type.VERB, 1),
	Word.new("love", Word.Type.VERB, 1),
	Word.new("hate", Word.Type.VERB, 1),
	Word.new("trash", Word.Type.VERB, 1),
	Word.new("rapping", Word.Type.VERB, 2),
	Word.new("writing", Word.Type.VERB, 2),
	Word.new("winning", Word.Type.VERB, 2),
	Word.new("losing", Word.Type.VERB, 2),
	Word.new("balling", Word.Type.VERB, 2),
	Word.new("pooping", Word.Type.VERB, 2),
	Word.new("peeing", Word.Type.VERB, 2),
	Word.new("singing", Word.Type.VERB, 2),
	Word.new("eating", Word.Type.VERB, 2),
	Word.new("drinking", Word.Type.VERB, 2),
	Word.new("loving", Word.Type.VERB, 2),
	Word.new("hating", Word.Type.VERB, 2),
	Word.new("stinky", Word.Type.ADJECTIVE, 2),
	Word.new("smelly", Word.Type.ADJECTIVE, 2),
	Word.new("awesome", Word.Type.ADJECTIVE, 2),
	Word.new("greatest", Word.Type.ADJECTIVE, 2),
	Word.new("lamest", Word.Type.ADJECTIVE, 2),
	Word.new("great", Word.Type.ADJECTIVE, 1),
	Word.new("lame", Word.Type.ADJECTIVE, 1),
	Word.new("stupid", Word.Type.ADJECTIVE, 2),
	Word.new("smoked", Word.Type.ADJECTIVE, 1),
	Word.new("silly", Word.Type.ADJECTIVE, 2),
	Word.new("simple", Word.Type.ADJECTIVE, 1),
	Word.new("crazy", Word.Type.ADJECTIVE, 2),
	Word.new("amazing", Word.Type.ADJECTIVE, 2),
	Word.new("spooky", Word.Type.ADJECTIVE, 2),
	Word.new("funny", Word.Type.ADJECTIVE, 2),
	Word.new("awful", Word.Type.ADJECTIVE, 2),
	Word.new("terrible", Word.Type.ADJECTIVE, 3),
	Word.new("bad", Word.Type.ADJECTIVE, 1),
	Word.new("good", Word.Type.ADJECTIVE, 1),
	Word.new("so-so", Word.Type.ADJECTIVE, 2),
	Word.new("shocking", Word.Type.ADJECTIVE, 2),
	Word.new("confusing", Word.Type.ADJECTIVE, 3),
	Word.new("mediocre", Word.Type.ADJECTIVE, 4),
	Word.new("mid", Word.Type.ADJECTIVE, 1),
]

var phrase_set : Array[Phrase] = [
	Phrase.new("you look like a %s", []),
	Phrase.new("you smell like a %s", []),
	Phrase.new("i'd rather be %s", []),
	Phrase.new("you're taking the %s", []),
	Phrase.new("i'm better than %s", []),
	Phrase.new("i'm cooler than %s", []),
	Phrase.new("you're lamer than %s", []),
	Phrase.new("i'm smarter than %s", []),
	Phrase.new("you're stupider than %s", []),
	Phrase.new("where did you %s?", []),
	Phrase.new("why are you %s?", []),
	Phrase.new("stop being %s", []),
	Phrase.new("I'll %s you for real", []),
	Phrase.new("you cannot %s me", []),
	Phrase.new("take a %s %s", []),
	Phrase.new("you are %s %s", []),
	Phrase.new("you look like my %s", []),
	Phrase.new("your momma so %s", []),
	Phrase.new("%s", []),
	Phrase.new("and those shoes? %s", []),
	Phrase.new("only %s could be your fan", []),
	Phrase.new("you can't even %s", []),
	Phrase.new("you couldn't even afford %s", []),
	Phrase.new("you seem like a love child born of %s", []),
	Phrase.new("i see you drove here in a %s", []),
	Phrase.new("you're fake as hell you'll only ever be a %s", []),
	Phrase.new("you %s like a %s", []),
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
]


func _ready() -> void:
	# var dict = DictData.new(words)
	# ResourceSaver.save(dict, "res://data/dictionary.tres")
	var phrase_data = PhraseSet.new(phrase_set)
	ResourceSaver.save(phrase_data, "res://data/base_phrases.tres")
	var word_data = WordSet.new(word_set)
	ResourceSaver.save(word_data, "res://data/base_words.tres")
