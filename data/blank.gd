class_name Blank
extends Resource

# Blank Data??
@export var syllables : int
@export_flags("NOUN", "VERB", "ADJECTIVE", "ADVERB") var types : int
@export_flags("STUFF") var group : int

func _init(syllables_: int = 0, types_: Word.Type = Word.Type.NONE, group_: Word.Group = Word.Group.NONE):
	syllables = syllables_
	types = types_
	group = group_
	
