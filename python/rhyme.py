from nltk.corpus import cmudict, wordnet
import itertools 
import syllable as syllabifier  
#from nltk.corpus import cmudict
#cmu=cmudict.dict()
#rhymeToPro,pronunciationToWords=rhyme.getDictionariesNeededForRhyming(cmu)
#rgs=[rhyme.rhymeGroup(r,rhymeToPro,pronunciationToWords,syllabifier.syllabify) for r in rhymeToPro]
#multi=[r for r in rgs if rhyme.groupHasAtLeastOneDifference(r) and not(r.HasOneWord() or r.HasOnePronunciation())]
#multi=sorted(multi,key= lambda x: len(x.words))

import argparse
import sys
from json import dump, JSONEncoder

def getDictionariesNeededForRhyming(wordToPro=None):
    if wordToPro is None:
        wordToPro=cmudict.dict();
    rhymeToPro=dict()
    pronunciationToWord=dict()
    for key, value in wordToPro.items():
            for pr in value:
                pronunciation=tuple(pr)
                p=getUntilStressed(pr[::-1])[::-1]

                if p in rhymeToPro and rhymeToPro[p] is not None: 
                    rhymeToPro[p].add(pronunciation)
                else:
                    rhymeToPro[p]={pronunciation}

                if pronunciation in pronunciationToWord and pronunciationToWord[pronunciation] is not None:
                    pronunciationToWord[pronunciation].append(key)
                else:
                    pronunciationToWord[pronunciation]=[key]
    return rhymeToPro, pronunciationToWord;


def getUntilStressed(phonemes):
    result=list();
    for p in phonemes:
        result.append(p)
        if(p[-1]=='1'):
            break;
    return tuple(result);


def groupHasAtLeastOneDifference(rg):
    return any(SyllabificationsRhyme(pair[0],pair[1])for pair in itertools.combinations(rg.proToSyllables.values(),2))


def SyllabificationsRhyme(syllable1,syllable2): #assumes it's in the same rhymegroup
    seenStressed=False
    for s1,s2 in zip(syllable1[::-1],syllable2[::-1]):
        if(s1[0]==1):#if it is a stressed
            seenStressed=True
        if(seenStressed):
            if s1[1]!=s2[1] and s1[2]==s2[2] and s1[3]==s2[3]:
                return True;
            if s1[1]!=s2[1] or s1[2]!=s2[2] or s1[3]!=s2[3]:
                return False;
    return False


class RhymeGroup:
    def __init__(self,rhyme, rhymeToPros, proToWords, syllabification):
        self.rhyme=rhyme
        self.proToWords=dict()
        self.proToSyllables=dict()
        for pro in rhymeToPros[rhyme]:
            realPro=pro[::-1]#proToWords is reversed
            self.proToWords[realPro]=proToWords[pro]
            self.proToSyllables[realPro]=syllabification(realPro)
        self.words=set([w for words in list(self.proToWords.values()) for w in words])

    def __repr__(self):
        return str(self)

    def HasOneWord(self):
        return len(self.words)==1
    def HasOnePronunciation(self):
         return len(self.proToWords.keys())==1

    def __str__(self):
        string= "rhyme:"+str(self.rhyme)+"\npronunciations:\n"        
        for p in self.proToWords.keys():
            string=string+"\tpronunciation:"+str(p)+"\n"
            string=string+"\t"+str(self.proToSyllables[p])+"\n"
        string+="words:"+str(self.words)
        return string;


def main():
    word_to_pronounciation = cmudict.dict()
    rhyme_to_pronounciation, pronounciation_to_words = getDictionariesNeededForRhyming(word_to_pronounciation)
    pronounciation_to_rhymes = {}
    for rhyme, pronounciations in rhyme_to_pronounciation.items():
        r = "_".join(rhyme)
        for pronounciation in pronounciations:
            p = "_".join(pronounciation)
            pronounciation_to_rhymes[p] = r

    with open("wtp.json", "wt+") as fp:
        stringified = {word: list("_".join(p) for p in pronounciations) for word, pronounciations in word_to_pronounciation.items()}
        dump(stringified, fp, indent=4)
    
    with open("rtp.json", "wt+") as fp:
        stringified = {"_".join(rhyme): list("_".join(p) for p in pronounciations) for rhyme, pronounciations in rhyme_to_pronounciation.items()}
        dump(stringified, fp, indent=4)
    
    with open("ptw.json", "wt+") as fp:
        stringified = {"_".join(pronounciation): list(words) for pronounciation, words in pronounciation_to_words.items()}
        dump(stringified, fp, indent=4)

    with open("ptr.json", "wt+") as fp:
       dump(pronounciation_to_rhymes, fp, indent=4)


# If this module was run directly, print the total number of 
# rhyme groups in english
if __name__ == "__main__":
    main()
