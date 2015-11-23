module Chat.Bot.Hangman where

import           Chat.Bot.Answer.Hangman
import           Chat.Bot.Misc.Hangman
import           Chat.Data

{-
  LEVEL: Medium

  USAGE: /hangman [guess]

  Guess a number of characters, or nothing to print out the current state.

  EXAMPLE:
    > /hangman
    ____ ____ []
    > /hangman e
    ____ ____ [e]
    > /hangman z
    __zz __zz [e]
    > /hangman a
    __zz __zz [ae]
    > /hangman b
    __zz b_zz [ae]
-}

-- $setup
-- >>> let word = "fizz buzz"

-- |
-- >>> hangmanGuess 'u' word
-- HangmanRight 'u'
-- >>> hangmanGuess 'o' word
-- HangmanWrong 'o'
--
-- HINTS:
--   elem :: Char -> String -> Bool
--
hangmanGuess :: Char -> String -> HangmanGuess
hangmanGuess char word=
  notImplemented "Hangman.hangmanGuess" (hangmanGuessAnswer char word)

-- |
-- >>> hangmanGuesses word "z"
-- [HangmanRight 'z']
-- >>> hangmanGuesses word "xz"
-- [HangmanWrong 'x',HangmanRight 'z']
--
-- HINTS:
--   map :: (Char -> HangmanGuess) -> [Char] -> [HangmanGuess]
--
hangmanGuesses :: String -> [Char] -> [HangmanGuess]
hangmanGuesses word guesses =
  notImplemented "Hangman.hangmanGuesses" (hangmanGuessesAnswer word guesses)

-- |
-- >>> hangmanHasWon word (hangmanGuesses word "z")
-- False
-- >>> hangmanHasWon word (hangmanGuesses word "ibfz")
-- False
-- >>> hangmanHasWon word (hangmanGuesses word "uibfz")
-- True
--
-- HINTS:
--   elem :: Char -> String -> Bool
--   map :: (HangmanGuess -> Char) -> [HangmanGuess] -> [Char]
--   filter :: (Char -> Bool) -> String -> String
hangmanHasWon :: String -> [HangmanGuess] -> Bool
hangmanHasWon word guesses =
  notImplemented "Hangman.hangmanHasWon" (hangmanHasWonAnswer word guesses)

-- |
-- >>> hangmanWrongGuesses (hangmanGuesses word "z")
-- ""
-- >>> hangmanWrongGuesses (hangmanGuesses word "uxibmfpz")
-- "xmp"
--
-- HINTS:
--   filter :: (HangmanGuess -> Bool) -> [HangmanGuess] -> [HangmanGuess]
--   map :: (HangmanGuess -> Char) -> [HangmanGuess] -> [Char]
hangmanWrongGuesses :: [HangmanGuess] -> [Char]
hangmanWrongGuesses guesses =
  notImplemented "Hangman.hangmanWrongGuesses" (hangmanWrongGuessesAnswer guesses)


-- |
-- >>> hangmanRender word (hangmanGuesses word "z")
-- "__zz __zz []"
-- >>> hangmanRender word (hangmanGuesses word "xiuz")
-- "_izz _uzz [x]"
-- >>> hangmanRender word (hangmanGuesses word "bxiuz")
-- "_izz buzz [x]"
--
-- HINTS:
--   elem :: Char -> String -> Bool
--   map :: (Char -> Char) -> String -> String
--
hangmanRender :: String -> [HangmanGuess] -> String
hangmanRender word guesses =
  notImplemented "Hangman.hangmanRender" (hangmanRenderAnswer word guesses)

-- See Misc/Hangman.hs
{-
data HangmanGuess =
    HangmanRight Char
  | HangmanWrong Char
  deriving (Eq, Show)
-}

hangmanWords :: [String]
hangmanWords = [
    "hello world"
  , "fizz buzz"
  , "women who code"
  ]
