module Chat.Bot.Answer.Guess where

import           Chat.Data
import           Chat.Bot.Guess
import           Control.Concurrent
import           Control.Monad
import           Data.List
import           System.Random


guessMeAnswer :: Int -> Int -> String
guessMeAnswer s g = case compare s g of
  LT -> "lower"
  GT -> "higher"
  EQ -> "hit!"

-------------------------------------------------------------------
------------------------- IGNORE BELOW HERE -----------------------
-------------------------------------------------------------------

guessBot :: IO Bot
guessBot = do
  number <- newMVar 0
  nextGuess number
  return $ \m -> case stripPrefix "/guess " m of
    Nothing ->
      return Nothing
    Just g -> do
      n <- readMVar number
      let g' = read g
      -- Reset the guess when it's correct
      when (n == g') $ nextGuess number
      return . Just $ guessMe n g'

nextGuess :: MVar Int -> IO ()
nextGuess number =
  modifyMVar_  number $ \_ ->
    getStdRandom $ randomR (1, 100)
