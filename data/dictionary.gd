class_name DictData
extends Resource

@export var words : Dictionary = {} # [StringName, Word]

func _init(words_: Array[Word] = []) -> void:
	for word in words_:
		words[word.text] = word
