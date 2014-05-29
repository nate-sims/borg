-module(otp_super).

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
    Server = {otp_server_sup, {otp_server_sup, start_link, []},
	      permanent, 2000, supervisor, [opt_server_sup]},
    Events = {otp_events, {otp_events, start_link, []},
	      permanent, 2000, worker, [otp_events]},
    Children = [Server, Events],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.

