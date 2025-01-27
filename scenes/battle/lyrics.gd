extends Node2D

@export var base_color : String = "black"
@export var current_color : String = "magenta"
@export var unset_color : String = "cyan"

@export var base_font : FontFile
@export var base_size : int
@export var inline_font : FontFile
@export var inline_size : int

@onready
var line_1 = $"Bars/VBoxContainer/1"
@onready
var line_2 = $"Bars/VBoxContainer/2"
@onready
var line_3 = $"Bars/VBoxContainer/3"
@onready
var line_4 = $"Bars/VBoxContainer/4"
@onready
var lines = [line_1, line_2, line_3, line_4]
var bars : Array[VerseBar] = [null, null, null, null]
var current_line = 0

var current_phrase: Phrase = null
var current_words: Array[Word] = []

var base_BBCode : String
var inline_BBCode : String
var empty_BBCode : String
var color_BBCode : String
var current_BBCode : String
var unset_BBCode : String

func _ready():
	base_BBCode = "[center][color=%s][font n='%s' s=%s]%s[/font][/color][/center]" % [base_color, base_font.resource_path, base_size, "%s"]
	inline_BBCode = "[font n='%s' s=%s]%s[/font]" % [inline_font.resource_path, inline_size, "%s"]
	empty_BBCode = base_BBCode % [inline_BBCode % ["[???]"]]
	color_BBCode = "[color=%s]%s[/color]"
	current_BBCode = color_BBCode % [current_color, inline_BBCode % ["[___]"]]
	unset_BBCode = color_BBCode % [unset_color, inline_BBCode % ["[___]"]]
	
	for line in lines:
		line.text = base_BBCode % empty_BBCode

func clear():
	for line in lines:
		line.text = empty_BBCode
	
	bars = [null, null, null, null]
	current_line = 0
	
	current_phrase = null
	current_words = []

func set_current_phrase(phrase: Phrase):
	current_phrase = phrase
	format_line()

func set_current_words(words: Array[Word]):
	current_words = words
	format_line()

func format_line():
	var line = lines[current_line]
	if current_phrase == null:
		line.text = empty_BBCode
		return
	var blanks: Array[Word] = current_words.duplicate()
	var inserts: Array[String] = []
	blanks.resize(current_phrase.count)
	inserts.resize(current_phrase.count)
	var current = true
	for idx in current_phrase.count:
		var word = blanks[idx]
		if word == null:
			inserts[idx] = current_BBCode if current else unset_BBCode
			current = false
		else:
			inserts[idx] = inline_BBCode % [word.text]
	line.text = base_BBCode % [current_phrase.text % inserts]

func has_full_bar() -> bool:
	if current_phrase == null:
		return false
	return current_phrase.count == current_words.size()

func get_bar() -> VerseBar:
	return VerseBar.new(current_phrase, current_words)
	
func commit_bar() -> VerseBar:
	if current_line >= 4:
		return null
	var bar = get_bar()
	bars[current_line] = bar
	current_line += 1
	
	current_phrase = null
	current_words = []
	return bar

func has_full_verse() -> bool:
	for bar in bars:
		if bar == null:
			return false
	return true
	
func get_verse() -> Verse:
	return Verse.new(bars)
