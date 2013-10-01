%%% @author Nicolas Lamirault <nicolas.lamirault@gmail.com>
%%% @copyright (C) 2013, Nicolas Lamirault
%%% @doc
%%%
%%% @end
%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

-module(api_SUITE).

-include_lib("common_test/include/ct.hrl").

%% CT.
-export([all/0]).
-export([groups/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export([init_per_group/2]).
-export([end_per_group/2]).

%% Tests
-export([api_version/0]).

%% CT

groups() ->
    [].
    %% BaseTests = [
    %% 		 api_version
    %% 		],
    %% [{ws, [parallel], BaseTests}].

all() ->
    [
     api_version
    ].

init_per_suite(Config) ->
    ok = application:start(crypto),
    ok = application:start(ranch),
    ok = application:start(cowboy),
    ok = application:start(tchoupi),
    inets:start(),
    Config.

end_per_suite(_Config) ->
    inets:stop(),
    application:stop(tchoupi),
    application:stop(cowboy),
    application:stop(ranch),
    application:stop(crypto),
    ok.

init_per_group(_GroupName, Config) ->
	Config.

end_per_group(_GroupName, _Config) ->
	ok.

%% Tests

api_version() ->
    {ok, {{_, 200, _}, _, "{\"version\": \"0.1.0\"}"}} =
	httpc:request(get, {"http://localhost:"
			    ++ integer_to_list(8085)
			    ++ "/version",
			    []}),
    ok.
