-module(mod1).
-export([test/0]).

test() ->
  4 = len([1, 7, 2, 9]),
  120 = fac(5),
  10 = sum([1, 2, 3, 4]),
  [2, 3, 4] = reverse([4, 3, 2]),
  [2, 4, 6, 8] = map([1, 2, 3, 4], fun(X) -> 2*X end),
  [{a, 1}, {b, 2}, {c, 3}] = zip([a, b, c], [1, 2, 3]),
  [6, 6, 6, 6] = repeat(6, 4),
  [1, 2, 3, 4] = sublist([1, 2, 3, 4, 5, 6, 7], 4),
  hooray.

%% l([]) ->
%%   0;
%% l([_ | T]) ->
%%   1 + l(T).

len(L) ->
  len(L, 0).
len([], Acc) -> Acc;
len([_ | T], Acc) ->
  len(T, Acc + 1).

%% fac(0) ->
%%   1;
%% fac(N) ->
%%   N * fac(N - 1).

fac(N) -> fac(N, 1).
fac(0, Acc) -> Acc;
fac(N, Acc) when N > 0 ->
  fac(N - 1, Acc * N).

%% sum([]) -> 0;
%% sum([I | T]) ->
%%   I + sum(T).

sum(Arr) -> sum(0, Arr).
sum(N, []) -> N;
sum(N, [H | Arr]) ->
  sum(N + H, Arr).

%% map([], F) ->
%%   [];
%% map([H | T], F) ->
%%   [F(H) | map(T, F)].

map(Arr, F) ->
  map(Arr, F, []).
map([], _, Acc) -> Acc;
map([H | T], F, Acc) ->
  map(T, F, Acc ++ [F(H)]).

%% reverse([]) ->
%%   [];
%% reverse([H | T]) ->
%%   reverse(T) ++ [H].

reverse(Arr) ->
  reverse([], Arr).
reverse(Acc, [])
  -> Acc;
reverse(Acc, [H | T]) ->
  reverse([H | Acc], T).

%% zip([], []) ->
%%   [];
%% zip([H1 | T1], [H2 | T2]) ->
%%   [{H1, H2} | zip(T1, T2)].

zip(Arr1, Arr2) ->
  zip([], Arr1, Arr2).
zip(Acc, [], []) ->
  Acc;
zip(Acc, [H1 | T1], [H2 | T2]) ->
  zip(Acc ++ [{H1, H2}], T1, T2).

%% repeat(T, 1) ->
%%   [T];
%% repeat(T, N) when N > 0 ->
%%   [T] ++ repeat(T, N - 1).

repeat(T, N) when N > 0 ->
  repeat(T, N, []).
repeat(T, 1, Acc) ->
  [T | Acc];
repeat(T, N, Acc) ->
  repeat(T, N - 1, [T | Acc]).

%% sublist(_, 0) ->
%%   [];
%% sublist([H | T], N) ->
%%   [H | sublist(T, N - 1)].

sublist(Arr, N) ->
  sublist(Arr, N, []).
sublist(_, 0, Acc) ->
  Acc;
sublist([H | T], N, Acc) ->
  sublist(T, N - 1, Acc ++ [H]).
