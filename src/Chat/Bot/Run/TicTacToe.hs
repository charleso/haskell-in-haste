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
  game <- newMVar newGame
  return $ \m -> case stripPrefix "/ttt " m of
    Nothing ->
      return Nothing
    Just g -> do
      turn <- readMVar game
      let g' = readPosition g
      next <- maybe (fail "Invalid position") (return . move turn) g'
      _ <- swapMVar game $ case next of
        Draw _ -> newGame
        Won _ _ -> newGame
        InProgress g -> g
      pure $ Just $ case next of
        InProgress (Game g p) -> printBoard g ++ " [" ++ show p ++ "]"
        Draw b -> printBoard b ++ "[DRAW]"
        Won p b -> printBoard b ++ " [" ++ show p ++ "] WON!"
