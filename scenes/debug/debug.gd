extends Node

var words : Array[Word] = [
	Word.new("fuck", Word.Type.VERB, 1, Word.Rhyme.UCK, Word.Sounds.f, Word.Vowel.ʌ, Word.Group.YOU),
	Word.new("homies", Word.Type.NOUN, 2, Word.Rhyme.EE, Word.Sounds.h, Word.Vowel.ɒ, Word.Group.ME),
	Word.new("and", Word.Type.OTHER, 1, Word.Rhyme.AND, Word.Sounds.æ, Word.Vowel.æ, Word.Group.NONE),
	Word.new("bet", Word.Type.VERB, 1, Word.Rhyme.ET, Word.Sounds.b, Word.Vowel.e, Word.Group.NONE),
	Word.new("i", Word.Type.NOUN, 1, Word.Rhyme.HY, Word.Sounds.aɪ, Word.Vowel.aɪ),  # Word.Group.ME
	Word.new("i'd", Word.Type.OTHER, 1, Word.Rhyme.IED, Word.Sounds.aɪ, Word.Vowel.aɪ),  # Word.Group.ME
	Word.new("i'll", Word.Type.OTHER, 1, Word.Rhyme.ILL, Word.Sounds.aɪ, Word.Vowel.aɪ),  # Word.Group.ME
	Word.new("i'm", Word.Type.OTHER, 1, Word.Rhyme.IM, Word.Sounds.aɪ, Word.Vowel.aɪ),  # Word.Group.ME
	Word.new("only", Word.Type.OTHER, 1, Word.Rhyme.ONLY, Word.Sounds.oʊ, Word.Vowel.oʊ),  # Word.Group.ME
	Word.new("stop", Word.Type.VERB, 1, Word.Rhyme.OP, Word.Sounds.s, Word.Vowel.ɒ),  # Word.Group.NONE
	Word.new("take", Word.Type.VERB, 1, Word.Rhyme.AKE, Word.Sounds.t, Word.Vowel.eɪ),  # Word.Group.NONE
	Word.new("where", Word.Type.ADVERB, 1, Word.Rhyme.AIR, Word.Sounds.hw, Word.Vowel.e),  # Word.Group.NONE
	Word.new("why", Word.Type.ADVERB, 1, Word.Rhyme.HY, Word.Sounds.hw, Word.Vowel.aɪ),  # Word.Group.NONE
	Word.new("you're", Word.Type.OTHER, 2, Word.Rhyme.URE, Word.Sounds.j, Word.Vowel.ɔː),  # Word.Group.YOU
	Word.new("your", Word.Type.OTHER, 1, Word.Rhyme.URE, Word.Sounds.j, Word.Vowel.ɔː),  # Word.Group.YOU
	Word.new("a", Word.Type.OTHER, 1, Word.Rhyme.AH, Word.Sounds.ə, Word.Vowel.ə),  # Word.Group.NONE
	Word.new("afford", Word.Type.VERB, 2, Word.Rhyme.ORD, Word.Sounds.ə, Word.Vowel.ɔː),  # Word.Group.MONEY
	Word.new("are", Word.Type.OTHER, 1, Word.Rhyme.ARE, Word.Sounds.ɑː, Word.Vowel.ɑː),  # Word.Group.NONE
	Word.new("as", Word.Type.OTHER, 1, Word.Rhyme.AZ, Word.Sounds.æ, Word.Vowel.æ),  # Word.Group.NONE
	Word.new("be", Word.Type.OTHER, 1, Word.Rhyme.EE, Word.Sounds.b, Word.Vowel.iː),  # Word.Group.NONE
	Word.new("being", Word.Type.VERB, 1, Word.Rhyme.EING, Word.Sounds.b, Word.Vowel.iː),  # Word.Group.NONE
	Word.new("better", Word.Type.ADJECTIVE, 2, Word.Rhyme.ETTER, Word.Sounds.b, Word.Vowel.e),  # Word.Group.ME
	Word.new("born", Word.Type.VERB, 1, Word.Rhyme.ORN, Word.Sounds.b, Word.Vowel.ɔː),  # Word.Group.NONE
	Word.new("broke", Word.Type.ADJECTIVE, 1, Word.Rhyme.OKE, Word.Sounds.b, Word.Vowel.oʊ),  # Word.Group.MONEY
	Word.new("cannot", Word.Type.OTHER, 2, Word.Rhyme.OT, Word.Sounds.k, Word.Vowel.æ),  # Word.Group.NONE
	Word.new("can't", Word.Type.OTHER, 1, Word.Rhyme.ANT, Word.Sounds.k, Word.Vowel.æ),  # Word.Group.NONE
	Word.new("child", Word.Type.OTHER, 1, Word.Rhyme.ILD, Word.Sounds.tʃ, Word.Vowel.aɪ),  # Word.Group.PEOPLE
	Word.new("cooler", Word.Type.OTHER, 2, Word.Rhyme.OLER, Word.Sounds.k, Word.Vowel.uː),  # Word.Group.ME
	Word.new("could", Word.Type.OTHER, 1, Word.Rhyme.OULD, Word.Sounds.k, Word.Vowel.ʊ),  # Word.Group.ME
	Word.new("couldn't", Word.Type.OTHER, 2, Word.Rhyme.INT, Word.Sounds.k, Word.Vowel.ʊ),  # Word.Group.YOU
	Word.new("did", Word.Type.OTHER, 1, Word.Rhyme.ID, Word.Sounds.d, Word.Vowel.ɪ),  # Word.Group.NONE
	Word.new("drove", Word.Type.OTHER, 1, Word.Rhyme.OVE, Word.Sounds.d, Word.Vowel.oʊ),  # Word.Group.CAR
	Word.new("even", Word.Type.OTHER, 1, Word.Rhyme.EVEN, Word.Sounds.iː, Word.Vowel.ə),  # Word.Group.NONE
	Word.new("ever", Word.Type.OTHER, 1, Word.Rhyme.EVER, Word.Sounds.e, Word.Vowel.ə),  # Word.Group.NONE
	Word.new("fake", Word.Type.OTHER, 1, Word.Rhyme.AKE, Word.Sounds.f, Word.Vowel.eɪ),  # Word.Group.YOU
	Word.new("for", Word.Type.OTHER, 1, Word.Rhyme.OR, Word.Sounds.f, Word.Vowel.ɔː),  # Word.Group.NONE
	Word.new("haircut", Word.Type.OTHER, 2, Word.Rhyme.UT, Word.Sounds.h, Word.Vowel.e),  # Word.Group.STYLE
	Word.new("head", Word.Type.OTHER, 1, Word.Rhyme.ED, Word.Sounds.h, Word.Vowel.e),  # Word.Group.STYLE
	Word.new("hell,", Word.Type.OTHER, 1, Word.Rhyme.ELL, Word.Sounds.h, Word.Vowel.e),  # Word.Group.PLACE
	Word.new("here", Word.Type.OTHER, 1, Word.Rhyme.EAR, Word.Sounds.h, Word.Vowel.e),  # Word.Group.PLACE
	Word.new("in", Word.Type.OTHER, 1, Word.Rhyme.IN, Word.Sounds.ɪ, Word.Vowel.ɪ),  # Word.Group.NONE
	Word.new("lamer", Word.Type.OTHER, 2, Word.Rhyme.AMER, Word.Sounds.l, Word.Vowel.eɪ),  # Word.Group.YOU
	Word.new("like", Word.Type.OTHER, 1, Word.Rhyme.IKE, Word.Sounds.l, Word.Vowel.ɪ),  # Word.Group.NONE
	Word.new("look", Word.Type.OTHER, 1, Word.Rhyme.OOK, Word.Sounds.l, Word.Vowel.ʊ),  # Word.Group.SENSE
	Word.new("looks", Word.Type.OTHER, 1, Word.Rhyme.OOK, Word.Sounds.l, Word.Vowel.ʊ),  # Word.Group.NONE
	Word.new("love", Word.Type.OTHER, 1, Word.Rhyme.UVE, Word.Sounds.l, Word.Vowel.ʌ),  # Word.Group.ME
	Word.new("me", Word.Type.OTHER, 1, Word.Rhyme.EE, Word.Sounds.m),  # Word.Group.ME
	Word.new("momma", Word.Type.OTHER, 2, Word.Rhyme.AA, Word.Sounds.m),  # Word.Group.PEOPLE
	Word.new("my", Word.Type.OTHER, 1, Word.Rhyme.HY, Word.Sounds.m),  # Word.Group.ME
	Word.new("of", Word.Type.OTHER, 1, Word.Rhyme.OF, Word.Sounds.ɒ),  # Word.Group.NONE
	Word.new("rather", Word.Type.OTHER, 2, Word.Rhyme.ATHER, Word.Sounds.r),  # Word.Group.NONE
	Word.new("real", Word.Type.OTHER, 1, Word.Rhyme.EAL, Word.Sounds.r),  # Word.Group.ME
	Word.new("see", Word.Type.OTHER, 1, Word.Rhyme.EE, Word.Sounds.s),  # Word.Group.SENSE
	Word.new("seem", Word.Type.OTHER, 1, Word.Rhyme.EEM, Word.Sounds.s),  # Word.Group.NONE
	Word.new("shoes", Word.Type.OTHER, 1, Word.Rhyme.EW, Word.Sounds.ʃ),  # Word.Group.STYLE
	Word.new("smarter", Word.Type.OTHER, 2, Word.Rhyme.ARTER, Word.Sounds.s),  # Word.Group.SMARTS
	Word.new("smell", Word.Type.OTHER, 1, Word.Rhyme.ELL, Word.Sounds.s),  # Word.Group.SENSE
	Word.new("so", Word.Type.OTHER, 1, Word.Rhyme.O, Word.Sounds.s),  # Word.Group.NONE
	Word.new("stupider", Word.Type.OTHER, 3, Word.Rhyme.UPIDER, Word.Sounds.s),  # Word.Group.SMARTS
	Word.new("taking", Word.Type.OTHER, 2, Word.Rhyme.AKING, Word.Sounds.t),  # Word.Group.NONE
	Word.new("than", Word.Type.OTHER, 1, Word.Rhyme.AN, Word.Sounds.ð),  # Word.Group.NONE
	Word.new("the", Word.Type.OTHER, 1, Word.Rhyme.UH, Word.Sounds.ð),  # Word.Group.NONE
	Word.new("those", Word.Type.OTHER, 1, Word.Rhyme.OSE, Word.Sounds.ð),  # Word.Group.NONE
	Word.new("you'll", Word.Type.OTHER, 1, Word.Rhyme.ULL, Word.Sounds.j),  # Word.Group.YOU
	Word.new("by", Word.Type.OTHER, 1, Word.Rhyme.HY, Word.Sounds.b),  # Word.Group.NONE
	Word.new("brain", Word.Type.NOUN, 1, Word.Rhyme.AIN, Word.Sounds.b, Word.Vowel.aɪ),  # Word.Group.SMARTS
	Word.new("truck", Word.Type.NOUN, 1, Word.Rhyme.UCK, Word.Sounds.t),  # Word.Group.CAR
	Word.new("duck", Word.Type.NOUN, 1, Word.Rhyme.UCK, Word.Sounds.d),  # Word.Group.ANIMAL
	Word.new("brick", Word.Type.NOUN, 1, Word.Rhyme.ICK, Word.Sounds.b),  # Word.Group.OBJECT
	Word.new("fish", Word.Type.NOUN, 1, Word.Rhyme.ISH, Word.Sounds.f),  # Word.Group.ANIMAL
	Word.new("garbage", Word.Type.NOUN, 2, Word.Rhyme.AGE, Word.Sounds.g),  # Word.Group.TRASH
	Word.new("dumpster", Word.Type.NOUN, 2, Word.Rhyme.UMPSTER, Word.Sounds.d),  # Word.Group.TRASH
	Word.new("cheese", Word.Type.NOUN, 1, Word.Rhyme.EESE, Word.Sounds.tʃ),  # Word.Group.FOOD
	Word.new("L", Word.Type.NOUN, 1, Word.Rhyme.ELL, Word.Sounds.e),  # Word.Group.YOU
	Word.new("you", Word.Type.NOUN, 1, Word.Rhyme.OU, Word.Sounds.j),  # Word.Group.YOU
	Word.new("anyone", Word.Type.NOUN, 2, Word.Rhyme.ONE, Word.Sounds.e),  # Word.Group.PEOPLE
	Word.new("loser", Word.Type.NOUN, 2, Word.Rhyme.OSER, Word.Sounds.l),  # Word.Group.YOU
	Word.new("winner", Word.Type.NOUN, 2, Word.Rhyme.INNER, Word.Sounds.w),  # Word.Group.ME
	Word.new("dinner", Word.Type.NOUN, 2, Word.Rhyme.INNER, Word.Sounds.d),  # Word.Group.FOOD
	Word.new("chicken", Word.Type.NOUN, 2, Word.Rhyme.ICKEN, Word.Sounds.tʃ),  # Word.Group.FOOD
	Word.new("potato", Word.Type.NOUN, 3, Word.Rhyme.ATO, Word.Sounds.p),  # Word.Group.FOOD
	Word.new("tomato", Word.Type.NOUN, 3, Word.Rhyme.ATO, Word.Sounds.t),  # Word.Group.FOOD
	Word.new("water", Word.Type.NOUN, 2, Word.Rhyme.ATER, Word.Sounds.w),  # Word.Group.FOOD
	Word.new("father", Word.Type.NOUN, 2, Word.Rhyme.ATHER, Word.Sounds.f),  # Word.Group.PEOPLE
	Word.new("mother", Word.Type.NOUN, 2, Word.Rhyme.OTHER, Word.Sounds.m),  # Word.Group.PEOPLE
	Word.new("sister", Word.Type.NOUN, 2, Word.Rhyme.ISTER, Word.Sounds.s),  # Word.Group.PEOPLE
	Word.new("brother", Word.Type.NOUN, 2, Word.Rhyme.OTHER, Word.Sounds.b),  # Word.Group.PEOPLE
	Word.new("fool", Word.Type.NOUN, 1, Word.Rhyme.OOL, Word.Sounds.f),  # Word.Group.YOU
	Word.new("school", Word.Type.NOUN, 1, Word.Rhyme.OOL, Word.Sounds.s),  # Word.Group.SMARTS
	Word.new("tool", Word.Type.NOUN, 1, Word.Rhyme.OOL, Word.Sounds.t),  # Word.Group.OBJECT
	Word.new("bars", Word.Type.NOUN, 1, Word.Rhyme.AR, Word.Sounds.b),  # Word.Group.RAP
	Word.new("cars", Word.Type.NOUN, 1, Word.Rhyme.AR, Word.Sounds.k),  # Word.Group.CAR
	Word.new("flows", Word.Type.NOUN, 1, Word.Rhyme.OW, Word.Sounds.f),  # Word.Group.RAP
	Word.new("lyrics", Word.Type.NOUN, 2, Word.Rhyme.YRIC, Word.Sounds.l),  # Word.Group.RAP
	Word.new("Rhymes", Word.Type.NOUN, 1, Word.Rhyme.YME, Word.Sounds.r),  # Word.Group.RAP
	Word.new("songs", Word.Type.NOUN, 1, Word.Rhyme.ONG, Word.Sounds.s),  # Word.Group.RAP
	Word.new("verses", Word.Type.NOUN, 2, Word.Rhyme.ERSE, Word.Sounds.v),  # Word.Group.RAP
	Word.new("fan", Word.Type.NOUN, 1, Word.Rhyme.AN, Word.Sounds.f),  # Word.Group.PEOPLE
	Word.new("dog", Word.Type.NOUN, 1, Word.Rhyme.OG, Word.Sounds.d),  # Word.Group.ANIMAL
	Word.new("cat", Word.Type.NOUN, 1, Word.Rhyme.AT, Word.Sounds.k),  # Word.Group.ANIMAL
	Word.new("rat", Word.Type.NOUN, 1, Word.Rhyme.AT, Word.Sounds.r),  # Word.Group.ANIMAL
	Word.new("bat", Word.Type.NOUN, 1, Word.Rhyme.AT, Word.Sounds.b),  # Word.Group.ANIMAL
	Word.new("gun", Word.Type.NOUN, 1, Word.Rhyme.UN, Word.Sounds.g),  # Word.Group.VIOLENCE
	Word.new("knife", Word.Type.NOUN, 1, Word.Rhyme.IFE, Word.Sounds.n),  # Word.Group.VIOLENCE
	Word.new("ball", Word.Type.NOUN, 1, Word.Rhyme.ALL, Word.Sounds.b),  # Word.Group.OBJECT
	Word.new("pizza", Word.Type.NOUN, 2, Word.Rhyme.IZZA, Word.Sounds.p),  # Word.Group.FOOD
	Word.new("soda", Word.Type.NOUN, 2, Word.Rhyme.ODA, Word.Sounds.s),  # Word.Group.FOOD
	Word.new("burger", Word.Type.NOUN, 2, Word.Rhyme.URGER, Word.Sounds.b),  # Word.Group.FOOD
	Word.new("toaster", Word.Type.NOUN, 2, Word.Rhyme.OASTER, Word.Sounds.t),  # Word.Group.FOOD
	Word.new("blender", Word.Type.NOUN, 2, Word.Rhyme.ENDER, Word.Sounds.b),  # Word.Group.FOOD
	Word.new("microwave", Word.Type.NOUN, 3, Word.Rhyme.AVE, Word.Sounds.m),  # Word.Group.FOOD
	Word.new("fridge", Word.Type.NOUN, 1, Word.Rhyme.IDGE, Word.Sounds.f),  # Word.Group.FOOD
	Word.new("keyboard", Word.Type.NOUN, 2, Word.Rhyme.OARD, Word.Sounds.k),  # Word.Group.RAP
	Word.new("pen", Word.Type.NOUN, 1, Word.Rhyme.EN, Word.Sounds.p),  # Word.Group.RAP
	Word.new("pencil", Word.Type.NOUN, 1, Word.Rhyme.ENCIL, Word.Sounds.p),  # Word.Group.RAP
	Word.new("plane", Word.Type.NOUN, 1, Word.Rhyme.ANE, Word.Sounds.p),  # Word.Group.CAR
	Word.new("jet", Word.Type.NOUN, 1, Word.Rhyme.ET, Word.Sounds.dʒ),  # Word.Group.CAR
	Word.new("run", Word.Type.VERB, 1, Word.Rhyme.UN, Word.Sounds.r),  # Word.Group.ACTION
	Word.new("walk", Word.Type.VERB, 1, Word.Rhyme.ALK, Word.Sounds.w),  # Word.Group.ACTION
	Word.new("rap", Word.Type.VERB, 1, Word.Rhyme.AP, Word.Sounds.r),  # Word.Group.RAP
	Word.new("bounce", Word.Type.VERB, 1, Word.Rhyme.OUNCE, Word.Sounds.b),  # Word.Group.ACTION
	Word.new("play", Word.Type.VERB, 1, Word.Rhyme.AYE, Word.Sounds.p),  # Word.Group.ACTION
	Word.new("eat", Word.Type.VERB, 1, Word.Rhyme.EAT, Word.Sounds.iː),  # Word.Group.FOOD
	Word.new("drink", Word.Type.VERB, 1, Word.Rhyme.INK, Word.Sounds.d),  # Word.Group.FOOD
	Word.new("poop", Word.Type.VERB, 1, Word.Rhyme.OOP, Word.Sounds.p),  # Word.Group.TRASH
	Word.new("pee", Word.Type.VERB, 1, Word.Rhyme.EE, Word.Sounds.p),  # Word.Group.TRASH
	Word.new("learn", Word.Type.VERB, 1, Word.Rhyme.EARN, Word.Sounds.l),  # Word.Group.SMARTS
	Word.new("sing", Word.Type.VERB, 1, Word.Rhyme.ING, Word.Sounds.s),  # Word.Group.RAP
	Word.new("write", Word.Type.VERB, 1, Word.Rhyme.ITE, Word.Sounds.w),  # Word.Group.RAP
	Word.new("love", Word.Type.VERB, 1, Word.Rhyme.UVE, Word.Sounds.l),  # Word.Group.ME
	Word.new("hate", Word.Type.VERB, 1, Word.Rhyme.ATE, Word.Sounds.h),  # Word.Group.YOU
	Word.new("trash", Word.Type.VERB, 1, Word.Rhyme.ASH, Word.Sounds.t),  # Word.Group.TRASH
	Word.new("rapping", Word.Type.VERB, 2, Word.Rhyme.APPING, Word.Sounds.r),  # Word.Group.RAP
	Word.new("writing", Word.Type.VERB, 2, Word.Rhyme.ITING, Word.Sounds.w),  # Word.Group.RAP
	Word.new("winning", Word.Type.VERB, 2, Word.Rhyme.INNING, Word.Sounds.w),  # Word.Group.ME
	Word.new("losing", Word.Type.VERB, 2, Word.Rhyme.OSING, Word.Sounds.l),  # Word.Group.YOU
	Word.new("balling", Word.Type.VERB, 2, Word.Rhyme.ALLING, Word.Sounds.b),  # Word.Group.ME
	Word.new("pooping", Word.Type.VERB, 2, Word.Rhyme.OOPING, Word.Sounds.p),  # Word.Group.TRASH
	Word.new("peeing", Word.Type.VERB, 2, Word.Rhyme.EEING, Word.Sounds.p),  # Word.Group.TRASH
	Word.new("singing", Word.Type.VERB, 2, Word.Rhyme.INGING, Word.Sounds.s),  # Word.Group.RAP
	Word.new("eating", Word.Type.VERB, 2, Word.Rhyme.EATING, Word.Sounds.iː),  # Word.Group.FOOD
	Word.new("drinking", Word.Type.VERB, 2, Word.Rhyme.INKING, Word.Sounds.d),  # Word.Group.FOOD
	Word.new("loving", Word.Type.VERB, 2, Word.Rhyme.UVING, Word.Sounds.l),  # Word.Group.ME
	Word.new("hating", Word.Type.VERB, 2, Word.Rhyme.ATING, Word.Sounds.h),  # Word.Group.YOU
	Word.new("stinky", Word.Type.ADJECTIVE, 2, Word.Rhyme.INKY, Word.Sounds.s),  # Word.Group.TRASH
	Word.new("smelly", Word.Type.ADJECTIVE, 2, Word.Rhyme.ELLY, Word.Sounds.s),  # Word.Group.TRASH
	Word.new("awesome", Word.Type.ADJECTIVE, 2, Word.Rhyme.OME, Word.Sounds.ɔː),  # Word.Group.ME
	Word.new("greatest", Word.Type.ADJECTIVE, 2, Word.Rhyme.EATEST, Word.Sounds.g),  # Word.Group.ME
	Word.new("lamest", Word.Type.ADJECTIVE, 2, Word.Rhyme.AMEST, Word.Sounds.l),  # Word.Group.YOU
	Word.new("great", Word.Type.ADJECTIVE, 1, Word.Rhyme.EAT, Word.Sounds.g),  # Word.Group.ME
	Word.new("lame", Word.Type.ADJECTIVE, 1, Word.Rhyme.AME, Word.Sounds.l),  # Word.Group.YOU
	Word.new("stupid", Word.Type.ADJECTIVE, 2, Word.Rhyme.UPID, Word.Sounds.s),  # Word.Group.SMARTS
	Word.new("smoked", Word.Type.ADJECTIVE, 1, Word.Rhyme.OKED, Word.Sounds.s),  # Word.Group.NONE
	Word.new("silly", Word.Type.ADJECTIVE, 2, Word.Rhyme.ILLY, Word.Sounds.s),  # Word.Group.YOU
	Word.new("simple", Word.Type.ADJECTIVE, 1, Word.Rhyme.IMPLE, Word.Sounds.s),  # Word.Group.YOU
	Word.new("crazy", Word.Type.ADJECTIVE, 2, Word.Rhyme.AZY, Word.Sounds.k),  # Word.Group.YOU
	Word.new("amazing", Word.Type.ADJECTIVE, 2, Word.Rhyme.AZING, Word.Sounds.ə),  # Word.Group.ME
	Word.new("spooky", Word.Type.ADJECTIVE, 2, Word.Rhyme.OOKY, Word.Sounds.s),  # Word.Group.NONE
	Word.new("funny", Word.Type.ADJECTIVE, 2, Word.Rhyme.UNNY, Word.Sounds.f),  # Word.Group.ME
	Word.new("awful", Word.Type.ADJECTIVE, 2, Word.Rhyme.AWFUL, Word.Sounds.ɔː),  # Word.Group.YOU
	Word.new("terrible", Word.Type.ADJECTIVE, 3, Word.Rhyme.ERRIBLE, Word.Sounds.t),  # Word.Group.YOU
	Word.new("bad", Word.Type.ADJECTIVE, 1, Word.Rhyme.AD, Word.Sounds.b),  # Word.Group.YOU
	Word.new("good", Word.Type.ADJECTIVE, 1, Word.Rhyme.OOD, Word.Sounds.g),  # Word.Group.ME
	Word.new("so-so", Word.Type.ADJECTIVE, 2, Word.Rhyme.O, Word.Sounds.s),  # Word.Group.YOU
	Word.new("shocking", Word.Type.ADJECTIVE, 2, Word.Rhyme.OCKING, Word.Sounds.ʃ),  # Word.Group.ME
	Word.new("confusing", Word.Type.ADJECTIVE, 3, Word.Rhyme.USING, Word.Sounds.k),  # Word.Group.YOU
	Word.new("mediocre", Word.Type.ADJECTIVE, 4, Word.Rhyme.OCRE, Word.Sounds.m),  # Word.Group.YOU
	Word.new("mid", Word.Type.ADJECTIVE, 1, Word.Rhyme.ID, Word.Sounds.m),  # Word.Group.YOU
]

var phrase_set : Array[Phrase] = [
	Phrase.new("you look like a %s", [Blank.new(2)]),
	Phrase.new("you smell like a %s", [Blank.new(2)]),
	Phrase.new("i'd rather be %s", [Blank.new(1)]),
	Phrase.new("you're taking the %s", [Blank.new(1)]),
	Phrase.new("i'm better than %s", [Blank.new(2)]),
	Phrase.new("i'm cooler than %s", [Blank.new(2)]),
	Phrase.new("you're lamer than %s", [Blank.new(1)]),
	Phrase.new("i'm smarter than %s", [Blank.new(1)]),
	Phrase.new("you're stupider than %s", [Blank.new(1)]),
	Phrase.new("where did you %s ?", [Blank.new(1)]),
	Phrase.new("why are you %s ?", [Blank.new(1)]),
	Phrase.new("stop being %s", [Blank.new(2)]),
	Phrase.new("i'll %s you for real", [Blank.new(1)]),
	Phrase.new("you cannot %s me", [Blank.new(1)]),
	Phrase.new("take a %s %s", [Blank.new(1), Blank.new(1)]),
	Phrase.new("you are %s %s", [Blank.new(2), Blank.new(2)]),
	Phrase.new("you look like my %s", [Blank.new(1)]),
	Phrase.new("your momma so %s", [Blank.new(1)]),
	Phrase.new("%s", [Blank.new(2, Word.Type.NOUN | Word.Type.VERB | Word.Type.ADJECTIVE | Word.Type.ADVERB | Word.Type.OTHER)]),
	Phrase.new("and those shoes ? %s", [Blank.new(2)]),
	Phrase.new("only %s could be your fan", [Blank.new(1)]),
	Phrase.new("you can't even %s", [Blank.new(1)]),
	Phrase.new("you couldn't even afford %s", [Blank.new(1)]),
	Phrase.new("you seem like a love child born of %s", [Blank.new(2)]),
	Phrase.new("i see you drove here in a %s", [Blank.new(2)]),
	Phrase.new("you're fake as hell you'll only ever be a %s", [Blank.new(1)]),
	Phrase.new("you %s like a %s", [Blank.new(1), Blank.new(1)]),
	Phrase.new("smoked by the %s", [Blank.new(1)]),
	Phrase.new("fuck %s all my homies hate %s", [Blank.new(1), Blank.new(1)])
]

var word_set : Array[StringName] = [
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
]


func _ready() -> void:
	_find_amounts_alliteration()
	# var dict = DictData.new(words)
	# ResourceSaver.save(dict, "res://data/dictionary.tres")
	# var phrase_data = PhraseSet.new(phrase_set)
	# ResourceSaver.save(phrase_data, "res://data/base_phrases.tres")
	var word_data = WordSet.new(word_set)
	ResourceSaver.save(word_data, "res://data/base_words.tres")
	
func _find_amounts_rhyme():
	var amounts = {}
	for word in words:
		if word.rhyme not in amounts:
			amounts[word.rhyme] = [0]
		amounts[word.rhyme][0] += 1
		amounts[word.rhyme].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Rhyme.keys()[key], amounts[key].slice(1), amounts[key][0]])

func _find_amounts_alliteration():
	var amounts = {}
	for word in words:
		if word.alliteration not in amounts:
			amounts[word.alliteration] = [0]
		amounts[word.alliteration][0] += 1
		amounts[word.alliteration].append(word)
	
	for key in amounts.keys():
		print("%s: %s -> %s" % [Word.Sounds.keys()[key], amounts[key].slice(1), amounts[key][0]])
	
