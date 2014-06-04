-module(borg_event_logger).

-behaviour(gen_event).

-include_lib("include/borg.hrl").

%% API
-export([
	 add_handler/0,
	 delete_handler/0
	 ]).

%% Gen Event Callback
-export([
	 init/1,
	 handle_event/2,
	 handle_call/2,
	 handle_info/2,
	 code_change/3,
	 terminate/2
	 ]).

add_handler() ->
    borg_events:add_handler(?MODULE, []).

delete_handler() ->
    borg_events:delete_handler(?MODULE, []).

init([]) ->
    {ok, #state{}}.

handle_event({Event}, State) ->
    error_logger:info_msg("~w~n", [Event]),
    {ok, State}.

handle_call(_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

handle_info(_Info, State) ->
    {ok, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_Old_vsn, State, _Extra) ->
    {ok, State}.
