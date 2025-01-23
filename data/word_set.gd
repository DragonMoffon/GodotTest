class_name WordSet
extends Resource

@export var words : Array[StringName]

func _init(words_: Array[StringName] = []) -> void:
	var dict = load("res://data/dictionary.tres")
	words = []
	for word in words_:
		words.append(dict.words[word])
