module Main where

import           Build_doctests (deps)
import           Chat
import           Control.Applicative
import           Control.Monad
import           Data.Char
import           Data.List
import           Data.Monoid
import           System.Directory
import           System.FilePath
import           System.IO
import           Test.DocTest


main :: IO ()
main =
  tests

tests :: IO ()
tests =
  getBotSources >>= testWithSources

test :: String -> IO ()
test name = do
  sources <- getBotSources
  testWithSources
    $ filter (\f -> isInfixOf (map toLower name) (map toLower f)) sources

testWithSources :: [FilePath] -> IO ()
testWithSources sources =
  forM_ sources $ \source -> do
    hPutStrLn stderr $ "Testing " <> source
    doctest $
        "-isrc"
      : "-idist/build/autogen"
      : "-optP-include"
      : "-optPdist/build/autogen/cabal_macros.h"
      : "-hide-all-packages"
      : map ("-package="++) deps ++ [source]

sourceDirectories :: [FilePath]
sourceDirectories =
  ["src"]

getBotSources :: IO [FilePath]
getBotSources =
  liftM (filter isBot . concat) (mapM go sourceDirectories)
    where
      go dir = do
        (dirs, files) <- getFilesAndDirectories dir
        (files ++) . concat <$> mapM go dirs

isBot :: FilePath -> Bool
isBot p =
  and [
      takeFileName p /= "Setup.hs"
    , isSuffixOf ".hs" p
    , (takeFileName . takeDirectory) p == "Bot"
    ]

getFilesAndDirectories :: FilePath -> IO ([FilePath], [FilePath])
getFilesAndDirectories dir = do
  c <- map (dir </>) . filter (`notElem` ["..", "."]) <$> getDirectoryContents dir
  (,) <$> filterM doesDirectoryExist c <*> filterM doesFileExist c
