extends Node2D

signal continue_pressed

@export
var instructions: Array[Texture2D]

@onready
var text := $Text

@onready
var label := $Label

@onready
var cont := $Continue

var idx = 0

func _ready():
	text.texture = instructions[0]
	label.text = "%s/%s" % [idx + 1, instructions.size()]

func _on_next_pressed():
	idx += 1
	if idx >= instructions.size():
		idx = 0
	text.texture = instructions[idx]
	label.text = "%s/%s" % [idx + 1, instructions.size()]
	
func _on_prev_pressed():
	idx -= 1
	if idx < 0:
		idx = instructions.size() - 1
	text.texture = instructions[idx]
	label.text = "%s/%s" % [idx + 1, instructions.size()]

func _on_continue_pressed():
	cont.disabled = true
	continue_pressed.emit()
	
