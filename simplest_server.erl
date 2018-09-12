-module(simplest_server).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2,
  handle_info/2, code_change/3, terminate/2]).
-export([start_link/0, call_async/2, call_sync/2, call_terminate/1]).

call_async(Pid, Payload) ->
  gen_server:cast(Pid, Payload).

call_sync(Pid, Payload) ->
  gen_server:call(Pid, Payload).

call_terminate(Pid) ->
  gen_server:call(Pid, terminate).

start_link() ->
  gen_server:start_link(?MODULE, [], []).

init([]) -> { ok, [] }.

handle_call(Message, From, State) ->
  io:format("handle_call Message: ~p, From: ~p, State: ~p ~n",
            [Message, From, State]),
  { reply, Message, [Message|State] }.

handle_cast(Message, State) ->
  io:format("handle_cast Message: ~p, State: ~p ~n", [Message, State]),
  { noreply, [Message|State] }.

handle_info(Messages, State) ->
  io:format("handle_info Messages: ~p, State: ~p ~n", [Messages, State]),
  { noreply, [fromoutside|State] }.

code_change(PreviousVersion, State, Extra) ->
  io:format("code_change PreviousVersion: ~p, State: ~p, Extra: ~p ~n",
            [PreviousVersion, State, Extra]),
  { ok, State }.

terminate(Reason, State) ->
  io:format("terminate Reason: ~p, State: ~p ~n", [Reason, State]),
  ok.
