# Tchoupi Erlang

* Install [Erlang](http://www.erlang.org/)
* Compile using [erlang.mk](https://github.com/ninenines/erlang.mk):

        $ make

* Launch:

        $ make run

* Check URL :  http://localhost:8080

* From the Erlang shell, type :

        (tchoupi_example@127.0.0.1)1> application:which_applications().:
        [{tchoupi,[],"rolling"},
         {cowboy,"Small, fast, modular HTTP server.","2.0.0-pre.2"},
         {cowlib,"Support library for manipulating Web protocols.",
             "1.3.0"},
         {ranch,"Socket acceptor pool for TCP protocols.","1.1.0"},
         {crypto,"CRYPTO","3.6.1"},
         {stdlib,"ERTS  CXC 138 10","2.6"},
         {kernel,"ERTS  CXC 138 10","4.1"}]

You can use *Ctrl-G q* to exit the Erlang shell.
