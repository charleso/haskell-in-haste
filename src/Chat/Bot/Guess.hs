module Chat.Bot.Guess where

import           Chat.Bot.Answer.Guess
import           Chat.Bot.Misc.Guess
import           Chat.Data

{-
  LEVEL: Easy

  USAGE: /guess number

  Guess a randomly number between 1 and 100.

  EXAMPLE:
    > /guess 50
    higher
    > /guess 100
    lower
    > /guess 75
    hit
-}

-- |
--
-- This requires implementing comparing two numbers and display a message depending on the result
--
-- >>> guess 1 2
-- GuessLower
-- >>> guess 2 1
-- GuessHigher
-- >>> guess 2 2
-- GuessCorrect
guess :: Int -> Int -> GuessResult
guess secret number =
  notImplemented "Guess.guessMe" (guessAnswer secret number)

-- |
--
-- Just print something nice for the user
guessRender :: GuessResult -> String
guessRender result =
  notImplemented "Guess.guessRender" (guessRenderAnswer result)


-- See Misc/Guess.hs
{-
data GuessResult =
    GuessLower
  | GuessHigher
  | GuessCorrect
  deriving (Eq, Show)
-}
