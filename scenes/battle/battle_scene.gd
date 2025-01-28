extends Node2D

@onready
var player : Player = $Player

@onready
var score = $ScoreCard

@onready
var lyrics = $Lyrics

@onready
var characters = $Characters

@onready
var opponent = $Opponent

@onready
var condition = $Condition

enum Turn { INSTRUCTIONS, PLAYER_PICK, PLAYER_SING, ENEMY_PICK, ENEMY_SING, PLAYER_WIN, PLAYER_LOSE }

var turn := Turn.PLAYER_PICK

var player_data : Character = null
var enemy_data : Character = null
var battle_data : Battle = null

var player_score : int = 0
var bout : int = 0

func _ready() -> void:
	start(
		Character.new(),
		Character.new(),
		Battle.new()
	)

func _process(dt: float) -> void:
	pass

func start(player_data_: Character, enemy_data_: Character, battle_data_: Battle):
	# Player data has the details about the player's decks etc
	# Enemy data has the same details for the enemy
	# battle data has the details about the battle's score requirement etc
	player_data = player_data_
	enemy_data = enemy_data_
	battle_data = battle_data_
	
	bout = 0
	
	player.set_player(player_data_)
	
	score.set_current(0)
	score.set_target(battle_data_.target_score)
	
	start_turn(Turn.PLAYER_PICK)
	
	condition.text = battle_data.algorithm.get_score_text()
	
func start_turn(turn_: Turn):
	turn = turn_
	match turn:
		Turn.INSTRUCTIONS:
			pass
		Turn.PLAYER_PICK:
			player.enable()
			lyrics.clear()
			lyrics.set_current_phrase(player.get_selected_phrase())
			lyrics.set_current_words(player.get_selected_words())
		Turn.PLAYER_SING:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
		Turn.ENEMY_PICK:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
		Turn.ENEMY_SING:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
		Turn.PLAYER_WIN:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
		Turn.PLAYER_LOSE:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()

func _on_player_phrase_selected(phrase: Phrase) -> void:
	if turn != Turn.PLAYER_PICK:
		return
		
	lyrics.set_current_phrase(phrase)
	lyrics.set_current_words(player.get_selected_words())
	
	if lyrics.has_full_bar():
		player.deck.enable_commit()
	else:
		player.deck.disable_commit()
		
	if player.get_cards_selected():
		player.deck.enable_discard()
	else:
		player.deck.disable_discard()

func _on_player_words_selected(words: Array[Word]) -> void:
	if turn != Turn.PLAYER_PICK:
		return

	lyrics.set_current_words(words)

	if lyrics.has_full_bar():
		player.deck.enable_commit()
	else:
		player.deck.disable_commit()
		
	if player.get_cards_selected():
		player.deck.enable_discard()
	else:
		player.deck.disable_discard()
		

func _on_discard_selected() -> void:
	if turn != Turn.PLAYER_PICK or player.discards <= 0:
		return

	var phrase_count = player.phrase_hand.selected.size()
	var word_count = player.word_hand.selected.size()
	
	if phrase_count == 0 and word_count == 0:
		return
		
	player.deck.play_discard()
	
	player.discard_cards()
	player.draw_phrases(phrase_count)
	player.draw_words(word_count)
	
	player.discards -= 1
	player.deck.set_discard_count(player.discards)
	
	if player.discards <= 0:
		player.deck.disable_discard()
	

func _on_play_selected() -> void:
	if not lyrics.has_full_bar():
		return
	
	lyrics.commit_bar()
	player.deck.play_play()
	
	if lyrics.has_full_verse():
		print('FULL VERSE!')
		var verse = lyrics.get_verse()
		player.verses.append(verse)
		player_score += battle_data.algorithm.score_verse(verse)
		score.set_current(player_score)
		
		start_turn(Turn.PLAYER_SING)
		player.discard_cards()
		player.refill_hand()
	else:
		player.discard_cards()
	
