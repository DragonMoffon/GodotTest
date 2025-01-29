extends Node2D

signal continue_pressed

@export
var instructions: Array[Texture2D]

@onready
var text := $Text

var idx = 0

func _ready():
	text.texture = instructions[0]

func _on_next_pressed():
	idx += 1
	if idx >= instructions.size():
		idx = 0
	text.texture = instructions[idx]
	
func _on_prev_pressed():
	idx -= 1
	if idx < 0:
		idx = instructions.size() - 1
	text.texture = instructions[idx]

func _on_continue_pressed():
	continue_pressed.emit()
