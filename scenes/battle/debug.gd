@tool
extends Polygon2D

@export
var parent : Node2D

func _on_ready():
	if not Engine.is_editor_hint():
		queue_free()

func _process(dt):
	self.position = Math.ellipse(parent.width, parent.height, deg_to_rad(parent.start + parent.range))
