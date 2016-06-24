%% Copyright (C) 2014, 2015, 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at

%%     http://www.apache.org/licenses/LICENSE-2.0

%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(tchoupi_app).

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    lager:start(),
    Port = application:get_env(tchoupi, http_port, 8080),
    {ok, _} = cowboy:start_http(
                tchoupi_server,
                100,
                [{port, Port}],
                [{env, [{dispatch, dispatch('_')}]},
                 {max_keepalive, 5},
                 {timeout, 50000}]),
    lager:info("Starting Tchoupi on ~p", [Port]),
    tchoupi_sup:start_link().


stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

dispatch(Host) ->
  Routes = routes(),
  lager:info("Routes: ~p", [routes()]),
  cowboy_router:compile([{Host, Routes}]).

routes() ->
  api_routes() ++
  system_routes().

api_routes() ->
    version("v1", [
                   {"/hello/:name", description_handler, []}
                  ]).

version(Version, Routes) when is_list(Routes) ->
  [version(Version, Route) || Route <- Routes];

version(Version, {Route, Handler, Options}) ->
  {"/api/" ++ Version ++ Route, Handler, Options}.

system_routes() ->
  [{"/", home_handler, []},
   {"/api/version", version_handler, []}].
