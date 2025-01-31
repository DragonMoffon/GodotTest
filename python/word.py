from json import load
import sys
from syllable import syllabify
# A Tool for adding words

types = { "NONE" : 0, "NOUN" : 1, "VERB" : 2, "ADJ" : 4, "ADV" : 8, "OTHER" : 16 }
groups = [
	"NONE",
	"ME",
	"YOU",
	"MONEY",
	"PEOPLE",
	"VEHICLE",
	"STYLE",
	"PLACE",
	"SENSE",
	"SMARTS",
	"TRASH",
	"FOOD",
	"OBJECT",
	"RAP",
	"VIOLENCE",
	"ACTION",
	"QUESTION",
	"ANIMAL",
]
vowels = ['NONE', 'AA', 'AE', 'AH', 'AO', 'AW', 'AY', 'EH', 'ER', 'EY', 'IH', 'IY', 'OW', 'OY', 'UH', 'UW']
phonemes = ['NONE', 'AA', 'AE', 'AH', 'AO', 'AW', 'AY', 'EH', 'ER', 'EY', 'IH', 'IY', 'OW', 'OY', 'UH', 'UW', 'B', 'CH', 'D', 'DH', 'F', 'G', 'HH', 'JH', 'K', 'L', 'M', 'N', 'NG', 'P', 'R', 'S ', 'SH', 'T', 'TH', 'V', 'W', 'Y', 'Z', 'ZH']

# Phoneme Example Translation    Phoneme Example Translation
# ------- ------- -----------    ------- ------- -----------
# AA      odd     AA D           AE      at      AE T
# AH      hut     HH AH T        AO      ought   AO T
# AW      cow     K AW           AY      hide    HH AY D
# B       be      B IY           CH      cheese  CH IY Z
# D       dee     D IY           DH      thee    DH IY
# EH      Ed      EH D           ER      hurt    HH ER T
# EY      ate     EY T           F       fee     F IY
# G       green   G R IY N       HH      he      HH IY
# IH      it      IH T           IY      eat     IY T
# JH      gee     JH IY          K       key     K IY
# L       lee     L IY           M       me      M IY
# N       knee    N IY           NG      ping    P IH NG
# OW      oat     OW T           OY      toy     T OY
# P       pee     P IY           R       read    R IY D
# S       sea     S IY           SH      she     SH IY
# T       tea     T IY           TH      theta   TH EY T AH
# UH      hood    HH UH D        UW      two     T UW
# V       vee     V IY           W       we      W IY
# Y       yield   Y IY L D       Z       zee     Z IY
# ZH      seizure S IY ZH ER

word_set = {

"Truck",
"Duck",
"Brick",
"Fish",
"Garbage",
"Dumpster",
"Cheese",
"L",
"You",
"Me",
"Anyone",
"Loser",
"Winner",
"Dinner",
"Chicken",
"Potato",
"Tomato",
"Water",
"Father",
"Mother",
"Sister",
"Brother",
"Fool",
"School",
"Tool",
"Bars",
"Car",
"Flows",
"Rhymes",
"Lyrics",
"Songs",
"Verses",
"Dog",
"Cat",
"Rat",
"Gun",
"Bat",
"Knife",
"Ball",
"Pizza",
"Soda",
"Burger",
"Toaster",
"Blender",
"Microwave",
"Fridge",
"Keyboard",
"Pen",
"Pencil",
"Run",
"Walk",
"Rap",
"Bounce",
"Play",
"Eat",
"Drink",
"Poop",
"Pee",
"Learn",
"Sing",
"Write",
"Love",
"Hate",
"Trash",
"Plane",
"Jet",
"Rapping",
"Writing",
"Winning",
"Losing",
"Balling",
"Pooping",
"Peeing",
"Singing",
"Eating",
"Drinking",
"Loving",
"Hating",
"Stinky",
"Smelly",
"Awesome",
"Greatest",
"Lamest",
"Great",
"Lame",
"Stupid",
"SIlly",
"Crazy",
"Amazing",
"Spooky",
"Funny",
"Awful",
"Terrible",
"Bad",
"Good",
"Shocking",
"Confusing",
"Mediocre",
"So-so",
"Mid",
"die",
"try",
"buy",
"money",
"cash",
"honey",
"lunch",
"crunch",
"munch",
"bunch",
"scrunch",
"smell",
"taste",
"sand",
"canned",
"band",
"stand",
"choked",
"cooky",
"pet",
"wet",
"baguette",
"cigarette",
"debt",
"bye",
"fly",
"pigsty",
"lonely",
"phoney",
"onely",
"baloney",
"chop",
"flop",
"bop",
"mop",
"slop",
"glop",
"break",
"mistake",
"wake",
"shake",
"snake",
"cake",
"drake",
"flake",
"quake",
"bake",
"awake",
"care",
"hair",
"square",
"chair",
"affair",
"tear",
"glare",
"lair",
"foreswear",
"boor",
"lure",
"pore",
"gore",
"the",
"c.i.a",
"government",
"the man",
"f.b.i",
"record",
"ignored",
"sword",
"bored",
"gourd",
"discord",
"debtor",
"wetter",
"yarn",
"mourn",
"corn",
"stillborn",
"choke",
"croak",
"woke",
"bloke",
"mild",
"hog wild",
"stepchild",
"ruler",
"crueller",
"mewler",
"white collar criminal",
"skid",
"forbid",
"ferrofluid",
"Control",
"Dove",
"Butt",
"Cut",
"Strut",
"Mutt",
"Smut",
"Blowhead",
"Flathead",
"Lead",
"Dread",
"Cell",
"Smell",
"Lymph cell",
"Flamer",
"Disclaimer",
"Crooks",
"Meat hooks",
"Shove",
"Thereof",
"Self-love",
"Bereft of",
"Drama",
"Karma",
"Psychodrama",
"Sugar mama",
"Llama",
"Meal",
"Zeal",
"Stepfather ",
"Blues",
"Boos",
"Coups",
"Ruse",
"Shmooze",
"Spews",
"Martyr",
"Doh!",
"Jo-schmo",
"Cash flow",
"Possum",
"Blossom",
"Frog",
"Slog",
"Dirt hog",
"Foot clog",
"Monologue",
"Cheat",
"Greet",
"Tweet",
"Bleat",
"Back seat",
"Deadbeat",
"Dead meat",
"Petite",
"Wallstreet",
"Rap sheet",
"Wet feet",
"Obsolete",
"Toilet seat",
"Cant compete",
"Take a seat",
"Prongs",
"Wrongs",
"Gongs",
"Dongs",
"No cap",
"Yap",
"Snap",
"Booby trap",
"Flee",
"Flea",
"Pea",
"Weeeee!",
"Squee",
"Orange",
"Purple",
"Silly-billy",
"Willy-nilly",
"Beer",
"Biting",
"Lazy",
"Hazy",
"Think",
"Ink",
"Ant",
"Pants",
"Shirt",
"Skirt",
"Squirt",
"Flirt",
"Band",
"Hand",
"Man",
"Can",
"Pan",
"Ban",
"Ran",
"Miracle",
"Spiritual",
"Criminal",
"Infinity",
"Divinity",
"Affinity",
"Time",
"Sublime",
"Crime",
"Coke",
"Joke",
"Poke",
"Smoke",
"Broke",
"Dead",
"Bed",
"Red",
"Case",
"Mace",
"Face",
"Base",
"Erase",
"smoked",
"brain"
}

phrase_set = {
"You look like a %s",
"You smell like a %s",
"I'd rather be %s",
"You're taking the %s",
"I'm better than %s",
"I'm cooler than %s",
"You're lamer than %s",
"I'm smarter than %s",
"You're stupider than %s",
"Where did you %s ?",
"Why are you %s ?",
"Stop being %s",
"I'll %s you for real",
"You cannot %s me",
"Take a %s %s",
"You are %s %s",
"You look like my %s",
"Your momma so %s",
"%s",
"And those shoes ? %s",
"So broke , so %s",
"Your haircut look %s",
"Only %s could be your fan",
"You can't even %s",
"You couldn't even afford %s",
"Your head looks like a %s",
"Bet you couldn't even take a %s",
"You seem a love child born of %s",
"I see you drove here in a %s",
"You're fake as hell , you'll only ever be a %s",
"You %s like a %s",
"No %s ?",
"Take a %s and %s it",
"You make me wanna %s",
"You're like a %s",
"You're like a %s , %s",
"Eat my %s",
"I'm a lyrical %s",
"Don't make me %s you",
"You're scared of %s",
"I'll give you a %s",
"I'll take your %s",
"Your %s is a %s",
"I'm %s you for real",
"Eat your %s , %s",
"Drink a %s , %s",
"I see you have a %s",
"I'll put you in a %s",
"You end up with a %s",
"You'll end up in a %s",
"I'll end up with a %s",
"You won't be %s anymore",
"I'll always be %s",
"You'll never be %s",
"I'm 100% %s",
"You're 100% %s",
"Are you %s ?",
"You don't want to see me %s",
"I never wanna see you %s",
"You're the human version of %s",
"You're the love child of %s and %s",
"You look like you'd die to a %s",
"I'm like %s , you're like %s",
"Keep your head up , at least you %s",
"Bet your %s thought you could do better than this",
"On your tomb , they write %s",
"The paparazzi'd call you %s",
"If you had goons , they'd all be %s",
}

# words =  list(word.lower() for word in word_set.union( set(" ".join(phrase_set).split(" ")) ).difference( {"?", ",", ".", " ", "!", "%s", "%si"} ) )
# words.sort()

# phrase = "Word.new"
# t_str = "Word.Type"
# g_str = "Word.Group"
# r_str = "Word.Rhyme"
# all_str = "Word.Sounds"
# ass_str = "Word.Vowels"

p_str = "Phrase.new"
b_str = "Blank.new"
t_str = "Word.Type"

def main():
    with open("ptr.json") as fp:
        ptr: dict[str, str] = load(fp)
    with open("ptw.json") as fp:
        ptw: dict[str, list[str]] = load(fp)
    with open("rtp.json") as fp:
        rtp: dict[str, list[str]] = load(fp)
    with open("wtp.json") as fp:
        wtp: dict[str, list[str]] = load(fp)

    rhyme_ref = {}

    words = sorted(word_set)
    others = sorted(set(" ".join(phrase_set).split(" ")))

    every = sorted(words[:] + others[:])

    max_length = max(len(phrase) for phrase in phrase_set)

    incomplete = []

    fp = open("output.txt", "w+")
    sys.stdout = fp

    # for phrase in phrase_set:
    #     count = phrase.count("%s")
    #     blanks = f"[{', '.join(f"{b_str}(1, {t_str}.NONE)" for _ in range(count))}]"
    #     print(f"    {p_str}(\"{phrase}\",{" " * (max_length - len(phrase))} {blanks}),")

    # for word in every:
    #     word = word.lower()
    #     if word not in wtp:
    #         incomplete.append(word)
    #         continue
    #     p = wtp[word][0]
    #     assonance = [s for s in p.split("_") if "1" in s]
    #     if not assonance:
    #         assonance = [s for s in p.split("_") if "0" in s]
    #     ass = assonance[0].strip("1").strip("0")
    #     all = p.split("_")[0].strip("0").strip("1").strip("2")
    #     r = ptr[p]
    #     if r not in rhyme_ref:
    #         rhyme_ref[r] = word
    #     s = len(syllabify(p.split("_")))
    #     # print(f"    {phrase}(\"{word}\", {t_str}.NONE, {s}, {r_str}.{r}, {all_str}.{all}, {ass_str}.{ass}, {g_str}.NONE),")

    # print("incomplete words:")
    # print("\n".join(f"{phrase}(\"{word}\", {t_str}.NONE, {0}, {r_str}.NONE, {all_str}.NONE, {ass_str}.NONE, {g_str}.NONE)," for word in incomplete))
    # print("Rhyme Ref:")
    # print("\n".join(f"      \"{rhyme}\" : \"{ref}\"," for rhyme, ref in rhyme_ref.items()))
    # print("\n".join(f"  {rhyme}" for rhyme in rhyme_ref))
    # print("\n".join(f"  {p}," for p in vowels))

    string = "\t"+"\n\t".join(f"\"{s.lower()}\"," for s in sorted(word_set))
    #print(wtp["smoked"])
    print(string)



if __name__ == "__main__":
    main()