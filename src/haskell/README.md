# Tchoupi Hashell

* Install [Haskell](http://www.haskell.org):

* Install the [Cabal](http://www.haskell.org/cabal/) package manager:

        $ sudo apt-get install cabal-install

* Install the [Snap](http://snapframework.com) framework :

        $ cabal update
		$ cabal install snap
		$ PATH=$HOME/.cabal/bin:$PATH

* Compile and launch :

        $ make install
		$ $HOME/.cabal/bin/tchoupi -p 8085
