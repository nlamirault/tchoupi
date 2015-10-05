
%% @doc Version handler.
-module(version_handler).

-export([init/2]).

init(Req, Opts) ->
	Req2 = cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain">>}
	], <<"{\"version\": \"0.1.0\"}">>, Req),
	{ok, Req2, Opts}.
