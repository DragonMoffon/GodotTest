extends Node2D

@onready
var line_1 = $"Bars/VBoxContainer/1"
@onready
var line_2 = $"Bars/VBoxContainer/2"
@onready
var line_3 = $"Bars/VBoxContainer/3"
@onready
var line_4 = $"Bars/VBoxContainer/4"
@onready
var line_text = [line_1, line_2, line_3, line_4]
var bars : Array[VerseBar] = [null, null, null, null]
var verse : Verse
var current_line = 0

func commit_bar(bar: VerseBar):
	pass
	
func uncommit_bar(bar: VerseBar):
	pass
