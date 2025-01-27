class_name Verse
extends RefCounted

var bars : Array[VerseBar]

func _init(bars_ : Array[VerseBar] = []) -> void:
	bars = bars_

func is_valid_verse() -> bool:
	if bars.size() != 4:
		return false
	for bar in bars:
		if bar == null:
			return false
	return true
