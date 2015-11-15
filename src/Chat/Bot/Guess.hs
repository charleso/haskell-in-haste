module Chat.Bot.Guess where

import           Chat.Bot.Answer.Guess
import           Chat.Bot.Misc.Guess
import           Chat.Data

{-
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

-- | LEVEL: Easy
--
-- This requires implementing comparing two numbers and display a message depending on the result
--
-- >>> guessMe 1 2
-- GuessLower
-- >>> guessMe 2 1
-- GuessHigher
-- >>> guessMe 2 2
-- GuessCorrect
guess :: Int -> Int -> GuessResult
guess secret number =
  notImplemented "Guess.guessMe" (guessAnswer secret number)

-- | LEVEL: Easy
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
