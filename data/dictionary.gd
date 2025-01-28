class_name DictData
extends Resource

@export var words : Dictionary = {} # [StringName, Word]

func _init(words_: Array[Word] = []) -> void:
	for word in words_:
		print(word.text)
		words[word.text] = word
	print(words_)
