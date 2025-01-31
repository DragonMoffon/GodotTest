extends Control

@onready
var pl := $LstSelect/PL
@onready
var plm := $LstSelect/PLM
@onready
var ph := $LstSelect/PH
@onready
var phm := $LstSelect/PHM

@onready
var list_name := $WrdSelect/Lst
@onready
var word_name = $WrdSelect/Wrd

@onready
var word_type := $Edit/Type
@onready
var word_syllables := $Edit/Syllables
@onready
var word_rhyme := $Edit/Rhyme
@onready
var word_alliteration := $Edit/Alliteration
@onready
var word_assonance := $Edit/Assonance
@onready
var word_group := $Edit/Group

var word_list_name : String = ""
var word_list : DebugWordList = null

var word_idx : int = 0
var current_word : Word = null

func _ready():
	word_rhyme.clear()
	for rhyme in Word.Rhyme:
		word_rhyme.add_item(Word.RhymeRef[rhyme])
	
	word_alliteration.clear()
	for alliteration in Word.Sounds:
		word_alliteration.add_item(alliteration)
		
	word_assonance.clear()
	for assonance in Word.Vowels:
		word_assonance.add_item(assonance)
	
	word_group.clear()
	for group in Word.Group:
		word_group.add_item(group)

func change_list(list: String):
	if word_list != null:
		save_list(word_list, word_list_name)
	word_list_name = list
	word_list = load("res://scenes/debug/editor/%s.tres" % [word_list_name])
	
	list_name.text = word_list_name.replace("_", " ")
	
	word_idx = 0
	change_word(word_list.list[0])
	
func save_list(list: DebugWordList, name: String):
	ResourceSaver.save(word_list, "res://scenes/debug/editor/%s.tres" % [name])
	
func change_word(word: Word):
	if current_word != null:
		pass
	current_word = word
	word_name.text = current_word.text
	
	word_type.select(Word.Type.values().find(word.type))
	word_syllables.select(word.syllables)
	word_rhyme.select(word.rhyme)
	word_alliteration.select(word.alliteration)
	word_assonance.select(word.assonance)
	word_group.select(word.group)

func _on_pl_pressed() -> void:
	change_list("player_words")

func _on_plm_pressed() -> void:
	change_list("player_words_manual")

func _on_ph_pressed() -> void:
	change_list("phrase_words")

func _on_phm_pressed() -> void:
	change_list("phrase_words_manual")

func _on_next_word_pressed() -> void:
	if word_list == null:
		return
	
	word_idx += 1
	if word_idx >= word_list.list.size():
		word_idx = 0
	change_word(word_list.list[word_idx])

func _on_prev_word_pressed() -> void:
	if word_list == null:
		return

	word_idx -= 1
	if word_idx < 0:
		word_idx = word_list.list.size() - 1
	change_word(word_list.list[word_idx])


func _on_type_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.type = Word.Type.values()[index]


func _on_syllables_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.syllables = index


func _on_rhyme_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.rhyme = Word.Rhyme.values()[index]


func _on_alliteration_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.alliteration = Word.Sounds.values()[index]

func _on_assonance_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.assonance = Word.Vowels.values()[index]


func _on_group_item_selected(index: int) -> void:
	if current_word == null:
		return
		
	current_word.group = Word.Group.values()[index]


func _on_button_pressed() -> void:
	save_list(word_list, word_list_name)


func _on_delete_pressed() -> void:
	if current_word == null or word_list == null:
		return
	print(current_word.text)
	word_list.list.erase(current_word)
	_on_prev_word_pressed()
