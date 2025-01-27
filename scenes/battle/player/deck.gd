class_name Deck
extends Sprite2D

signal play_clicked
signal discard_clicked

@onready
var play : TextureButton = $Buttons/Play
@onready
var discard : TextureButton = $Buttons/Discard
@onready
var discards : Label = $Buttons/Discards

@onready
var play_audio : AudioStreamPlayer2D = $Audio/Play
@onready
var discard_audio : AudioStreamPlayer2D = $Audio/Discard

var active := false

var can_commit := true
var can_discard := true

func enable_commit():
	can_commit = true
	play.disabled = false
	
func disable_commit():
	can_commit = false
	play.disabled = true

func enable_discard():
	can_discard = true
	discard.disabled = false
	
func disable_discard():
	can_discard = false
	discard.disabled = true
	
func enable():
	active = true
	if can_commit:
		play.disabled = false
	if can_discard:
		discard.disabled = false
	
func disable():
	active = false
	play.disabled = true
	discard.disabled = true
	
func play_play():
	play_audio.play()

func play_discard():
	discard_audio.play()

func set_discard_count(count: int):
	discards.text = "%s" % [count]
	
func _on_discard_pressed() -> void:
	discard_clicked.emit()

func _on_play_pressed() -> void:
	play_clicked.emit()
