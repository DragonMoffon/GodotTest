class_name Word
extends Resource

enum Type { NONE = 0, NOUN = 1, VERB = 2, ADJECTIVE = 4, ADVERB = 8, OTHER = 16 }
enum Rhyme {
	NONE,
	AIN,
	PLE,
	OKED,
	AD,
	ICKY,
	OU,
	OK,
	IKE,
	OTHER,
	ETTER,
	ATHER,
	ARTER,
	AND,
	ET,
	IED,
	ILL,
	ONLY,
	OP,
	AKE,
	AIR,
	HY,
	URE,
	AYE,
	ORD,
	ARE,
	AZ,
	EE,
	EING,
	ORN,
	OKE,
	OT,
	ANT,
	ILD,
	OLER,
	OULD,
	INT,
	ID,
	UVE,
	OVE,
	EVEN,
	EVER,
	OR,
	UT,
	ED,
	ELL,
	EAR,
	IN,
	AMER,
	OOK,
	AA,
	OF,
	EAL,
	EEM,
	EW,
	O,
	UPIDER,
	UH,
	AKING,
	AN,
	OSE,
	ULL,
	OUR
}
enum Sounds { NONE, ɑː, ɒ, æ, aɪ, aʊ, ɛ, eɪ, ɪ, iː, oʊ, ɔː, ɔɪ, ʊ, uː, ʌ, ə, i, u, əl, ən, əm, b, d, dj, dʒ, ð, f, ɡ, h, hw, j, k, l, lj, m, n, nj, ŋ, p, r, s, sj, ʃ, t, tj, tʃ, θ, θj, v, w, z, zj, ʒ}
enum Vowel { NONE, ɑː, ɒ, æ, aɪ, aʊ, ɛ, eɪ, ɪ, iː, oʊ, ɔː, ɔɪ, ʊ, uː, ʌ, ə, i, u, əl, ən, əm }

@export var text: String = ""
@export_flags("NOUN", "VERB", "ADJECTIVE", "ADVERB", "OTHER") var type = 0
@export var syllables: int = 0
@export var rhyme: Rhyme = Rhyme.NONE
@export var alliteration: Sounds = Sounds.NONE
@export var assonance: Vowel = Vowel.NONE


func _init(text_: String = "", type_: Type = Type.NONE, syllables_: int = 0, rhyme_ : Rhyme = Rhyme.NONE, alliteration_ : Sounds = Sounds.NONE, assonance_ : Vowel = Vowel.NONE):
	text = text_.to_lower()
	type = type_
	syllables = syllables_
	rhyme = rhyme_
	alliteration = alliteration_
	assonance = assonance_
