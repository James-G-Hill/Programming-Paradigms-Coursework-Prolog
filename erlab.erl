-module(erlab).
-export(
   [sales/1,
   count_zero_sales_weeks/1,
   count_sales_greater/2,
   max_sales/1,
   increasing/1,
   change_pairs/1,
   mercury/0,
   mercury_two/0]).

% Q1

sales(N) ->
    (N + 31) rem 7 + (N + 1) rem 5.

% Q1.a

count_zero_sales_weeks(N) ->
    count_zeroes(N, 0).

count_zeroes(A, B) when A == 0 -> B;
count_zeroes(A, B) ->
    C = sales(A),
    if
	C  == 0 -> count_zeroes(A-1, B+1);
	true -> count_zeroes(A-1, B)
    end.


% Q1.b

count_sales_greater(N, S) ->
    count_greater(N, S, 0).

count_greater(N, _, B) when N == 0 -> B;
count_greater(N, S, B) ->
    C = sales(N),
    if
	C > S -> count_greater(N-1, S, B+1);
	true  -> count_greater(N-1, S, B)
    end.


% Q1.c allZeroPeriod(N)

% Q1.d

max_sales(N) ->
    maximum(N, 0).

maximum(N, M) when N == 0 -> M;
maximum(N, M) ->
    C = sales(N),
    D = sales(M),
    if
	C > D -> maximum(N-1, N);
	true  -> maximum(N-1, M)
    end.


% Q3.a

increasing(A) ->
    increasing_help(A, []).

increasing_help([], B) -> B;
increasing_help([H1|T1], L2) ->
    {X, Y} = H1,
    if
	X > Y -> increasing_help(T1, [H1|L2]);
	true  -> increasing_help(T1, L2)
    end.

% Q3.b

change_pairs(A) ->
    B = largest_element(A, 0),
    change_pairs_help(A, B, []).

largest_element([], B) -> B;
largest_element([A1|A2], B) ->
    {_, Y} = A1,
    if
	Y > B -> largest_element(A2, Y);
	true  -> largest_element(A2, B)
    end.
    
change_pairs_help([], _, C) -> C;
change_pairs_help([H1|T1], B, L2) ->
    {X, _} = H1,
    H2 = {X, B},
    change_pairs_help(T1, B, [H2|L2]).


% Q4.a and b

mercury() ->
    receive
	"print" ->
	    io:format("message~n")
    end.

% Q4.b

mercury_two() ->
    receive
	"print" ->
	    io:formt("message~n"),
	    mercury_two()
    end.

% Q4.c
