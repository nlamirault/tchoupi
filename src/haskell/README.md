# Tchoupi Hashell

* Install [Haskell](http://www.haskell.org):

* Install the [Cabal](http://www.haskell.org/cabal/) package manager:

* Install [Stack](https://www.stackage.org/)  :

        $ cabal update
        $ wget https://www.stackage.org/lts/cabal.config
        $ cabal update
        $ cabal install

* Compile and launch :

        $ make install
		$ $HOME/.cabal/bin/tchoupi -p 8085
