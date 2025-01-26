extends Sprite2D

signal commit_clicked
signal discard_clicked

var active := false

var can_commit := true
var can_discard := true

func enable_commit():
	can_commit = true
	
func disable_commit():
	can_commit = false

func enable_discard():
	can_discard = true
	
func disable_discard():
	can_discard = false
	
func enable():
	active = true
	
func disable():
	active = false
