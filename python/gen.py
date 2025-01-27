from random import choice

options = []
for b in range(2):
    for c in range(b+2):
        for d in range(c+2):
           options.append(f"{0}{b}{c}{d}")
rhyme_groupings = {option: idx for idx, option in enumerate(options)}
rhymes = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

for x in range(100):
    group = choice(rhymes), choice(rhymes), choice(rhymes), choice(rhymes)
    unique = []
    for c in group:
        if c not in unique:
            unique.append(c)
    print(f"{"".join(group)} -> {"".join(str(unique.index(c)) for c in group)}")