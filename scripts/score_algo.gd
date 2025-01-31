class_name ScoreAlgorithm
extends RefCounted

const rhyme_groupings : Dictionary = {
	"0000": 30,
	"0001": 15,
	"0010": 15,
	"0011": 20,
	"0012": 10,
	"0100": 15,
	"0101": 25,
	"0110": 20,
	"0111": 15,
	"0112": 10,
	"0120": 10,
	"0121": 10,
	"0122": 10,
	"0123": 0
}

const rhyme_labels : Array[String] = ["A", "B", "C", "D"]

enum Conditions { NONE }

const condition_text = {
	Conditions.NONE: "Beat the target score!!"
}

var condition_algo = {
	Conditions.NONE: default
}

var condition : Conditions = Conditions.NONE
var syllable_factor : float = 2.3
var alliteration_factor : float = 4.3
var assonance_factor : float = 5.1
var type_factor : float = 4.67
var topic_factor : float = 6.4
var internal_rhyme_factor : float = 6.5
var rhyme_factor : float = 1.0

func get_verse_rhyme_group(verse: Verse) -> Array[int]:
	# This assumes the last word is always the last in the bar
	var words: Array[Word] = []
	for bar in verse.bars:
		words.append(bar.words[bar.words.size() - 1])
	
	var unique = []
	for word in words:
		if word.rhyme not in unique:
			unique.append(word.rhyme)
	var grouping : Array[int] = []
	grouping.assign(words.map(func(wrd): return unique.find(wrd.rhyme)))
	return grouping
	
func get_verse_relevancies(verse: Verse) -> Array[int]:
	var each = []
	var unique = []
	for bar in verse.bars:
		for word in bar.words:
			each.append(word.group)
			if word.group not in unique:
				unique.append(word.group)
	var topics : Array[int] = []
	topics.assign(unique.map(func(item): return each.count(item)))
	return topics

func get_score_text() -> String:
	return condition_text[condition]

func score_bar(bar: VerseBar) -> Score.LineScore:
	var words : Array[Word] = []
	var blank_idx: int = 0
	for word in bar.phrase.text.split(" "):
		if word == "%s":
			words.append(bar.words[blank_idx])
			blank_idx += 1
		elif Dict.contains(word):
			words.append(Dict.fetch(word))
		else:
			print("No scoring of <%s>" % [word])
	
	var alliteration = words.map(func(word): return word.alliteration)
	var assonance = words.map(func(word): return word.assonance)
	var rhyme = words.map(func(word): return word.rhyme)
	
	var score := 0.0
	var has_alliteration = false
	var has_assonance = false
	var has_rhyme = false
	for idx in bar.phrase.count:
		var word = bar.words[idx]
		var blank = bar.phrase.blanks[idx]
		
		if word.syllables == blank.syllables:
			score += syllable_factor
			
		if word.type & blank.types:
			score += type_factor
		
		if alliteration.count(word.alliteration) >= 2:
			score += alliteration_factor * alliteration.count(word.alliteration)
			has_alliteration = true
			
		if assonance.count(word.assonance) >= 2:
			score += assonance_factor * assonance.count(word.assonance)
			has_assonance = true
			
		if rhyme.count(word.rhyme) >= 2:
			score += internal_rhyme_factor * rhyme.count(word.rhyme)
			has_rhyme = true
	
	return Score.LineScore.new(int(score), "", has_alliteration, has_assonance, has_rhyme)
	
func score_verse(verse: Verse) -> Score:
	var scores : Array[Score.LineScore] = []
	var grouping = get_verse_rhyme_group(verse)
	var relevancy = get_verse_relevancies(verse)
	var total := 0.0
	for idx in 4:
		var score = score_bar(verse.bars[idx])
		scores.append(score)
		score.group = rhyme_labels[grouping[idx]]
		total += score.score
	for topic in relevancy:
		if topic >= 2:
			total += topic * topic_factor
	total += rhyme_groupings["%s%s%s%s" % grouping] * rhyme_factor
	return Score.new(int(total), scores)

func meets_special_condition(verses: Array[Verse], scores: Array[Score]) -> bool:
	return condition_algo[condition].call(verses, scores)

# Each battle stores its score algorithm and that tells you
# what the special victory condition is.

func default(verses: Array[Verse], scores: Array[Score]):
	return true

 # func algo_(...):
