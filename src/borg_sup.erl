-module(borg_sup).

-behaviour(supervisor).

%% API
-export([
	 start_link/0
	 ]).

%% Supervisor Callbacks
-export([
	 init/1
	 ]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
    Server = {borg_server_sup, {borg_server_sup, start_link, []},
	      permanent, 2000, supervisor, [borg_server_sup]},
    Events = {borg_events, {borg_events, start_link, []},
	      permanent, 2000, worker, [borg_events]},
    Children = [Server, Events],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.

