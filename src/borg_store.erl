-module(borg_store).

-include_lib("../include/borg.hrl").

%% Module Functions
-export([
	 init/0,
	 start/0,
	 stop/0
	 ]).

%% Store Functions
-export([
	 add/1,
	 delete/1,
	 get/1,
	 update/2
	 ]).


init() ->
    mnesia:create_table(borg, [{attributes, record_info(fields, borg)}]).

start() ->
    mnesia:start().

stop() ->
    mnesia:stop().

add(_Node) ->
   ok.

delete(_Node) -> 
    ok.

get(_Node) ->
    ok.

update(_Node, _Attrs) -> 
    ok.

