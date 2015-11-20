module Chat.Bot.Misc.Hangman where


data HangmanWord =
    HangmanWord String
  deriving (Eq, Show)

data HangmanGuess =
    HangmanRight Char
  | HangmanWrong Char
  deriving (Eq, Show)


hangmanMaxGuesses :: Int
hangmanMaxGuesses = 7
