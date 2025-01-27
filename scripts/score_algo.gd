class_name ScoreAlgorithm
extends RefCounted

const rhyme_groupings : Dictionary = {
	"0000": 0,
	"0001": 0,
	"0010": 0,
	"0011": 0,
	"0012": 0,
	"0100": 0,
	"0101": 0,
	"0110": 0,
	"0111": 0,
	"0112": 0,
	"0120": 0,
	"0121": 0,
	"0122": 0,
	"0123": 0
}

enum Conditions { NONE }

const condition_text = {
	Conditions.NONE: "Beat the target score!!"
}
var condition_algo = {
	Conditions.NONE: default
}

var condition : Conditions
var syllable_factor : float = 1.0
var alliteration_factor : float = 1.0
var assonance_factor : float = 1.0
var internal_rhyme_factor : float = 1.0
var rhyme_factor : float = 1.0

func _init(
		condition_: Conditions = Conditions.NONE,
		syllable: float = 1.0,
		alliteration: float = 1.0,
		assonance: float = 1.0,
		internal: float = 1.0,
		rhyme: float = 1.0
):
	condition = condition_
	syllable_factor = syllable
	alliteration_factor = alliteration
	assonance_factor = assonance
	internal_rhyme_factor = internal
	rhyme_factor = rhyme
	
func score_bar(bar: VerseBar) -> int:
	return int(10.0)
	
func score_verse(verse: Verse) -> int:
	var score = 0
	for bar in verse.bars:
		score += score_bar(bar)
	return int(score)

func get_verse_rhyme_group(verse: Verse) -> String:
	# This assumes the last word is always the last in the bar
	var words: Array[Word] = []
	for bar in verse.bars:
		words.append(bar.words[bar.words.size() - 1])
	
	var unique = []
	for word in words:
		if word.rhyme not in unique:
			unique.append(word.rhyme)
	return "%s%s%s%s" % words.map(func(wrd): return unique.find(wrd.rhyme))

func get_score_text() -> String:
	return condition_text[condition]

func meets_special_condition(verses: Array[Verse]) -> bool:
	return condition_algo[condition].call(verses)

# Each battle stores its score algorithm and that tells you
# what the special victory condition is.

func default(verses: Array[Verse]):
	return true

 # func algo_(...):
