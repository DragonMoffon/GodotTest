extends Node2D

@onready
var player = $Player

@onready
var score = $ScoreCard

@onready
var characters = $Characters

@onready
var oponent = $Opponent

enum TURN { INSTRUCTIONS, PLAYER_PICK, PLAYER_SING, ENEMY_PICK, ENEMY_SING, PLAYER_WIN, PLAYER_LOSE }

var player_data = null
var battle_data = null
var player_character = null
var enemy_character = null


func _ready() -> void:
	score.set_target(99)
	
	score.set_current(99, true)

func _process(_dt: float) -> void:
	pass

func start(player_data_, battle_data_, player_character_, enemy_character_):
	# Player data has the details about the player's decks etc
	# battle data has the details about the battle's score requirement etc
	pass
