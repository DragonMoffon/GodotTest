class_name Score
extends RefCounted

class LineScore extends RefCounted:
	var score: int
	var group: String
	var alliteration: bool
	var assonance: bool
	var rhyme: bool
	
	func _init(score_: int, group_: String, alliteration_: bool, assonance_: bool, rhyme_: bool):
		score = score_
		group = group_
		alliteration = alliteration_
		assonance = assonance_
		rhyme = rhyme_

var total: int
var grouping: String
var lines: Array[LineScore]

func _init(total_: int, lines_: Array[LineScore]):
	total = total_
	lines = lines_
