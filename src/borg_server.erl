-module(borg_server).

-behaviour(gen_server).

-include_lib("../include/borg.hrl").

%% API
-export([
	 call/0,
	 count/0,
	 start_link/0,
	 start_link/1,
	 stop/0
	 ]).

%% Gen Server Callbacks
-export([
	 init/1,
	 handle_call/3,
	 handle_cast/2,
	 handle_info/2,
	 terminate/2,
	 code_change/3
	 ]).

%-record(state, {count = 0}).


call() ->
    gen_server:call(?MODULE, call).

count() ->
    gen_server:call(?MODULE, count).

start_link(_Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

start_link() ->
    start_link([]).

stop() ->
    gen_server:cast(?MODULE, stop).

init(_Args) ->
    node_name(node()),
    {ok, #borg_server{}, 0}.

handle_call(count, _From, State) ->
    {reply, {ok, State#borg_server.count}, State};
handle_call(call, _From, State) ->
    Call_count = State#borg_server.count + 1,
    {reply, {ok, Call_count}, State#borg_server{count = Call_count}}. 

handle_cast(stop, State) ->
    {stop, normal, State}.

handle_info(timeout, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

node_name('nonode@nohost') ->
    net_kernel:start(['borg', longnames]);
node_name(_Name) ->
    ok.
