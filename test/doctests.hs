module Main where

import           Build_doctests (deps)
import           Chat

import           Chat.Bot.Calculator
import           Chat.Bot.Misc.Calculator
import           Chat.Bot.Answer.Calculator
import           Chat.Bot.Run.Calculator

import           Chat.Bot.Ping
import           Chat.Bot.Answer.Ping

import           Chat.Bot.Guess
import           Chat.Bot.Misc.Guess
import           Chat.Bot.Answer.Guess
import           Chat.Bot.Run.Guess

import           Chat.Bot.Hangman
import           Chat.Bot.Misc.Hangman
import           Chat.Bot.Answer.Hangman
import           Chat.Bot.Run.Hangman

import           Chat.Bot.Vote
import           Chat.Bot.Misc.Vote
import           Chat.Bot.Answer.Vote
import           Chat.Bot.Run.Vote

import           Chat.Bot.Cipher
import           Chat.Bot.Misc.Cipher
import           Chat.Bot.Answer.Cipher
import           Chat.Bot.Run.Cipher

import           Chat.Bot.TicTacToe
import           Chat.Bot.Misc.TicTacToe
import           Chat.Bot.Answer.TicTacToe
import           Chat.Bot.Run.TicTacToe

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
