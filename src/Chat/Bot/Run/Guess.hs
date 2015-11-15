module Chat.Bot.Run.Guess where

import           Chat.Data
import           Chat.Bot.Guess
import           Chat.Bot.Misc.Guess
import           Control.Concurrent
import           Control.Monad
import           Data.List
import           System.Random


guessBot :: IO Bot
guessBot = do
  secretVar <- newMVar 0
  nextGuess secretVar
  return $ \m -> case stripPrefix "/guess " m of
    Nothing ->
      return Nothing
    Just number -> do
      secret <- readMVar secretVar
      let guessResult = guess secret (read number)
      case guessResult of
        GuessCorrect ->
          -- Reset the guess when it's correct
          nextGuess secretVar
        _ ->
          return ()
      return (Just (guessRender guessResult))

nextGuess :: MVar Int -> IO ()
nextGuess secretVar =
  modifyMVar_  secretVar $ \_ ->
    getStdRandom $ randomR (1, 100)
