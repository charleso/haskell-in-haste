module Chat.Bot.Guess where

import           Chat.Data
import           Control.Concurrent
import           Control.Monad
import           Data.List
import           System.Random


-- LEVEL: Easy
--
-- This requires implementing comparing two numbers and display a message depending on the result
guessMe :: Secret -> Guess -> String
guessMe s g = case compare s g of
  LT -> "lower"
  GT -> "higher"
  EQ -> "hit!"

type Guess = Int
type Secret = Int

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
