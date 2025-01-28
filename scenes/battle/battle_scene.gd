extends Node2D

@export
var turn_delay : float = 1.5

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

@onready
var player_character : CharacterSprite = $Characters/Player
@onready
var opponent_character : CharacterSprite = $Characters/Opponent

@onready
var bout_audio: AudioStreamPlayer2D = $Audio/Bout
@onready
var vs_audio: AudioStreamPlayer2D = $Audio/Vs

enum Turn { INSTRUCTIONS, BATTLE_CALLOUT, PLAYER_PICK, PLAYER_SING, ENEMY_PICK, ENEMY_SING, BOUT_CALLOUT, PLAYER_WIN, PLAYER_LOSE }

var turn := Turn.PLAYER_PICK

var player_data : Character = null
var enemy_data : Character = null
var battle_data : Battle = null

var player_score : int = 0
var bout : int = 0

func _ready() -> void:
	start(
		load('res://data/bouba.tres'),
		load('res://data/kiki.tres'),
		Battle.new()
	)

func start(player_data_: Character, enemy_data_: Character, battle_data_: Battle):
	# Player data has the details about the player's decks etc
	# Enemy data has the same details for the enemy
	# battle data has the details about the battle's score requirement etc
	player_data = player_data_
	enemy_data = enemy_data_
	battle_data = battle_data_
	
	bout = 1
	
	player_character.update_data(player_data_)
	opponent_character.update_data(enemy_data_)
	
	player.set_player(player_data_)
	opponent.set_data(enemy_data_)
	
	score.set_current(0)
	score.set_target(battle_data_.target_score)
	
	start_turn(Turn.BOUT_CALLOUT)
	
	condition.text = battle_data.algorithm.get_score_text()
	
func start_turn(turn_: Turn):
	turn = turn_
	match turn:
		Turn.INSTRUCTIONS:
			pass
		Turn.BATTLE_CALLOUT:
			pass
		Turn.PLAYER_PICK:
			lyrics.fade_in()
			player.enable()
			lyrics.clear()
			lyrics.set_current_phrase(player.get_selected_phrase())
			lyrics.set_current_words(player.get_selected_words())
		Turn.PLAYER_SING:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
			
			player_character.sing_verse(player.verses[-1])
		Turn.ENEMY_PICK:
			lyrics.fade_out()
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
			
			await get_tree().create_timer(turn_delay).timeout
			
			start_turn(Turn.ENEMY_SING)
		Turn.ENEMY_SING:
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
			
			var verse = opponent.get_verse()
			lyrics.set_verse(verse)
			lyrics.fade_in()
			opponent_character.sing_verse(verse)
		Turn.BOUT_CALLOUT:
			lyrics.fade_out()
			player.disable()
			player.deck.disable_commit()
			player.deck.disable_discard()
			
			bout_audio.start_bout(bout)
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
		var verse = lyrics.get_verse()
		player.verses.append(verse)
		score.set_current(player_score)
		
		start_turn(Turn.PLAYER_SING)
		player.discard_cards()
		player.refill_hand()
	else:
		player.discard_cards()


func _on_player_finished_line(line: int) -> void:
	if turn != Turn.PLAYER_SING:
		return
		
	lyrics.score_line(line, true, true, true, "A", 10)


func _on_player_finished_singing() -> void:
	if turn != Turn.PLAYER_SING:
		return
	lyrics.set_score(40)
	
	await get_tree().create_timer(turn_delay).timeout
	
	start_turn(Turn.ENEMY_PICK)


func _on_opponent_finished_line(line: int) -> void:
	if turn != Turn.ENEMY_SING:
		return
	# Maybe do a HypeCrew callout?


func _on_opponent_finished_singing() -> void:
	if turn != Turn.ENEMY_SING:
		return
	if bout >= 2:
		# Determine if the player has Won or not
		pass
	else:
		bout += 1
		start_turn(Turn.BOUT_CALLOUT)

func _on_bout_callout_finished() -> void:
	if turn != Turn.BOUT_CALLOUT:
		return
	start_turn(Turn.PLAYER_PICK)
