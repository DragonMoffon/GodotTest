extends RichTextLabel

@onready
var alliteration_tag : Label = $Alliteration
@onready
var assonance_tag : Label = $Assonance
@onready
var rhyme_tag : Label = $Rhyme
@onready
var group_tag : Label = $Group
@onready
var score_tag : Label = $Score

func hide_labels():
	alliteration_tag.visible = false
	assonance_tag.visible = false
	rhyme_tag.visible = false
	group_tag.visible = false
	score_tag.visible = false

func set_labels(alliteration: bool = false, assonance: bool = false, rhyme: bool = false, group: String = "", score: int = 0):
	alliteration_tag.visible = alliteration
	assonance_tag.visible = assonance
	rhyme_tag.visible = rhyme
	group_tag.visible = group != ""
	score_tag.visible = score != 0
	
	group_tag.text = group
	score_tag.text = "%s" % [score]
