# Tchoupi OCaml

* Install [OPam](http://opam.ocamlpro.com/), the package manager for [OCaml][]

* Install requirements  :

        $ opam init
        $ opam install camlp4

If it fails :

    $ opam switch 4.02.3
    $ opam config env
    $ opam install camlp4

* Install dependencies

        $ opam install opium

* Build the webservice :

        $ make

* Launch it :

        $ ./tchoupi.byte -d -p 5000

* Then :

        $ curl http://localhost:5000/version
