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
    Port = application:get_env(tchoupi, http_port, 8080),
    Dispatch = cowboy_router:compile([
          {'_', [
                 {"/", home_handler, []},
                 {"/version", version_handler, []}
                ]}
    ]),
    {ok, _} = cowboy:start_http(
                       tchoupi_listener, 100,
                       [{port, Port}],
                       [{env, [{dispatch, Dispatch}]},
                        {max_keepalive, 5},
                        {timeout, 50000}]),
    io:format("~n~n[tchoupi]: Started the serverat port ~p.~n~n", [Port]),
    tchoupi_sup:start_link().


%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
