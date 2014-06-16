-module(borg_app).

-behaviour(application).

-include_lib("../include/borg.hrl").

-export([
	 start/2,
	 stop/1
	 ]).

start(_Type, _StartArgs) ->
    case borg_sup:start_link() of
	{ok, Pid} ->
	    {ok,Pid};
	Other ->
	    {error, Other}
    end.

stop(_State) ->
    ok.
