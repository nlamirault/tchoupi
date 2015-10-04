%%% @author Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @copyright (C) 2013, 2015, Nicolas Lamirault
%%% @doc
%%% The Version API
%%% @end
%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

-module(version_handler).

%% API

-export([init/3]).
-export([content_types_provided/2]).
-export([version_to_json/2]).

%%
%% Implementation
%%

init(_Transport, _Req, []) ->
    {upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
    {[
      {<<"application/json">>, version_to_json}
      ],
     Req,
     State}.

version_to_json(Req, State) ->
    Body = <<"{\"version\": \"0.1.0\"}">>,
    {Body, Req, State}.
