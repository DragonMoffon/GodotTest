class_name Verse
extends RefCounted

var bars : Array[VerseBar]

func _init(bars_ : Array[VerseBar] = []) -> void:
	bars = bars_
