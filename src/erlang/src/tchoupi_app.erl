%%% @author Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @copyright (C) 2013, 2015, Nicolas Lamirault
%%% @doc
%%%s
%%% @end
%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

-module(tchoupi_app).

-author('Nicolas Lamirault <nicolas.lamirault@gmail.com>')

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).


-define(C_ACCEPTORS,  100).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    %%lager:start(),
    Routes = routes(),
    Port = port(),
    Dispatch = cowboy_router:compile(Routes),
    TransOpts = [{port, Port}],
    ProtoOpts = [{env, [{dispatch, Dispatch}]}],
    {ok, _} = cowboy:start_http(http, ?C_ACCEPTORS, TransOpts, ProtoOpts),
    tchoupi_sup:start_link().

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
	    %lager:info("Tchoupi is UP."),
            Port;
        Other ->
            Other
    end.
