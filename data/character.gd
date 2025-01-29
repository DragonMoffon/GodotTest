class_name Character
extends Resource

@export
var animations: SpriteFrames = null
@export
var voice: Array[AudioStream] = []
@export 
var rhymes: Array[AudioStream] = []
@export
var intro: AudioStream = null
@export
var pitch: float = 1.0
@export
var pitch_variation: float = 0.05

@export
var phrase_deck: PhraseSet = null
@export
var word_deck: WordSet = null

@export
var phrase_size: int = 8
@export
var word_size: int = 10

@export
var discard_count: int = 8
