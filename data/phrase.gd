class_name Phrase
extends Resource

@export var text : String
@export var blanks : Array[Blank]

func _init(text_: String = "", blanks_: Array[Blank] = []):
	text = text_
	blanks = blanks_
