%% Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at

%%     http://www.apache.org/licenses/LICENSE-2.0

%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(description_handler).

-behaviour(cowboy_http_handler).

%% -include("tchoupi.hrl").

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).


init(_, Req, Opts) ->
    {ok, Req, Opts}.


handle(Req, State) ->
    lager:info("Hello: "),
    %% {Name, Request} = cowboy_req:binding(name, Req),
    {ok, Req2} = cowboy_req:reply(
                   200,
                   [{<<"content-type">>, <<"application/json">>}],
                   "{\"hello\": \"world\"}",
                   Req),
    {ok, Req2, State}.


terminate(_Reason, _Req, _State) ->
    ok.
