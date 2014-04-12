# Tchoupi Erlang

* Install [Erlang](http://www.erlang.org/)
* Get dependencies using [Rebar](https://github.com/rebar/rebar):

        $ ./rebar get-deps

* Compile and launch:

        $ make compile start

* From the Erlang shell, type : *application:which_applications().*:

        erl> application:which_applications().
		[{tchoupi,"The Tchoupi webservice","0.1.0"},
		{cowboy,"Small, fast, modular HTTP server.","0.8.6"},
		{ranch,"Socket acceptor pool for TCP protocols.","0.8.4"},
		{crypto,"CRYPTO version 2","3.0"},
		{stdlib,"ERTS  CXC 138 10","1.19.3"},
		{kernel,"ERTS  CXC 138 10","2.16.3"}]

You can use *Ctrl-G q* to exit the Erlang shell.
