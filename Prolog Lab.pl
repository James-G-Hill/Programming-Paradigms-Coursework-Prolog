/* Prolog Lab */

/* Q1 */

father(a, b).
father(a, c).
father(b, d).
father(b, e).
father(c, f).

brother(X, Y) :-
	father(A, X),
	father(A, Y),
	X\=Y.

cousin(X, Y) :-
	father(A, X),
	father(B, Y),
	brother(A, B),
	X\=Y.

grandson(X, Y) :-
	father(Y, A),
	father(A, X).

descendant(X, Y) :- father(Y, X).
descendant(X, Y) :- father(A, X), descendant(A, Y).


/* Q2 */

reverse(L, K) :-
	rev(K, [], R),
	is_equal(L, R).

is_equal([], []).
is_equal([H1|T1], [H2|T2]) :-
	H1=:=H2, is_equal(T1, T2).

rev([H|T], A, R) :- rev(T, [H|A], R).
rev([], A, A).


/* Q3 */

/* Q3.a */

follows(anne, fred).
follows(fred, julie).
follows(fred, susan).
follows(john, fred).
follows(julie, fred).
follows(susan, john).
follows(susan, julie).

/* Q3.b */

tweeted(anne, tweet1).
tweeted(anne, tweet5).
tweeted(fred, tweet2).
tweeted(fred, tweet7).
tweeted(fred, tweet8).
tweeted(john, tweet3).
tweeted(john, tweet4).
tweeted(julie, tweet6).
tweeted(susan, tweet9).
tweeted(susan, tweet10).

/* Q3.c.i */

can_see(P1, T) :-
	follows(P1, P2),
	tweeted(P2, T).

/* Q3.c.ii */

friends(P1, P2) :-
	follows(P1, P2),
	follows(P2, P1).

/* Q3.c.iii */

can_see(P1, T).

/* Q3.c.iv */

retweets(P1, T) :-
	follows(P1, P2),
	can_see(P1, T),
	can_see(P2, T).


/* Q4. Unfinished */

add_up_list([], []).
add_up_list([LH|[LT1|LT2]], [S|KT]) :-
	S is LH + LT1,
	add_up_list([S|LT2], KT).


/* Q5.a */

nationality(malcom, scottish).
nationality(claude, french).
nationality(john, british).
nationality(owen, welsh).
nationality(sean, northernIrish).
nationality(nigel, english).

plays(malcom, rugby).
plays(claude, football).
plays(john, cricket).
plays(owen, chess).
plays(nigel, football).

british(A) :- nationality(A, british).
british(A) :- nationality(A, scottish).
british(A) :- nationality(A, english).
british(A) :- nationality(A, welsh).
british(A) :- nationality(A, northernIrish).

sportsman(A) :- plays(A, cricket).
sportsman(A) :- plays(A, football).
sportsman(A) :- plays(A, rugby).

/* Q5.b.i = owen is not a sportsman */
sportsman(owen).

/* Q5.b.ii */
sportsman(A), british(A).

/* british sportsmen are:
	john,
	nigel,
	malcom */

/* Q5.b.iii */
nationality(A, B), plays(A, football).

/* the nationalities of the football players are:
	claude, french;
	nigel, english */


/* Q6 */

merge([], [], []).

merge([LH|LT], [KH|KT], [KH|[LH|M]]) :-
	LH > KH,
	merge(LT, KT, M).

merge([LH|LT], [KH|KT], [LH|[KH|M]]) :-
	KH > LH,
	merge(LT, KT, M).

merge([LH|LT], [KH|KT], [LH|M]) :-
	LH = KH,
	merge(LT, KT, M).


/* Q7 */

gcd(A, 0) :- write(A).

gcd(A, B) :-
	A =< B,
	C is B - A,
	gcd(A, C).

gcd(A, B) :-
	A > B,
	C is A - B,
	gcd(C, B).


/* Q8 Unfinished */