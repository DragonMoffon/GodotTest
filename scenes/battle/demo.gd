extends Sprite2D

var time : float = 0.0

func _process(dt: float):
	time += dt
	self.scale = Vector2(1.05 + 0.05 * cos(4 * time * 2 * PI), 1.05 + 0.05*cos(4 * time * 2 * PI))
