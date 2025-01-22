class_name Anim

static func slerp(a, b, s: float, dt: float):
	return b + (a - b) * exp(-dt / s)
