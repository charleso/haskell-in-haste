module Chat.Bot.Run.TicTacToe where

import           Chat.Bot.TicTacToe
import           Chat.Bot.Misc.TicTacToe
import           Chat.Data
import           Control.Concurrent
import           Data.Char
import           Data.Ord
import           Data.List


ticTacToeBot :: IO Bot
ticTacToeBot = do
  game <- newMVar []
  return $ \m -> case stripPrefix "/ttt " m of
    Nothing ->
      return Nothing
    Just g -> do
      b <- readMVar game
      let g' = readPosition g
      return $ maybe (Just "Invalid position") undefined g'
