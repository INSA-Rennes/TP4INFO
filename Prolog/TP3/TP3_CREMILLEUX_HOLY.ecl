/**
TP Listes Prolog

@author Damien CRÉMILLEUX
@author Lauriane HOLY
@version Annee scolaire 2013/2014
*/

/* -------------------------------------------- Données -------------------------------------------- */
test1([1,2,3,4,5,6,7,8,9]).
test2([2,4,6,8]).
test3([2,2,2,3,4,9]).
test4([4,5,4,5,4,5,4]).
test5([2,4,6]).
test6([4,5,6]).
test7([4,5,4]).
test8([8,2,4,6,6,2,5]).
test9([10,12,15]).
test10([1,5,3]).
test11([5,4,7]).
/* -------------------------------------------- Règles -------------------------------------------- */

%% membre (?A,+X) : A est élément de la liste X
membre(Elem,[Elem|_]).
membre(Elem,[_|Rest]):-
        membre(Elem,Rest).

%% compte(+A, +X, ?N) : N est le nombre d'occurences de A dans la liste X.
compte(_,[],0).
compte(Occur,[Occur|Reste],NbOccur) :-
        compte(Occur,Reste,NbOccur1),
        NbOccur is NbOccur1+1.
compte(Occur,[Elem|Reste],NbOccur) :-
        \==(Elem,Occur),
        compte(Occur,Reste,NbOccur).

%% renverser(+X,?Y) : Y est la liste X à l'envers
renverser2([],A,A).
renverser2([Elem|L1],A,R) :- renverser2(L1,[Elem|A],R).

renverser(L,R) :- renverser2(L,[],R).

%% palind(+X) : X est une liste "palindrome"
palind(X) :- renverser(X,X).

%% nieme(+N,+X,-A) : A est l'élément de rang N dans la liste X.
%% Cette version focntionne aussi en version (-,+,+).
nieme(1,[Elem|_], Elem).
nieme(N,[_|Rest], A) :- 
        \==(N,1),
        nieme(N1,Rest,A),
        N is N1+1.

%% hors_de(+A,+X) : A n'est pas élément de liste X.
hors_de(_,[]).
hors_de(Elem,[First|Rest]) :-
        \==(Elem,First),
        hors_de(Elem,Rest).

%% tous_diff(+X)
tous_diff([]).
tous_diff([Elem|Rest]) :-
        hors_de(Elem,Rest),
        tous_diff(Rest).

%% conc3(+X,+Y,+Z,?T) : T est la concaténation des listes X, Y, Z.
%% Cette version focntionne aussi en version (-,-,-,+).
conc3([],[],Z,Z).
conc3([],[X|Rest],Z,[X|T]) :- conc3([],Rest,Z,T).
conc3([X|Rest],Y,Z,[X|T]) :- conc3(Rest,Y,Z,T).

%% debute_par(+X,?Y) : la liste X débute par Y.
debute_par(_,[]).
debute_par([Elem|RestX],[Elem|RestY]) :- debute_par(RestX,RestY).

%% sous_list(+X,?Y) : la liste Y est sous liste de la liste X.
sous_liste(List1, List2) :- debute_par(List1,List2).
sous_liste([_|L1], List2) :- sous_liste(L1,List2).

%% elim(+X,-Y) : la liste X étant donnée, on construit la liste Y qui contient tous les éléments de X une seule fois
elim(List1,List2) :- elim(List1,[],List2).
elim([],List,List).
elim([Elem|Rest],Acc,D) :- 
        hors_de(Elem, Acc),
        elim(Rest,[Elem|Acc],D).
elim([Elem|Rest],Acc,D) :-
        membre(Elem,Acc), 
        elim(Rest,Acc,D).


%% predicat auxiliaire inserer(+E,+L1,-L2)
inserer(E,[],[E]).
inserer(E,[Elem|Rest],[E,Elem|Rest]):-
        E=<Elem.
inserer(E,[Elem|Rest1],[Elem|L2]):-
        E>Elem,
        inserer(E,Rest1,L2).


%% tri(+X,-Y) : la liste Y est le résultat du tri par ordre croissant de la liste d'entiers X.
tri(L1,L2) :- tri(L1,[],L2).
tri([],List,List).
tri([Elem|RestL1],Accumulateur,Resul):-
        inserer(Elem,Accumulateur,ListTemp),
        tri(RestL1,ListTemp,Resul).

/********************************************************/

%% inclus(+X,+Y) : tous les éléments de l'ensemble X sont présents dans l'ensemble Y.

inclus([],_).
inclus([Elem|Rest],Y):-
        membre(Elem,Y),
        inclus(Rest,Y).

%% Non_inclus(+X,+Y) : au moins un élément de l'ensemble X est hors de l'ensemble Y.

non_inclus([Elem|_],Y):-
        hors_de(Elem,Y),
        !.
non_inclus([Elem|Rest],Y):-
        membre(Elem,Y),
        non_inclus(Rest,Y).


%% union_ens(+X,+Y,?Z) : Z est l'union ensembliste des ensembles X et Y.

union_ens([],Y,Y).
union_ens(X,[],X).
union_ens([Elem1|Rest1],Y,[Elem1|Rest2]):-
        hors_de(Elem1,Y),
        union_ens(Rest1,Y,Rest2).
union_ens([Elem1|Rest1],Y,Z):-
        membre(Elem1,Y),
        union_ens(Rest1,Y,Z).


%% inter_ens(+X,+Y,?Z) : Z est l'intersection ensembliste des ensembles X et Y.

inter_ens(X,Y,Z) :- inter_ens(X,Y,[],Z).
inter_ens([],_,Resul,Resul).
inter_ens([Elem1|Rest1],Y,Resul,Z):-
        membre(Elem1,Y),
        inter_ens(Rest1,Y,[Elem1|Resul],Z).
inter_ens([Elem1|Rest1],Y,Resul,Z):-
        hors_de(Elem1,Y),
        inter_ens(Rest1,Y,Resul,Z).


%% diff_ens(+X,+Y,?Z) : Z est la différence ensembliste des ensemble X et Y.
diff_ens(X,Y,Z) :- diff_ens(X,Y,[],Z).
diff_ens([],_,Resul,Resul).
diff_ens([Elem1|Rest1],Y,Resul,Z):-
        membre(Elem1,Y),
        diff_ens(Rest1,Y,Resul,Z).
diff_ens([Elem1|Rest1],Y,Resul,Z):-
        hors_de(Elem1,Y),
        diff_ens(Rest1,Y,[Elem1|Resul],Z).


/* -------------------------------------------- Tests -------------------------------------------- */

/* Question 1.1
- Données : listes de test,
- But : test1(X),membre(1,X).
- Mode trace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponses :

[eclipse 18]: test1(X),membre(1,X).
  (1) 1 CALL  test1(X)   %> creep
  (1) 1 EXIT  test1([1, 2, 3, ...])   %> creep
  (2) 1 CALL  membre(1, [1, 2, 3, ...])   %> creep
  (2) 1 *EXIT  membre(1, [1, 2, 3, ...])   %> creep

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;
  (2) 1 REDO  membre(1, [1, 2, 3, ...])   %> creep
  (3) 2 CALL  membre(1, [2, 3, 4, ...])   %> creep
  (3) 2 NEXT  membre(1, [2, 3, 4, ...])   %> creep
  (4) 3 CALL  membre(1, [3, 4, 5, ...])   %> creep
  (4) 3 NEXT  membre(1, [3, 4, 5, ...])   %> creep
  (5) 4 CALL  membre(1, [4, 5, 6, ...])   %> creep
  (5) 4 NEXT  membre(1, [4, 5, 6, ...])   %> creep
  (6) 5 CALL  membre(1, [5, 6, 7, ...])   %> creep
  (6) 5 NEXT  membre(1, [5, 6, 7, ...])   %> creep
  (7) 6 CALL  membre(1, [6, 7, 8, ...])   %> creep
  (7) 6 NEXT  membre(1, [6, 7, 8, ...])   %> creep
  (8) 7 CALL  membre(1, [7, 8, 9])   %> creep
  (8) 7 NEXT  membre(1, [7, 8, 9])   %> creep
  (9) 8 CALL  membre(1, [8, 9])   %> creep
  (9) 8 NEXT  membre(1, [8, 9])   %> creep
  (10) 9 CALL  membre(1, [9])   %> creep
  (10) 9 NEXT  membre(1, [9])   %> creep
  (11) 10 CALL  membre(1, [])   %> creep
  (11) 10 NEXT  membre(1, [])   %> creep
  (11) 10 FAIL  membre(..., ...)   %> creep
  (10) 9 FAIL  membre(..., ...)   %> creep
  (9) 8 FAIL  membre(..., ...)   %> creep
  (8) 7 FAIL  membre(..., ...)   %> creep
  (7) 6 FAIL  membre(..., ...)   %> creep
  (6) 5 FAIL  membre(..., ...)   %> creep
  (5) 4 FAIL  membre(..., ...)   %> creep
  (4) 3 FAIL  membre(..., ...)   %> creep
  (3) 2 FAIL  membre(..., ...)   %> creep
  (2) 1 FAIL  membre(..., ...)   %> creep

 Données : listes de test,
- But : test1(X),membre(12,X).
- Mode trace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 0,
- Réponses :

[eclipse 19]: test1(X),membre(12,X).
  (1) 1 CALL  test1(X)   %> creep
  (1) 1 EXIT  test1([1, 2, 3, ...])   %> creep
  (2) 1 CALL  membre(12, [1, 2, 3, ...])   %> creep
  (2) 1 NEXT  membre(12, [1, 2, 3, ...])   %> creep
  (3) 2 CALL  membre(12, [2, 3, 4, ...])   %> creep
  (3) 2 NEXT  membre(12, [2, 3, 4, ...])   %> creep
  (4) 3 CALL  membre(12, [3, 4, 5, ...])   %> creep
  (4) 3 NEXT  membre(12, [3, 4, 5, ...])   %> creep
  (5) 4 CALL  membre(12, [4, 5, 6, ...])   %> creep
  (5) 4 NEXT  membre(12, [4, 5, 6, ...])   %> creep
  (6) 5 CALL  membre(12, [5, 6, 7, ...])   %> creep
  (6) 5 NEXT  membre(12, [5, 6, 7, ...])   %> creep
  (7) 6 CALL  membre(12, [6, 7, 8, ...])   %> creep
  (7) 6 NEXT  membre(12, [6, 7, 8, ...])   %> creep
  (8) 7 CALL  membre(12, [7, 8, 9])   %> creep
  (8) 7 NEXT  membre(12, [7, 8, 9])   %> creep
  (9) 8 CALL  membre(12, [8, 9])   %> creep
  (9) 8 NEXT  membre(12, [8, 9])   %> creep
  (10) 9 CALL  membre(12, [9])   %> creep
  (10) 9 NEXT  membre(12, [9])   %> creep
  (11) 10 CALL  membre(12, [])   %> creep
  (11) 10 NEXT  membre(12, [])   %> creep
  (11) 10 FAIL  membre(..., ...)   %> creep
  (10) 9 FAIL  membre(..., ...)   %> creep
  (9) 8 FAIL  membre(..., ...)   %> creep
  (8) 7 FAIL  membre(..., ...)   %> creep
  (7) 6 FAIL  membre(..., ...)   %> creep
  (6) 5 FAIL  membre(..., ...)   %> creep
  (5) 4 FAIL  membre(..., ...)   %> creep
  (4) 3 FAIL  membre(..., ...)   %> creep
  (3) 2 FAIL  membre(..., ...)   %> creep
  (2) 1 FAIL  membre(..., ...)   %> creep

- Données : listes de test,
- But : test2(X),membre(Y,X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 4,
- Réponses :
[eclipse 21]: test2(X),membre(Y,X).

X = [2, 4, 6, 8]
Y = 2
Yes (0.00s cpu, solution 1, maybe more) ? ;

X = [2, 4, 6, 8]
Y = 4
Yes (0.00s cpu, solution 2, maybe more) ? ;

X = [2, 4, 6, 8]
Y = 6
Yes (0.00s cpu, solution 3, maybe more) ? ;

X = [2, 4, 6, 8]
Y = 8
Yes (0.00s cpu, solution 4, maybe more) ? ;

No (0.00s cpu)
 */

/* Question 1.2
- Données : listes de test,
- But : test3(X),compte(2,X,N).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponses :

[eclipse 40]: test3(X),compte(2,X,N).

X = [2, 2, 2, 3, 4, 9]
N = 3
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

- Données : listes de test,
- But : test3(X),membre(2,X,3).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :
[eclipse 41]: test3(X),compte(2,X,3).

X = [2, 2, 2, 3, 4, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu) 

Données : listes de test,
- But : test3(X),membre(2,X,4).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :
[eclipse 42]: test3(X),compte(2,X,4).

No (0.00s cpu)

*/

/* Question 1.3

Données : listes de test,
- But : test3(X),renverser(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 47]: test3(X),renverser(X,Y).

X = [2, 2, 2, 3, 4, 9]
Y = [9, 4, 3, 2, 2, 2]
Yes (0.00s cpu)

Données : listes de test,
- But : test3(X),renverser(X,[1,2,3]).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 48]: test3(X),renverser(X,[1,2,3]).

No (0.00s cpu)
 */

/* Question 1.4

Données : listes de test,
- But : test3(X),palind(X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :
[eclipse 52]: test3(X),palind(X).

No (0.00s cpu)

Données : listes de test,
- But : test4(X),palind(X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :
[eclipse 53]: test4(X),palind(X).

X = [4, 5, 4, 5, 4, 5, 4]
Yes (0.00s cpu)
*/

/* Question 1.5

Données : listes de test,
- But : test3(X),nieme(1,X,A).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 6]: test3(X),nieme(1,X,A).

X = [2, 2, 2, 3, 4, 9]
A = 2
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)


Données : listes de test,
- But : test3(X),nieme(12,X,A).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

 [eclipse 7]: test3(X),nieme(12,X,A).

No (0.00s cpu)


Données : listes de test,
- But : test3(X),nieme(N,X,3).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 8]: test3(X),nieme(N,X,3).

X = [2, 2, 2, 3, 4, 9]
N = 4
Yes (0.00s cpu, solution 1, maybe more) ? ;
No (0.00s cpu)


Données : listes de test,
- But : test3(X),nieme(N,X,2).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 3,
- Réponse 

[eclipse 9]: test3(X),nieme(N,X,2).

X = [2, 2, 2, 3, 4, 9]
N = 1
Yes (0.00s cpu, solution 1, maybe more) ? ;

X = [2, 2, 2, 3, 4, 9]
N = 2
Yes (0.00s cpu, solution 2, maybe more) ? ;

X = [2, 2, 2, 3, 4, 9]
N = 3
Yes (0.00s cpu, solution 3, maybe more) ? ;

No (0.00s cpu)
*/

/* Question 1.6

Données : listes de test,
- But : test1(X),hors_de(3,X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 16]: test1(X),hors_de(3,X).

No (0.00s cpu)

Données : listes de test,
- But : test1(X),hors_de(30,X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 15]: test1(X),hors_de(30,X).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu)

*/

/* Question 1.7

Données : listes de test,
- But : test1(X),tous_diff(X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 18]: test1(X),tous_diff(X).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu)


Données : listes de test,
- But : test3(X),tous_diff(X).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 19]: test3(X),tous_diff(X).

No (0.00s cpu)

*/

/* Question 1.8
mode (+,+,+,-)
Données : listes de test,
- But :  test3(X),test2(Y),test1(Z),concat3(X,Y,Z,T).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [2, 2, 2, 3, 4, 9]
Y = [2, 4, 6, 8]
Z = [1, 2, 3, 4, 5, 6, 7, 8, 9]
T = [2, 2, 2, 3, 4, 9, 2, 4, 6, 8, 1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

mode (-,-,-,+)
Données : listes de test,
- But :  test3(T),concat3(X,Y,Z,T)
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 28,
- Réponse :

T = [2, 2, 2, 3, 4, 9]
X = []
Y = []
Z = [2, 2, 2, 3, 4, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;

T = [2, 2, 2, 3, 4, 9]
X = []
Y = [2]
Z = [2, 2, 3, 4, 9]
Yes (0.00s cpu, solution 2, maybe more) ? ;

T = [2, 2, 2, 3, 4, 9]
X = []
Y = [2, 2]
Z = [2, 3, 4, 9]
Yes (0.00s cpu, solution 3, maybe more) ? ;

T = [2, 2, 2, 3, 4, 9]
X = []
Y = [2, 2, 2]
Z = [3, 4, 9]
Yes (0.00s cpu, solution 4, maybe more) ? ;

[...]

T = [2, 2, 2, 3, 4, 9]
X = [2, 2, 2, 3, 4, 9]
Y = []
Z = []
Yes (0.00s cpu, solution 28)

*/

/* Question 1.9
- Données : listes de test,
- But : test2(X),test5(Y),debute_par(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [2, 4, 6, 8]
Y = [2, 4, 6]
Yes (0.00s cpu)

- Données : listes de test,
- But : test2(X),test3(Y),debute_par(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 0,
- Réponse :

No (0.00s cpu)


- Données : listes de test,
- But : test2(X),test2(Y),debute_par(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [2, 4, 6, 8]
Y = [2, 4, 6, 8]
Yes (0.00s cpu)
*/

/* Question 1.10

- Données : listes de test,
- But : test4(X),test7(Y),sous_liste(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 3,
- Réponse :

X = [4, 5, 4, 5, 4, 5, 4]
Y = [4, 5, 4]
Yes (0.00s cpu, solution 1, maybe more) ? ;

X = [4, 5, 4, 5, 4, 5, 4]
Y = [4, 5, 4]
Yes (0.00s cpu, solution 2, maybe more) ? ;

X = [4, 5, 4, 5, 4, 5, 4]
Y = [4, 5, 4]
Yes (0.00s cpu, solution 3, maybe more) ? ;

No (0.00s cpu)

- Données : listes de test,
- But : test1(X),test5(Y),sous_liste(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 0,
- Réponse :

No (0.00s cpu)

- Données : listes de test,
- But : test1(X),test6(Y),sous_liste(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [4, 5, 6]
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

*/

/* Question 1.11

- Données : listes de test,
- But : test4(X),elim(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 12]: test4(X),elim(X,Y).

X = [4, 5, 4, 5, 4, 5, 4]
Y = [5, 4]
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.01s cpu)

- Données : listes de test,
- But : test3(X),elim(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 15]: test1(X),elim(X,Y).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [9, 8, 7, 6, 5, 4, 3, 2, 1]
Yes (0.00s cpu, solution 1, maybe more) ? ;

- Données : listes de test,
- But : test3(X),elim(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 16]: test3(X),elim(X,Y).

X = [2, 2, 2, 3, 4, 9]
Y = [9, 4, 3, 2]
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)
*/


/* Question 1.12

- Données : listes de test,
- But : test1(X), inserer(5,X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 2]: test1(X), inserer(5,X,Y).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [1, 2, 3, 4, 5, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test3(X), inserer(52,X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 3]: test3(X), inserer(52,X,Y).

X = [2, 2, 2, 3, 4, 9]
Y = [2, 2, 2, 3, 4, 9, 52]
Yes (0.00s cpu)

- Données : listes de test,
- But : test6(X), inserer(0,X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 4]: test6(X), inserer(0,X,Y).

X = [4, 5, 6]
Y = [0, 4, 5, 6]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test1(X), tri(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 10]: test1(X), tri(X,Y).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu)

- Données : listes de test,
- But : test8(X), tri(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 11]: test8(X), tri(X,Y).

X = [8, 2, 4, 6, 6, 2, 5]
Y = [2, 2, 4, 5, 6, 6, 8]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test4(X), tri(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 12]: test4(X),tri(X,Y).

X = [4, 5, 4, 5, 4, 5, 4]
Y = [4, 4, 4, 4, 5, 5, 5]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)
*/


/* Question 2.1 

- Données : listes de test,
- But :  test1(X),test2(Y),inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 14]: test1(X),test2(Y),inclus(X,Y).

No (0.00s cpu)


- Données : listes de test,
- But : test2(X),test1(Y),inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 15]: test2(X),test1(Y),inclus(X,Y).

X = [2, 4, 6, 8]
Y = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu


- Données : listes de test,
- But : test5(X),test5(Y),inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 16]: test5(X),test5(Y),inclus(X,Y).

X = [2, 4, 6]
Y = [2, 4, 6]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)

*/

/* Question 2.2 

- Données : listes de test,
- But : test1(X),test5(Y),non_inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [2, 4, 6]
Yes (0.00s cpu)


- Données : listes de test,
- But : test5(X),test1(Y),non_inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 0,
- Réponse :

No (0.00s cpu)

- Données : listes de test,
- But : test7(X),test1(Y),non_inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 0,
- Réponse :

No (0.01s cpu)


- Données : listes de test,
- But : test1(X),test7(Y),non_inclus(X,Y).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [4, 5, 4]
Yes (0.00s cpu)


/* Question 2.3

- Données : listes de test,
- But : test9(X),test6(Y),union_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 25]: test9(X),test6(Y),union_ens(X,Y,Z).

X = [10, 12, 15]
Y = [4, 5, 6]
Z = [10, 12, 15, 4, 5, 6]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test2(X),test6(Y),union_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 22]: test2(X),test6(Y),union_ens(X,Y,Z).

X = [2, 4, 6, 8]
Y = [4, 5, 6]
Z = [2, 8, 4, 5, 6]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)

- Données : listes de test,
- But : test1(X),test2(Y),union_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 20]: test1(X),test2(Y),union_ens(X,Y,Z).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [2, 4, 6, 8]
Z = [1, 3, 5, 7, 9, 2, 4, 6, 8]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test1(X),test1(Y),union_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 26]: test1(X),test1(Y),union_ens(X,Y,Z).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Z = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)

*/

/* Question 2.4 

- Données : listes de test,
- But : test1(X),test2(Y),inter_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 85]: test1(X),test2(Y),inter_ens(X,Y,Z).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [2, 4, 6, 8]
Z = [8, 6, 4, 2]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)


- Données : listes de test,
- But : test6(X),test2(Y),inter_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 86]: test6(X),test2(Y),inter_ens(X,Y,Z).

X = [4, 5, 6]
Y = [2, 4, 6, 8]
Z = [6, 4]
Yes (0.00s cpu, solution 1, maybe more) ? ;
;

No (0.00s cpu)

- Données : listes de test,
- But : test9(X),test1(Y),inter_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 87]: test9(X),test1(Y),inter_ens(X,Y,Z).

X = [10, 12, 15]
Y = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Z = []
Yes (0.00s cpu)


*/

/* Question 2.5 

- Données : listes de test,
- But : test10(X),test11(Y),diff_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 3]: test10(X),test11(Y),diff_ens(X,Y,Z).

X = [1, 5, 3]
Y = [5, 4, 7]
Z = [3, 1]
Yes (0.00s cpu, solution 1, maybe more) ?


- Données : listes de test,
- But : test1(X),test2(Y),diff_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :

[eclipse 5]: test1(X),test2(Y),diff_ens(X,Y,Z).

X = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Y = [2, 4, 6, 8]
Z = [9, 7, 5, 3, 1]
Yes (0.00s cpu, solution 1, maybe more) ?



- Données : listes de test,
- But : test9(X),test10(Y),diff_ens(X,Y,Z).
- Mode notrace,
- Temps d'exécution : 0.0s,
- Nombre de réponses : 1,
- Réponse :


[eclipse 6]: test9(X),test10(Y),diff_ens(X,Y,Z).

X = [10, 12, 15]
Y = [1, 5, 3]
Z = [15, 12, 10]
Yes (0.00s cpu)

*/