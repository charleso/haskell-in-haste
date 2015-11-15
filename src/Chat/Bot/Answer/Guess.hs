module Chat.Bot.Answer.Guess where

import           Chat.Bot.Misc.Guess


guessAnswer :: Int -> Int -> GuessResult
guessAnswer secret number =
  if secret < number
    then GuessLower
    else if secret > number
      then GuessHigher
      else GuessCorrect

guessRenderAnswer :: GuessResult -> String
guessRenderAnswer r =
  case r of
    GuessLower -> "lower"
    GuessHigher -> "higher"
    GuessCorrect -> "hit!"
