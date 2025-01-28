@tool
class_name WordSet
extends Resource

@export var words : Array[Word] 


func _init(words_: Array[StringName] = []) -> void:
	words.assign(words_.map(Dict.fetch))
