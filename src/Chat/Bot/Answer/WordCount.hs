module Chat.Bot.Answer.WordCount where

import           Chat.Bot.WordCount
import           Chat.Data
import           Data.List (stripPrefix)


wordCountAnswer :: String -> Int
wordCountAnswer s =
  length (wordsAnswer s)

wordsAnswer :: String -> [String]
wordsAnswer s =
  let isSpace c = c == ' '
  in case dropWhile isSpace s of
    "" ->
      []
    s' ->
      let (w, s'') = break isSpace s'
      in w : wordsAnswer s''


wordCountBot :: Bot
wordCountBot m =
  case stripPrefix "/words " m of
    Nothing ->
      return Nothing
    Just w ->
      let wc = wordCount w
      in return (Just (show wc ++ " words"))
