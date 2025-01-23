extends Node

@export
var active_target : Vector2
@export
var inactive_target : Vector2

@export
var move_speed : float = 0.4
@export
var fade_speed : float = 0.1

@export
var phrase_hand : Hand
@export
var word_hand : Hand

var active_hand : Hand
var inactive_hand : Hand


func _ready():
	active_hand = phrase_hand
	inactive_hand = word_hand
	
	active_hand.activate()
	inactive_hand.deactivate()
	
func _process(dt: float):
	if Input.is_action_just_pressed("ScrollDown") or Input.is_action_just_pressed("ScrollUp"):
		toggle()
	
	active_hand.position = Anim.slerp(active_hand.position, active_target, move_speed, dt)
	inactive_hand.position = Anim.slerp(inactive_hand.position, inactive_target, move_speed, dt)
	
	active_hand.modulate.a = Anim.slerp(active_hand.modulate.a, 1.0, fade_speed, dt)
	inactive_hand.modulate.a = Anim.slerp(inactive_hand.modulate.a, 0.5, fade_speed, dt)

func toggle():
	var swap = active_hand
	active_hand = inactive_hand
	inactive_hand = swap
	
	active_hand.activate()
	inactive_hand.deactivate()
	
