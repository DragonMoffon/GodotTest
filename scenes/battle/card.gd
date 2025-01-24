class_name Card
extends Node2D

@onready
var body : Sprite2D = $"Body"

@onready
var label : RichTextLabel = $"Label"

@export var decay : float = 0.30
@export var target : Vector2
@export var content = null

func create(body_texture: Texture, text_font: FontFile, content_, font_size: int = 32) -> void:
	content = content_
	body.texture = body_texture

	var formatted_text = "[center][color=black][font n=%s s=%s]%s[/font][/color][/center]" % [text_font.resource_path, font_size, content.text]
	if content is Phrase:
		var blanks_ = []
		blanks_.resize(content.blanks.size())
		blanks_.fill("[]")
		label.text = formatted_text % blanks_
	else:
		label.text = formatted_text
	label.size = Vector2(body_texture.get_width(), body_texture.get_height())
	label.position = Vector2(-label.size.x/2, 0)

func _process(delta: float) -> void:
	self.position = Anim.slerp(self.position, target, decay, delta)
