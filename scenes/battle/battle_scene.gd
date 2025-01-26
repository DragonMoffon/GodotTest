extends Node2D

@onready
var player = $Player

@onready
var score = $ScoreCard

@onready
var lyrics = $Lyrics

@onready
var characters = $Characters

@onready
var oponent = $Opponent

enum TURN { INSTRUCTIONS, PLAYER_PICK, PLAYER_SING, ENEMY_PICK, ENEMY_SING, PLAYER_WIN, PLAYER_LOSE }

var turn := TURN.PLAYER_PICK

var player_data = null
var battle_data = null
var player_character = null
var enemy_character = null


func _ready() -> void:
	score.set_target(99)
	
	score.set_current(99, true)

func _process(_dt: float) -> void:
	pass

func start(player_data_: Character, enemy_data_: Character, battle_data_):
	# Player data has the details about the player's decks etc
	# Enemy data has the same details for the enemy
	# battle data has the details about the battle's score requirement etc
	pass


func _on_player_phrase_selected(phrase: Phrase) -> void:
	if turn == TURN.PLAYER_PICK:
		lyrics.set_current_phrase(phrase)


func _on_player_words_selected(words: Array[Word]) -> void:
	if turn == TURN.PLAYER_PICK:
		lyrics.set_current_words(words)
