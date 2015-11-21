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
      case break (== '?') string of
        ([], []) -> do
          poll <- readMVar pollVar
          return (Just (pollRender poll))
        (_, []) ->
          return (Just "No question, must contain a question ending in '?'")
        (question, _ : answers) -> do
          _ <- swapMVar pollVar (createPoll (question ++ "?") (words answers))
          return (Just "Poll created")
