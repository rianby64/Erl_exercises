-module(mod1).
-export([test/0]).

test() ->
  4 = l([1, 7, 2, 9]),
  120 = fac(5),
  10 = sum([1, 2, 3, 4]),
  [2, 3, 4] = reverse([4, 3, 2]),
  [2, 4, 6, 8] = map([1, 2, 3, 4], fun(X) -> 2*X end).

%% l([]) ->
%%   0;
%% l([_|T]) ->
%%   1 + l(T).

l(L) ->
  t_l(L, 0).

t_l([], Acc) -> Acc;
t_l([_|T], Acc) ->
  t_l(T, Acc + 1).

%% fac(0) ->
%%   1;
%% fac(N) ->
%%   N * fac(N - 1).

fac(N) -> t_fac(N, 1).
t_fac(0, Acc) -> Acc;
t_fac(N, Acc) when N > 0 ->
  t_fac(N - 1, Acc * N).

%% sum([]) -> 0;
%% sum([I|T]) ->
%%   I + sum(T).

sum(Arr) -> t_sum(0, Arr).
t_sum(N, []) -> N;
t_sum(N, [H|Arr]) ->
  t_sum(N + H, Arr).

%% map([], F) ->
%%   [];
%% map([H|T], F) ->
%%   [F(H)|map(T, F)].

map(Arr, F) ->
  reverse(t_map(Arr, F, [])).
t_map([], _, Acc) -> Acc;
t_map([H|T], F, Acc) ->
  t_map(T, F, [F(H)|Acc]).

%% reverse([]) ->
%%   [];
%% reverse([H|T]) ->
%%   reverse(T) ++ [H].

reverse(Arr) ->
  t_reverse([], Arr).
t_reverse(Acc, [])
  -> Acc;
t_reverse(Acc, [H|T]) ->
  t_reverse([H] ++ Acc, T).
