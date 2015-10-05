%%% @author Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @copyright (C) 2013, 2015, Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @doc
%%%s
%%% @end
%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

-module(tchoupi_app).

-behaviour(application).

%% Application callbacks
-export([start/2]).
-export([stop/1]).

-define(C_ACCEPTORS,  100).

%% ===================================================================
%% Application callbacks
%% ===================================================================

-spec start(_,_) -> {'ok',pid()}.
start(_StartType, _StartArgs) ->
    %% lager:set_loglevel(lager_console_backend, debug),
    %% lager:set_loglevel(lager_file_backend, "console.log", debug),
    lager:info("Launch Tchoupi"),
    lager:info("node: ~p", [node()]),
    Routes = routes(),
    Port = port(),
    Dispatch = cowboy_router:compile(Routes),
    TransOpts = [{port, Port}],
    ProtoOpts = [{env, [{dispatch, Dispatch}]}],
    {ok, _} = cowboy:start_http(http, ?C_ACCEPTORS, TransOpts, ProtoOpts),
    tchoupi_sup:start_link().

-spec stop(_) -> 'ok'.
stop(_State) ->
    ok.

%% ===================================================================
%% Internal functions
%% ===================================================================

routes() ->
    [
     {'_', [
	    {"/version", version_handler, []}
	   ]}
    ].

port() ->
    case os:getenv("PORT") of
        false ->
            {ok, Port} = application:get_env(http_port),
            Port;
        Other ->
            Other
    end.
