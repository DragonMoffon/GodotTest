class_name Card
extends Node2D

@onready
var body : Sprite2D = $"Body"

@onready
var label : Label = $"Label"

@export var decay : float = 0.30
@export var target : Vector2
@export var content = null

func create(body_texture: Texture, content_) -> void:
	content = content_
	body.texture = body_texture
	label.text = content.text
	if content is Phrase:
		var blanks_ = []
		blanks_.resize(content.blanks.size())
		blanks_.fill("[]")
		label.text = label.text % blanks_
	label.size = Vector2(body_texture.get_width(), body_texture.get_height())
	label.position = -label.size / 2.0
	label.pivot_offset = label.size / 2.0

func _process(delta: float) -> void:
	self.position = Anim.slerp(self.position, target, decay, delta)
