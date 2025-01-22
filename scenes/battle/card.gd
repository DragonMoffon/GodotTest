class_name Card
extends Node2D

@export var decay : float = 0.30

@onready
var body : Sprite2D = $"Body"

@onready
var label : Label = $"Label"

var target : Vector2

func create(body_texture: Texture, text: String) -> void:
	body.texture = body_texture
	label.text = text
	label.size = Vector2(body_texture.get_width(), body_texture.get_height())
	label.position = -label.size / 2.0

func _process(delta: float) -> void:
	self.position = Anim.slerp(self.position, target, decay, delta)
	if self.position.y > 10.0:
		self.body.scale.y = -1.0
	else:
		self.body.scale.y = 1.0
