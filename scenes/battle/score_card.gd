extends Node2D

@onready
var target_text = $Control/Target

@onready
var current_text = $Control/Current

@export_file var font : String

const current_bbcode_txt := "[right][font n=%s s=130][color=%s]%s[/color][/font][/right]"
const shake_bbcode := "[shake rate=%s level=%s]%s[/shake]"

func set_target(score: int):
	target_text.text = "%s" % [score]
	
func set_current(score: int, is_shaking: bool = false, rate: float = 8.0, level: int = 5, color: String = "#FFFF00"):
	var text: String
	if is_shaking:
		text = shake_bbcode % [rate, level, score]
	else:
		text = "%s" % [score]
	
	current_text.text = current_bbcode_txt % [font, color, text]
