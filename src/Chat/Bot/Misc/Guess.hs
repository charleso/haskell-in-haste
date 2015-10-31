module Chat.Bot.Misc.Guess where

import           Chat.Data


data GuessResult =
    GuessLower
  | GuessHigher
  | GuessCorrect
  deriving (Eq, Show)
