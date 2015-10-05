%%% @author Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @copyright (C) 2013, Nicolas Lamirault
%%% @doc
%%%
%%% @end
%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

-module(tchoupi).

-export([start/0]).
-export([stop/0]).

start() ->
    ok = application:start(crypto),
    ok = application:start(ranch),
    ok = application:start(cowboy),
    ok = application:start(tchoupi).

stop() ->
    application:stop(tchoupi),
    application:stop(cowboy),
    application:stop(ranch),
    application:stop(crypto),
    ok.
