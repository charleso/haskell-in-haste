module Chat.Bot.Answer.Hangman where

import           Chat.Bot.Misc.Hangman


hangmanGuessAnswer :: Char -> String -> HangmanGuess
hangmanGuessAnswer char word =
  if elem char word
    then HangmanRight char
    else HangmanWrong char

hangmanGuessesAnswer :: String -> [Char] -> [HangmanGuess]
hangmanGuessesAnswer word guesses =
  let guess c = hangmanGuessAnswer c word
  in map guess guesses

hangmanHasWonAnswer :: String -> [HangmanGuess] -> Bool
hangmanHasWonAnswer word guesses =
  let notGuessed c = not (elem c ([' '] ++ map hangmanGuessChar guesses))
  in length (filter notGuessed word) == 0

hangmanWrongGuessesAnswer :: [HangmanGuess] -> [Char]
hangmanWrongGuessesAnswer guesses =
  let isWrong (HangmanWrong _) = True
      isWrong (HangmanRight _) = False
  in map hangmanGuessChar (filter isWrong guesses)

hangmanRenderAnswer :: String -> [HangmanGuess] -> String
hangmanRenderAnswer word guesses =
  let lookupChar c =
        if c == ' ' || elem c (map hangmanGuessChar guesses)
          then c
          else '_'
  in map lookupChar word ++ " [" ++ hangmanWrongGuessesAnswer guesses ++ "]"

hangmanGuessChar :: HangmanGuess -> Char
hangmanGuessChar (HangmanRight c) = c
hangmanGuessChar (HangmanWrong c) = c
