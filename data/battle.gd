class_name Battle
extends Resource

var target_score: int
var battle_length: int

var algorithm : ScoreAlgorithm

func _init(target: int = 99, algorithm_ : ScoreAlgorithm = null) -> void:
	print(target)
	target_score = target
	
	if algorithm_ == null:
		algorithm_ = ScoreAlgorithm.new()
	algorithm = algorithm_
