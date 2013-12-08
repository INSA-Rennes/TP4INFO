/**
TP 7 Base de Données Déductives (BDD) - Prolog

@author Prenom1 NOM1
@author Prenom2 NOM2
@version Annee scolaire 20__/20__
*/


/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
% ============================================================================= 
% SECTION 1 : Base de données
% ============================================================================= 

assemblage(voiture, porte, 4).
assemblage(voiture, roue, 4).
assemblage(voiture, moteur, 1).
assemblage(roue, jante, 1).
assemblage(porte, tole, 1).
assemblage(porte, vitre, 1).
assemblage(roue, pneu, 1).
assemblage(moteur, piston, 4).
assemblage(moteur, soupape, 16).
%assemblage(soupape, collet, 1). 		%ajout de collet pour test
           
piece(p1, tole, lyon).
piece(p2, jante, lyon).
piece(p3, jante, marseille).
piece(p4, pneu, clermontFerrand).
piece(p5, piston, toulouse).
piece(p6, soupape, lille).
piece(p7, vitre, nancy).
piece(p8, tole, marseille).
piece(p9, vitre, marseille).

                  
demandeFournisseur(dupont, lyon).
demandeFournisseur(michel, clermontFerrand).
demandeFournisseur(durand, lille).
demandeFournisseur(dupond, lille).
demandeFournisseur(martin, rennes).
demandeFournisseur(smith, paris).
demandeFournisseur(brown, marseille).
          
          
fournisseurReference(f1, dupont, lyon).
fournisseurReference(f2, durand, lille).
fournisseurReference(f3, martin, rennes).
fournisseurReference(f4, michel, clermontFerrand).
fournisseurReference(f5, smith, paris).
fournisseurReference(f6, brown, marseille).

                  
livraison(f1, p1, 300).
livraison(f2, p2, 200).
livraison(f3, p3, 200).
livraison(f4, p4, 400).
livraison(f6, p5, 500).
livraison(f6, p6, 1000).
livraison(f6, p7, 300).
livraison(f1, p2, 300).
livraison(f4, p2, 300).
livraison(f4, p1, 300).


% ============================================================================= 
% SECTION 2 : Opération relationnelles
% ============================================================================= 

%%Question 2.1
%% Les pièces fabriquées à Lyon : piece_lyon(?piece)

piece_lyon(X):-
    piece(X,_,lyon).


%%Question 2.2
%% info_piece(?Nom,?Lieu) Nom des pièces et leur lieu de fabrication

info_piece(Nom, Lieu) :-
    piece(_,Nom,Lieu).


%%Question 2.3
%%Union :  Union(-Nom,-Ville)  

union(Nom,Ville) :-
    demandeFournisseur(Nom,Ville).

union(Nom,Ville) :-
    fournisseurReference(_,Nom,Ville),
    not(demandeFournisseur(Nom,Ville)).
    
%%intersection : inter(-Nom,-Ville)

inter(Nom,Ville) :-
    demandeFournisseur(Nom,Ville),
    fournisseurReference(_,Nom,Ville).

%%différence ensembliste :diff_ens(-Nom,-Ville)

diff_ens(Nom,Ville) :-
    demandeFournisseur(Nom,Ville),
    not(fournisseurReference(_,Nom,Ville)).
    
%%Question 2.4
%% Produit cartésien : prod_cart(-NumF1,-Nom,-Ville,-NumF2,-Piece,-Qte)

prod_cart(NumF1,Nom,Ville,NumF2,Piece,Qte) :-
    fournisseurReference(NumF1,Nom,Ville),
    livraison(NumF2,Piece,Qte).
   
%%Question 2.5
%% Jointure entre Fournisseur référencé et Livraison: jointure(-NumF1,-Nom,-Ville,-NumF2,-Piece,-Qte)

jointure(NumF,Nom,Ville,NumF,Piece,Qte):-
    prod_cart(NumF,Nom,Ville,NumF,Piece,Qte).

%%Jointure  : jointure_plus350(-NumF1,-Nom,-Ville,-NumF2,-Piece,-Qte)

jointure_plus350(NumF,Nom,Ville,NumF,Piece,Qte):-
    prod_cart(NumF,Nom,Ville,NumF,Piece,Qte),
    <(350,Qte).

%%Question 2.6
%%Division : division(-NumF)

division([],_).

division([Tete|Reste], NumF) :-
    livraison(NumF,Tete,_),
    division(Reste,NumF).
    
division_finale(NumF) :-
	findall(P,piece_lyon(P),ListePieceLyon),
	division(ListePieceLyon,NumF).

%% Question 2.7
%% Total de pièces livrées par les fournisseurs

sommeListe([],0).
sommeListe([Tete|Reste],Total) :-
	sommeListe(Reste,Total2),
	Total is Tete+Total2.

totalPiece(Total,NumF) :-
	fournisseurReference(NumF,_,_),
	findall(Qte,livraison(NumF,_,Qte),ListeQte),
	sommeListe(ListeQte,Total).


% ============================================================================= 
% SECTION 3 : Au delà de l’algèbre relationnelle
% ============================================================================= 


%% Question 3.1
%% Ensemble des composants nécessaires pour réaliser un composant
ensemble_comp(Composant,Res) :-
	findall(Piece,assemblage(Composant,Piece,_),EnsembleComp),
	ensemble_comp2(EnsembleComp,ResFils),
	append(EnsembleComp,ResFils,ResTemp),
	ensemble_comp2(ResFils,ResTemp2),
	append(ResTemp,ResTemp2,Res).

ensemble_comp2([],[]).
ensemble_comp2([Tete|Reste], EnsembleComp) :-
	findall(Piece,assemblage(Tete,Piece,_),Ensemble1),
	ensemble_comp2(Reste,Ensemble2),
	append(Ensemble1,Ensemble2,EnsembleComp).

%% Question 3.2
%% Nombre de pièce total nécessaire à la construction d'un composant

nombre_piece(Composant,NombreRes) :-
	findall((Piece,Qte),assemblage(Composant,Piece,Qte),EnsembleComp),
	nombre_piece_liste(EnsembleComp,Res),
	somme_liste(Res,NombreRes).

nombre_piece_liste([],[]).

nombre_piece_liste([(P,Qt)|Reste],Res) :-
 	findall((Piece,Qte),assemblage(P,Piece,Qte),[(A,B)|C]), %composant
	multiplier_liste([(A,B)|C],Qt,EnsembleCompF),
	nombre_piece_liste(Reste,Res1),
	nombre_piece_liste(EnsembleCompF,Res2),
	append(Res1,Res2,Res).

nombre_piece_liste([(P,Qt)|Reste],Res) :-
 	findall((Piece,Qte),assemblage(P,Piece,Qte),[]), %objet final
	nombre_piece_liste(Reste,Res2),
	append([(P,Qt)],Res2,Res).

multiplier_liste([],_,[]).

multiplier_liste([(P,Qt)|Reste],Qte,[(P,Qtres)|ListeRes]) :-
	Qtres is *(Qt,Qte),
	multiplier_liste(Reste,Qte,ListeRes).
		
somme_liste([],0).

somme_liste([(_,Qt)|Reste],Res) :-
	somme_liste(Reste,Res2),
	Res is +(Res2,Qt).



%% Question 3.3
%% Nombre de voiture qu'il est possible de construire avec les quantités livrées
   
jointure_piece(NomPiece,Qte):-
	piece(NumPiece,NomPiece,_),
	livraison(_,NumPiece,Qte).

% Retourne la quantité totale d'une pièce
nb_piece_dispo(NomPiece,Nb) :-
	findall((NomPiece,Qte),jointure_piece(NomPiece,Qte),Res),
	somme_liste(Res,Nb).

% Retourne la quantité d'un composant nécessaire pour une voiture
nb_compo_pour_une_voiture(_,[],0).
nb_compo_pour_une_voiture(Piece,[(Piece,Qte)|_],Qte).
nb_compo_pour_une_voiture(PieceA,[(PieceB,_)|Reste],Qte) :-
	\==(PieceA,PieceB),
	nb_compo_pour_une_voiture(PieceA,Reste,Qte). 

% Retourne le nombre de voiture possible pour un composant
nb_voiture_par_compo(Piece,Res) :-
 	nb_piece_dispo(Piece,Nb_piece_dispo),
 	nombre_piece_liste([(voiture,1)],ListeCompo),
 	nb_compo_pour_une_voiture(Piece,ListeCompo,Nb_piece_necessaire),
	Res is //(Nb_piece_dispo,Nb_piece_necessaire).

% Retourne le nombre de voiture possible pour une liste de composants
nb_voiture_liste([],0).
nb_voiture_liste([A],Res) :-
	nb_voiture_par_compo(A,Res),
	!.
nb_voiture_liste([A|B],Res) :-
	nb_voiture_par_compo(A,Res1),
	nb_voiture_liste(B,Res2),
	Res is min(Res1,Res2).

%Fonction finale
nb_voiture(Res) :-
	findall(Piece,piece(_, Piece,_),ListePiece), %Il faudrait éliminer les doublons
	nb_voiture_liste(ListePiece,Res).
	
/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/
/*
%%Question 2.1

[eclipse 6]: ?- piece_lyon(X,_,lyon).

X = p1
Yes (0.00s cpu, solution 1, maybe more) ? ;
X = p2
Yes (0.00s cpu, solution 2)

[eclipse 7]: ?- piece_lyon(p9).
No (0.00s cpu)

[eclipse 8]: ?- piece_lyon(p1).
Yes (0.00s cpu)


%%Question 2.2
[eclipse 10]: ?- info_piece(X,Y).

X = tole
Y = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

X = jante
Y = lyon
Yes (0.00s cpu, solution 2, maybe more) ? ;

X = jante
Y = marseille
Yes (0.00s cpu, solution 3, maybe more) ? ;

X = pneu
Y = clermontFerrand
Yes (0.00s cpu, solution 4, maybe more) ? ;

X = piston
Y = toulouse
Yes (0.00s cpu, solution 5, maybe more) ? 


[eclipse 11]: ?- info_piece(X,lyon).
X = tole
Yes (0.00s cpu, solution 1, maybe more) ? ;
X = jante
Yes (0.00s cpu, solution 2)


%%Question 2.3
%%Union :

[eclipse 27]: ?- union(Nom,Ville).

Nom = dupont
Ville = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

Nom = michel
Ville = clermontFerrand
Yes (0.00s cpu, solution 2, maybe more) ? ;

Nom = durand
Ville = lille
Yes (0.00s cpu, solution 3, maybe more) ? ;

Nom = dupond
Ville = lille
Yes (0.00s cpu, solution 4, maybe more) ? ;

Nom = martin
Ville = rennes
Yes (0.00s cpu, solution 5, maybe more) ? ;

Nom = smith
Ville = paris
Yes (0.00s cpu, solution 6, maybe more) ? ;

Nom = brown
Ville = marseille
Yes (0.00s cpu, solution 7, maybe more) ? ;

No (0.00s cpu)

%%Intersection
[eclipse 30]: ?- inter(Nom,Ville).

Nom = dupont
Ville = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

Nom = michel
Ville = clermontFerrand
Yes (0.00s cpu, solution 2, maybe more) ? ;

Nom = durand
Ville = lille
Yes (0.00s cpu, solution 3, maybe more) ? ;

Nom = martin
Ville = rennes
Yes (0.00s cpu, solution 4, maybe more) ? ;

Nom = smith
Ville = paris
Yes (0.00s cpu, solution 5, maybe more) ? ;

Nom = brown
Ville = marseille
Yes (0.00s cpu, solution 6)

%%Différence ensembliste
[eclipse 35]: diff_ens(Nom,Ville).

Nom = dupond
Ville = lille
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

%%Question 2.4
[eclipse 37]: prod_cart(NumF1,Nom,Ville,NumF2,Piece,Qte).

NumF1 = f1
Nom = dupont
Ville = lyon
NumF2 = f1
Piece = p1
Qte = 300
Yes (0.00s cpu, solution 1, maybe more) ? ;

NumF1 = f1
Nom = dupont
Ville = lyon
NumF2 = f2
Piece = p2
Qte = 200
Yes (0.00s cpu, solution 2, maybe more) ? ;

NumF1 = f1
Nom = dupont
Ville = lyon
NumF2 = f3
Piece = p3
Qte = 200
Yes (0.00s cpu, solution 3, maybe more) ? ;

NumF1 = f1
Nom = dupont
Ville = lyon
NumF2 = f4
Piece = p4
Qte = 400
Yes (0.00s cpu, solution 4, maybe more) ? ;

[...]

NumF1 = f6
Nom = brown
Ville = marseille
NumF2 = f4
Piece = p1
Qte = 300
Yes (0.00s cpu, solution 60)

%%Question 2.5
%% Jointure entre Fournisseur Référencé et Livraison
[eclipse 39]: jointure(NumF,Nom,Ville,NumF,Piece,Qte).

NumF = f1
Nom = dupont
Ville = lyon
Piece = p1
Qte = 300
Yes (0.00s cpu, solution 1, maybe more) ? ;

NumF = f1
Nom = dupont
Ville = lyon
Piece = p2
Qte = 300
Yes (0.00s cpu, solution 2, maybe more) ? ;

NumF = f2
Nom = durand
Ville = lille
Piece = p2
Qte = 200
Yes (0.00s cpu, solution 3, maybe more) ? ;

[...]

NumF = f6
Nom = brown
Ville = marseille
Piece = p7
Qte = 300
Yes (0.00s cpu, solution 10)

%% Jointure plus de 350 exemplaires

[eclipse 41]: jointure_plus350(NumF,Nom,Ville,NumF,Piece,Qte).

NumF = f4
Nom = michel
Ville = clermontFerrand
Piece = p4
Qte = 400
Yes (0.00s cpu, solution 1, maybe more) ? ;

NumF = f6
Nom = brown
Ville = marseille
Piece = p5
Qte = 500
Yes (0.00s cpu, solution 2, maybe more) ? ;

NumF = f6
Nom = brown
Ville = marseille
Piece = p6
Qte = 1000
Yes (0.00s cpu, solution 3, maybe more) ? ;

No (0.00s cpu)


%% Question 2.6 

[eclipse 65]: division_finale(NumF).

NumF = f1
Yes (0.00s cpu, solution 1, maybe more) ? ;

NumF = f4
Yes (0.00s cpu, solution 2)

%% Question 2.7


[eclipse 13]: totalPiece(Total, NumF).

Total = 600
NumF = f1
Yes (0.00s cpu, solution 1, maybe more) ? ;

Total = 200
NumF = f2
Yes (0.00s cpu, solution 2, maybe more);

Total = 200
NumF = f3
Yes (0.00s cpu, solution 3, maybe more) ? ;

Total = 1000
NumF = f4
NumF = f4;

Total = 0
NumF = f5
NumF = f5;

Total = 1800
NumF = f6
Yes (0.00s cpu, solution 6)

%% Question 3.1
[eclipse 57]: ensemble_comp(voiture,R).

R = [porte, roue, moteur, tole, vitre, jante, pneu, piston, soupape, collet]
Yes (0.00s cpu)

%% Question 3.2
[eclipse 6]: nombre_piece(moteur,R).

R = 20
Yes (0.00s cpu)
[eclipse 7]: nombre_piece(voiture,R).

R = 36
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

%% Question 3.3
[eclipse 39]: nb_voiture(Res).

Res = 62
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

*/