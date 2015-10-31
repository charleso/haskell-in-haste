module Chat.Bot.Answer.Guess where

import           Chat.Bot.Misc.Guess


guessMeAnswer :: Int -> Int -> GuessResult
guessMeAnswer s g =
  if s < g
    then GuessLower
    else if s > g
      then GuessHigher
      else GuessCorrect

guessRenderAnswer :: GuessResult -> String
guessRenderAnswer r =
  case r of
    GuessLower -> "lower"
    GuessHigher -> "higher"
    GuessCorrect -> "hit!"
