from enum import StrEnum

def all_same(li):
    return len(set(li)) == 1

class WordType(StrEnum):
    NOUN = "NOUN"
    VERB = "VERB"
    ADJECTIVE = "ADJECTIVE"
    ADVERB = "ADVERB"

class Blank:
    def __init__(self, word_type: WordType, syllables: int = 0):
        self.word_type = word_type
        self.syllables = syllables

class Word:
    def __init__(self, word: str, word_type: WordType, syllables: int, rhyme_group: str, vowel_sounds: list[str]):
        self.word = word
        self.word_type = word_type
        self.syllables = syllables
        self.rhyme_group = rhyme_group
        self.vowel_sounds = vowel_sounds

class FillInCard:
    def __init__(self, *phrase: tuple[str, Blank]):
        self.phrase = phrase

    @property
    def blanks(self) -> tuple[Blank]:
        return tuple(i for i in self.phrase if isinstance(i, Blank))

    @property
    def blank_count(self) -> int:
        return len(self.blanks)
    
    def compatible(self, words: list[Word], strict: bool = False) -> bool:
        if self.blank_count != len(words):
            return False
        if strict:
            for blank, word in zip(self.blanks, words):
                if blank.syllables != 0 and blank.syllables != word.syllables:
                    return False
                if blank.word_type != word.word_type:
                    return False
        return True
    
    def score_words(self, words: list[Word]) -> int:
        score = 0
        for blank, word in zip(self.blanks, words):
            score += 100
            if blank.syllables != 0 and blank.syllables != word.syllables:
                score += 100
            if blank.word_type != word.word_type:
                score += 100

        if all_same(w.rhyme_group for w in words):
            score *= 1.5
        
        return score
    
class Bundle:
    def __init__(self, fill_in: FillInCard, words: list[Word]):
        self.fill_in = fill_in
        self.words = words

    def validate(self, strict: bool = False) -> bool:
        return self.fill_in.compatible(self.words, strict)