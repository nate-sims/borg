-module(borg_server_sup).

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
    Server = {borg_server, {borg_server, start_link, []},
	      permanent, 2000, worker, [borg_server]},
    Children = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.

