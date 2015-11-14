module Chat.Bot.Guess where

import           Chat.Bot.Answer.Guess
import           Chat.Bot.Misc.Guess
import           Chat.Data


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
guessMe :: Int -> Int -> GuessResult
guessMe s g =
  notImplemented "Guess.guessMe" (guessMeAnswer s g)

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
