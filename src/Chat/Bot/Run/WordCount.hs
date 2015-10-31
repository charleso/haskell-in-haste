module Chat.Bot.Run.WordCount where

import           Chat.Bot.WordCount
import           Chat.Data
import           Data.List (stripPrefix)


wordCountBot :: Bot
wordCountBot m =
  case stripPrefix "/words " m of
    Nothing ->
      return Nothing
    Just w ->
      let wc = wordCount w
      in return (Just (show wc ++ " words"))
