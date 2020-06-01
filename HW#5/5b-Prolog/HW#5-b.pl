man(ali). man(yunus). man(mehmet).
woman(zeynep). woman(elif). woman(nelin).

person(X):- (man(X);woman(X)).

uniq_(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

writeanswers(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study, Hammer, Gun, Chemical, Knife, Handsaw, WeldingMachine):- 
    nl,write("Rooms"),nl,
    write("Bathroom: "), write(Bathroom), nl,
    write("Dining: "), write(Dining), nl,
    write("Livingroom: "), write(Livingroom), nl, 
    write("Pantry: "), write(Pantry), nl,
    write("Study: "), write(Study), nl,
    write("Kitchen: "), write(Kitchen), nl,
	nl,write("Instruments"),nl,
    write("Knife: "), write(Knife), nl,
    write("Chemical: "), write(Chemical), nl,
    write("WeldingMachine: "), write(WeldingMachine), nl, 
    write("Handsaw: "), write(Handsaw), nl,
    write("Hammer: "), write(Hammer), nl,
    write("Gun: "), write(Gun), nl.

thief(X) :-
   uniq_(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study), 
   uniq_(Hammer, Gun, Chemical, Knife, Handsaw, WeldingMachine),
   man(Kitchen), \+Kitchen=Knife, \+Kitchen=Hammer, \+Kitchen=WeldingMachine , \+Kitchen=Gun,%clue 1
   (elif=Bathroom, zeynep=Study;elif=Study, zeynep=Bathroom),%clue 2
   \+elif=Hammer, \+ali=Hammer, \+Hammer=Bathroom, \+Hammer=Dining,%clue 3
   woman(WeldingMachine), WeldingMachine=Study,%clue 4 
   (Livingroom = mehmet;Livingroom = ali),%clue 5 
   \+Knife=Dining,%clue 6 
   \+zeynep=Pantry, \+zeynep=Study,%clue 7
   Gun=ali,%clue 8
   X = Handsaw, X = Pantry,%final statement
   
   write("Thief:"), write(X), nl, 
   writeanswers(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study, Hammer, Gun, Chemical, Knife, Handsaw, WeldingMachine).