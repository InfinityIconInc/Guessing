go :- guess(Animal),
write(Animal), nl, undo.

guess(cheetah) :- cheetah, !.
guess(zebra)   :- zebra, !.
guess(lion)    :- lion, !.
guess(elephant):- elephant, !.
guess(donkey)  :- donkey, !.
guess(horse)   :- horse, !.
guess(sheep)   :- sheep, !.
guess(cow)     :- cow, !.
guess(monkey)  :- monkey, !.

cheetah :- mammal, carnivore, verify(black_strips).
zebra   :- ungulate, verify(black_strips).
lion    :- mammal, carnivore, verify(long_hair_on_neck).
donkey  :- ungulate, verify(carry_load), verify(long_hair_on_neck).
horse   :- ungulate, verify(long_hair_on_neck).
cow     :- ungulate, verify(has_horns), verify(huge_body).
sheep   :- ungulate, verify(has_horns), verify(wool_on_body).
elephant:- ungulate, verify(trunk), verify(huge_body).
monkey  :- mammal, verify(long_tail), verify(tree_dwelling).

mammal  :- verify(has_hair), !.
mammal  :- verify(gives_milk), !.
carnivore :- verify(eats_meat), !.
carnivore :- verify(has_pointed_teeth), verify(has_forward_eyes).
ungulate  :- mammal, verify(has_hoofs).

ask(Q)  :- write(Q), write(?), nl, read(A), nl,
    (   (A==y;A==yes) -> assert(yes(Q));assert(no(Q)),fail).

:- dynamic yes/1,no/1.

verify(S) :- (yes(S) -> true; (no(S) -> fail; ask(S))).


undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.






