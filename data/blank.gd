class_name Blank
extends Resource

# Blank Data??
@export var syllables : int
@export_flags("NOUN", "VERB", "ADJECTIVE", "ADVERB") var types : int

func _init(syllables_: int = 0, types_: Word.Type = Word.Type.NONE, group: Word.Group = Word.Group.NONE):
	syllables = syllables_
	types = types_
