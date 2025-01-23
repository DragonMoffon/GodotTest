class_name Word
extends Resource

enum Type { NONE = 0, NOUN = 1, VERB = 2, ADJECTIVE = 4, ADVERB = 8 }

@export var text: String
@export_flags("NOUN", "VERB", "ADJECTIVE", "ADVERB") var type
@export var phonemes: String
@export var syllables: int

func _init(text_: String = "", phonemes_: String = "", type: Type = Type.NONE) -> void:
	text = text_
	phonemes = phonemes_
	syllables = phonemes_.split(" ").size()
