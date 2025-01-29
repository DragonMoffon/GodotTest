extends ColorRect

signal hide_finished
signal show_finished

func cover():
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "color", Color.BLACK, 0.5)
	tween.play()
	await tween.finished
	hide_finished.emit()

func uncover():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "color", Color(0.0, 0.0, 0.0, 0.0), 0.5)
	tween.play()
	await tween.finished
	visible = false
	show_finished.emit()
