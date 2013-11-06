module Paths_tchoupi (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/nlamirault/.cabal/bin"
libdir     = "/home/nlamirault/.cabal/lib/tchoupi-0.1/ghc-7.6.2"
datadir    = "/home/nlamirault/.cabal/share/tchoupi-0.1"
libexecdir = "/home/nlamirault/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "tchoupi_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tchoupi_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "tchoupi_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tchoupi_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
