from json import load
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
    "brain",
	"simple",
	"smoked",
	"truck",
	"duck",
	"brick",
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
	"Cars",
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
	"Silly",
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
    "Awake",
    "Care",
    "Hair",
    "Square",
    "Chair",
    "Affair",
    "Tear",
    "Glare",
    "Lair",
    "Foreswear",
    "Boor",
    "Lure",
    "Pore",
    "Gore",
    "The",
    "C.I.A",
    "Government",
    "The Man",
    "F.B.I",
    "Record",
    "Ignored",
    "Sword",
    "Bored",
    "Gourd",
    "Discord",
    "Debtor",
    "Wetter",
    "Yarn",
    "Mourn",
    "Corn",
    "Stillborn",
    "Choke",
    "Croak",
    "Woke",
    "Bloke",
    "Mild",
    "Hog Wild",
    "Stepchild",
    "Ruler",
    "Crueller",
    "Mewler",
    "Preschooler",
    "White collar criminal",
    "Skid",
    "Forbid",
    "Ferofluid",
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
}

phrase_set = {
    "you look like a %s",
    "you smell like a %s",
    "i'd rather be %s",
    "you're taking the %s",
    "i'm better than %s",
    "i'm cooler than %s",
    "you're lamer than %s",
    "i'm smarter than %s",
    "you're stupider than %s",
    "where did you %s ?",
    "why are you %s ?",
    "stop being %s",
    "i'll %s you for real",
    "you cannot %s me",
    "take a %s %s",
    "you are %s %s",
    "you look like my %s",
    "your momma so %s",
    "%s",
    "and those shoes ? %s",
    "only %s could be your fan",
    "you can't even %s",
    "you couldn't even afford %s", 
    "you seem like a love child born of %s"
    "i see you drove here in a %s",
    "you're fake as hell you'll only ever be a %s",
    "you %s like a %s",
    "smoked by the %s",
    "fuck %s all my homies hate %s"
}

# words =  list(word.lower() for word in word_set.union( set(" ".join(phrase_set).split(" ")) ).difference( {"?", ",", ".", " ", "!", "%s", "%si"} ) )
# words.sort()

phrase = "Word.new"
t_str = "Word.Type."
g_str = "Word.Group."
r_str = "Word.Rhyme"
all_str = "Word.Sounds."
ass_str = "Word.Vowels."

def main():
    with open("ptr.json") as fp:
        ptr: dict[str, str] = load(fp)
    with open("ptw.json") as fp:
        ptw: dict[str, list[str]] = load(fp)
    with open("rtp.json") as fp:
        rtp: dict[str, list[str]] = load(fp)
    with open("wtp.json") as fp:
        wtp: dict[str, list[str]] = load(fp)

    words = sorted(word_set)
    rhyme_groups = {}

    incomplete = []

    for word in words:
        word = word.lower()
        if word not in wtp:
            incomplete.append(word)
            continue
        p = wtp[word][0]
        assonance = [s for s in p if "1" in s]
        if not assonance:
            assonance = [s for s in p if "0" in s]
        ass = assonance[0].strip("1").strip("0")
        all = p[0].strip("0").strip("1")
        r = ptr[p]
        s = len(syllabify(p.split("_")))
        print(f"{phrase}(\"{word}\", {t_str}., {s}, {r_str}.{r}, {all_str}.{ass}, {ass_str}.{all}, {g_str}.),")




if __name__ == "__main__":
    main()