
%% @private
-module(tchoupi_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).


-define(C_ACCEPTORS,  100).

%% API.

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
    	{'_', [
    		{"/version", version_handler, []}
    	]}
    ]),
    {ok, _} = cowboy:start_http(
                http, 100, [{port, 8080}], [{env, [{dispatch, Dispatch}]}]),
    tchoupi_sup:start_link().

stop(_State) ->
    ok.
