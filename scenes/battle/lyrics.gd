extends Node2D

@export var base_color : String = "black"
@export var current_color : String = "magenta"
@export var unset_color : String = "cyan"

@export var base_font : FontFile
@export var base_size : int
@export var inline_font : FontFile
@export var inline_size : int

@onready
var score_audio = $ScoreBam
@onready
var score_total = $Bars/Total

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
		line.hide_labels()
		line.text = empty_BBCode
	score_total.visible = false
	
	bars = [null, null, null, null]
	current_line = 0
	
	current_phrase = null
	current_words = []

func set_current_phrase(phrase: Phrase):
	current_phrase = phrase
	format_line(lines[current_line], current_phrase, current_words)

func set_current_words(words: Array[Word]):
	current_words = words
	format_line(lines[current_line], current_phrase, current_words)

func format_line(line: RichTextLabel, phrase, words):
	if phrase == null:
		line.text = empty_BBCode
		return
	var blanks: Array[Word] = words.duplicate()
	var inserts: Array[String] = []
	blanks.resize(phrase.count)
	inserts.resize(phrase.count)
	var current = true
	for idx in phrase.count:
		var word = blanks[idx]
		if word == null:
			inserts[idx] = current_BBCode if current else unset_BBCode
			current = false
		else:
			inserts[idx] = inline_BBCode % [word.text]
	line.text = base_BBCode % [phrase.text % inserts]

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

func set_verse(verse: Verse):
	clear()
	for idx in 4:
		var line = lines[idx]
		format_line(line, verse.bars[idx].phrase, verse.bars[idx].words)
	bars = verse.bars

func score_line(line: int = 0, alliteration: bool = false, assonance: bool = false, rhyme: bool = false, group: String = "", score: int = 0):
	lines[line].set_labels(alliteration, assonance, rhyme, group, score)
	score_audio.pitch_scale = 1.0 + line / 16.0
	score_audio.play()
	
func set_score(score: int):
	score_total.visible = true
	score_total.text = "%s" % [score]

func fade_out():
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(), 0.8).from(Vector2(1.0, 1.0))
	tween.tween_callback(func(): self.visible = false)
	
func fade_in():
	visible = true
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.8).from(Vector2(0.0, 0.0))
