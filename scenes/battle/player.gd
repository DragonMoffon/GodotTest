extends Node

@onready
var hands := $Hands

func _process(_dt: float) -> void:
	if Input.is_action_just_pressed("ScrollDown") or Input.is_action_just_pressed("ScrollUp"):
		hands.toggle()
	elif Input.is_action_just_pressed("Select"):
		hands.active_hand.add_card()
	elif Input.is_action_just_pressed("Deselect"):
		if hands.active_hand.cards.size() >= 1:
			hands.active_hand.remove_card(hands.active_hand.selected_card)
	elif Input.is_action_just_pressed("ScrollNext"):
		hands.select_next()
	elif Input.is_action_just_pressed("ScrollPrev"):
		hands.select_prev()
