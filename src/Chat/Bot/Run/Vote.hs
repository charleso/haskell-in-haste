module Chat.Bot.Run.Vote where

import           Chat.Data
import           Chat.Bot.Vote
import           Chat.Bot.Misc.Vote
import           Control.Concurrent
import           Control.Monad
import           Data.List


voteBot :: IO Bot
voteBot = do
  pollVar <- newMVar (Poll "Empty" [])
  return $ \m -> case stripPrefix "/poll" m of
    Nothing ->
      case stripPrefix "/vote " m of
        Nothing ->
          return Nothing
        Just vote -> do
          modifyMVar_ pollVar (\poll -> return (castVote poll vote))
          pure Nothing
    Just string -> do
      case words string of
        [] -> do
          poll <- readMVar pollVar
          return (Just (pollRender poll))
        question : answers -> do
          _ <- swapMVar pollVar (createPoll question answers)
          return (Just "Poll created")
