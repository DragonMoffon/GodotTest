class_name Phrase
extends Resource

@export var text = "":
	get:
		return text
	set(value):
		text = value
		blanks.resize(value.split(' ').count('%s'))
		
@export var blanks : Array[Blank]

var count = 0:
	get:
		return blanks.size()


func _init(text_: String = "", blanks_: Array[Blank] = []):
	blanks = blanks_
	text = text_
