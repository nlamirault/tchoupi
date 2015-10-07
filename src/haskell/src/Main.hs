{-# LANGUAGE OverloadedStrings #-}
module Main where

-- import Data.Monoid
import Web.Spock.Safe

main :: IO ()
main =
  runSpock 8080 $ spockT id $
  do get root $
       text "Welcome to Tchoupi!"
       -- get ("version" <//> var) $ \name ->
       --     text ("Hello " <> name <> "!")
     get ("version") $
       text "{\"version\": \"1\"}"
