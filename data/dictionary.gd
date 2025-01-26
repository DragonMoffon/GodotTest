class_name DictData
extends Resource

@export var words : Dictionary # [StringName, Word]

func _init() -> void:
	words = {}
