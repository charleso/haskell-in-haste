module Chat.Bot.Run.Hangman where

import           Chat.Data
import           Chat.Bot.Hangman
import           Chat.Bot.Misc.Hangman
import           Control.Concurrent
import           Control.Monad
import           Data.List
import           System.Random


data HangmanGame =
    HangmanGame String [HangmanGuess]
  deriving (Eq, Show)

hangmanBot :: IO Bot
hangmanBot = do
  var <- newHangman >>= newMVar
  return $ \m -> case stripPrefix "/hangman" m of
    Nothing ->
      return Nothing
    Just string -> do
      HangmanGame word guesses <- readMVar var
      let allGuesses = nub $ guesses ++ hangmanGuesses word (filter (/= ' ') string)
      let hasWon = hangmanHasWon word allGuesses
      let hasLost = length (hangmanWrongGuesses allGuesses) >= hangmanMaxGuesses
      nextRound <-
        if hasWon
          then newHangman
          else if hasLost
            then newHangman
            else return (HangmanGame word allGuesses)
      swapMVar var nextRound
      let render = hangmanRender word allGuesses
      return $ Just $
        if hasWon
          then "Win! " ++ render
          else if hasLost
            then "Loss! " ++ render ++ " it was: \"" ++ word ++ "\""
            else render

newHangman :: IO HangmanGame
newHangman  = do
  i <- getStdRandom $ randomR (0, length hangmanWords - 1)
  return $ HangmanGame (hangmanWords !! i) []
