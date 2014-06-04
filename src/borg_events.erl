-module(borg_events).

-include_lib("include/borg.hrl").

-export([
	 start_link/0,
	 add_handler/2,
	 delete_handler/2,
	 call/0,
	 count/0
	 ]).

start_link() ->
    gen_event:start_link({local, ?MODULE}).

add_handler(Handler, Args) ->
    gen_event:add_handler(?MODULE, Handler, Args).

delete_handler(Handler, Args) ->
    gen_event:delete_handler(?MODULE, Handler, Args).

call() ->
    gen_event:notify(?MODULE, {call}).

count() ->
    gen_event:notify(?MODULE, {count}).
