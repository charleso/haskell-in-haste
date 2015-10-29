module Chat.Bot.Guess where

import           Chat.Data


-- LEVEL: Easy
--
-- This requires implementing comparing two numbers and display a message depending on the result
guessMe :: Secret -> Guess -> String
guessMe (Secret s) (Guess g) =
  error "guessMe not implemented"

newtype Guess = Guess Int
newtype Secret = Secret Int
