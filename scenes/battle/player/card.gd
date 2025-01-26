class_name Card
extends Node2D

signal card_entered(card : Card)
signal card_exited(card : Card)
signal card_clicked(card : Card, pressed : bool)

@export_category("Customisation")
@export var decay : float = 0.30
@export var rate : float = 0.6
@export var level : int = 5
@export var color : String = "#000000"

@export_category("Font Data")
@export var phrase_font : FontFile
@export var phrase_size : int
@export var word_font : FontFile
@export var word_size : int
@export var inline_font : FontFile
@export var inline_size : int

@onready
var base_BBCode_text = "[center][color=%s][font n='%s' s=%s]%s[/font][/color][/center]"
@onready
var blank_BBCode_text = "[font n=%s s=%s][][/font]" % [inline_font.resource_path, inline_size]
@onready
var shake_BBCode_text = "[shake level=%s rate=%s]%s[/shake]" % [level, rate, "%s"]

@onready
var body : Sprite2D = $"Body"

@onready
var control : Control = $"Hover"

@onready
var label : RichTextLabel = $"Hover/Label"

@onready
var highlight : Sprite2D = $"Highlight"

var target : Vector2
var content = null

var created : bool = false
var selected : bool = false
var shaking : bool = false

func _process(delta: float) -> void:
	self.position = Anim.slerp(self.position, target, decay, delta)

func create(content_) -> void:
	if created:
		push_warning ("Attempting to create an already created card")
		return
	created = true

	var font : FontFile
	var size : int
	if content_ is Phrase:
		font = phrase_font
		size = phrase_size
	else:
		font = word_font
		size = word_size
	base_BBCode_text = base_BBCode_text % [color, font.resource_path, size, "%s"]
	content = content_
	update_text()
	
func flip():
	body.flip_h = not body.flip_h
	label.rotation = -label.rotation
	
func update_text():
	var text : String = base_BBCode_text
	if shaking:
		text = shake_BBCode_text % text
	
	if content is Phrase:
		var blanks_ = []
		blanks_.resize(content.blanks.size())
		blanks_.fill(blank_BBCode_text)
		label.text = text % (content.text % blanks_)
	else:
		label.text = text % content.text
	
func select():
	selected = true
	highlight.visible = true
	
func deselect():
	selected = false
	highlight.visible = false

func shake():
	shaking = true
	update_text()
	
func still():
	shaking = false
	update_text()		

func _on_mouse_entered() -> void:
	card_entered.emit(self)

func _on_mouse_exited() -> void:
	card_exited.emit(self)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		card_clicked.emit(self, event.pressed)
