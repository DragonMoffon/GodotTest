class_name Word
extends Resource

enum Type { NONE = 0, NOUN = 1, VERB = 2, ADJECTIVE = 4, ADVERB = 8, OTHER = 16 }
enum Rhyme { NONE, AIN, PLE, OKED, AD, ICKY, OU}
enum Sounds { NONE, ɑː, ɒ, æ, aɪ, aʊ, ɛ, eɪ, ɪ, iː, oʊ, ɔː, ɔɪ, ʊ, uː, ʌ, ə, i, u, əl, ən, əm, b, d, dj, dʒ, ð, f, ɡ, h, hw, j, k, l, lj, m, n, nj, ŋ, p, r, s, sj, ʃ, t, tj, tʃ, θ, θj, v, w, z, zj, ʒ}
enum Vowel { NONE, ɑː, ɒ, æ, aɪ, aʊ, ɛ, eɪ, ɪ, iː, oʊ, ɔː, ɔɪ, ʊ, uː, ʌ, ə, i, u, əl, ən, əm }

@export var text: String = ""
@export_flags("NOUN", "VERB", "ADJECTIVE", "ADVERB", "OTHER") var type = 0
@export var syllables: int = 0
@export var rhyme: Rhyme = Rhyme.NONE
@export var alliteration: Sounds = Sounds.NONE
@export var assonance: Vowel = Vowel.NONE
