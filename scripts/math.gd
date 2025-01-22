class_name Math

static func ellipse(a: float, b: float, t: float) -> Vector2:
	var x = a * cos(t)
	var y = b * sin(t)
	return Vector2(x, y)
