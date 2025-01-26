class_name Dict

const _dict: DictData = preload("res://data/dictionary.tres")

static func fetch(word: StringName) -> Word:
	if word in _dict.words:
		return _dict.words[word]
	return null
