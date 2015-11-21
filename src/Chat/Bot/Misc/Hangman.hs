module Chat.Bot.Misc.Hangman where


data HangmanGuess =
    HangmanRight Char
  | HangmanWrong Char
  deriving (Eq, Show)


hangmanMaxGuesses :: Int
hangmanMaxGuesses = 7
