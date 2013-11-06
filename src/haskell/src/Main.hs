{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "Tchoupi") <|>
    route [
      -- ("foo", writeBS "bar")
      -- , ("echo/:echoparam", echoHandler)
      ("version", versionHandler)
      ] <|>
    dir "static" (serveDirectory ".")

-- echoHandler :: Snap ()
-- echoHandler = do
--     param <- getParam "echoparam"
--     maybe (writeBS "must specify echo/param in URL")
--           writeBS param

versionHandler :: Snap ()
versionHandler = do
  writeBS "{\"version\" : \"0.1.0\"}"
