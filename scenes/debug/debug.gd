extends Node

func _ready():
	var words : WordSet = WordSet.new(['simple', 'brain'])
	ResourceSaver.save(words, "res://data/base_words.tres")
