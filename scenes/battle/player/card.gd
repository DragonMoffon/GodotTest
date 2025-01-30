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
@export var hovers : Array[AudioStream] = []
@export var click : Array[AudioStream] = []

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
var label : RichTextLabel = $"Hover/Control/Label"

@onready
var highlight : Sprite2D = $"Highlight"

@onready
var flip_sound : AudioStreamPlayer2D = $FlipSound

@onready
var control : Control = $Hover/Control

@onready
var bwomp : HBoxContainer = $Hover/Control/Bwomp

@onready
var type_labels : Array[Label] = [
	$Hover/Control/Bwomp/Label1,
	$Hover/Control/Bwomp/Label2,
	$Hover/Control/Bwomp/Label3
]

var target : Vector2
var content = null

var created : bool = false
var highlighted : bool = false
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
		
		bwomp.visible = false
		label.position += Vector2(0.0, 10.0)
	elif content_ is Word:
		font = word_font
		size = word_size
		
		type_labels[0].text = Word.Group.keys()[content_.group]
		type_labels[1].text = Word.Type.keys()[Word.Type.values().find(content_.type)]
		type_labels[2].text = "-%s" % [Word.Rhyme.keys()[content_.rhyme]]
		
	base_BBCode_text = base_BBCode_text % [color, font.resource_path, size, "%s"]
	content = content_
	update_text()
	
func flip():
	body.flip_h = not body.flip_h
	control.rotation = -control.rotation
	
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
	
func hover():
	highlighted = true
	highlight.visible = true
	shake()
	
	flip_sound.stream = hovers.pick_random()
	flip_sound.play()
	
func unhover():
	highlighted = false
	highlight.visible = false
	still()

func shake():
	shaking = true
	update_text()
	
func still():
	shaking = false
	update_text()
	
func select():
	body.select()
	
	flip_sound.stream = click.pick_random()
	flip_sound.play()

func deselect():
	body.deselect()

func _on_mouse_entered() -> void:
	card_entered.emit(self)

func _on_mouse_exited() -> void:
	card_exited.emit(self)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		card_clicked.emit(self, event.pressed)
