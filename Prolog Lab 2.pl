/* Prolog Lab 2 */

child_of(amelia, frank).
child_of(harold, frank).
child_of(emmeline, frank).
child_of(irene, maurice).
child_of(les, maurice).
child_of(chris, john).
child_of(chris, amelia).
child_of(elizabeth, george).
child_of(elizabeth, irene).
child_of(margaret, george).
child_of(margaret, irene).
child_of(brendon, chris).
child_of(brendon, elizabeth).
child_of(emlyn, chris).
child_of(emlyn, elizabeth).
child_of(rebecca, margaret).
child_of(rebecca, peter).
child_of(louise, margaret).
child_of(louise, peter).
child_of(nick, margaret).
child_of(nick, peter).

male(frank).
male(maurice).
male(john).
male(harold).
male(george).
male(les).
male(chris).
male(peter).
male(brendon).
male(nick).

female(amelia).
female(emmeline).
female(irene).
female(elizabeth).
female(margaret).
female(emlyn).
female(rebecca).
female(louise).

/* Q1.a.

child_of(peter, irene). */

/* Q1.b.

child_of(peter, emlyn). */

/* Q1.c.

child_of(X, george). */

/* Q1.d. 

child_of(george, X). */

/* Q1.e. 

child_of(X, X). */

/* Q1.f.

child_of(X, Y). */


/* Q2 */

daughter_of(X, Y) :-
	female(X),
	child_of(X, Y).

uncle_of(X, Y) :-
	male(X),
	child_of(Y, Z),
	child_of(Z, A),
	child_of(X, A),
	Z\==X.

neice_of(X, Y) :-
	female(X),
	child_of(X, Z),
	child_of(Z, A),
	child_of(Y, A),
	Y\==Z.

grandfather_of(X, Y) :-
	male(X),
	child_of(Y, A),
	child_of(A, X).