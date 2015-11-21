module Chat.Bot.Vote where

import           Chat.Bot.Answer.Vote
import           Chat.Bot.Misc.Vote
import           Chat.Data

{-
  LEVEL: Medium

  USAGE: /poll question answer answer answer
  USAGE: /poll
  USAGE: /vote answer

  Create a poll for people to vote on.

  EXAMPLE:
    > /poll Tabs or Spaces? Tabs Spaces
    Poll created
    > /vote Tabs
    > /vote Spaces
    > /vote Tabs
    > /poll
    Tabs or Spaces? Tabs: 2 Spaces: 1
-}

-- See Misc/Vote.hs
{-
  data Vote = Vote String Int
  data Poll = Poll String [Vote]
-}

-- |
--
-- >>> createPoll "Tabs" ["Yes","No"]
-- Poll "Tabs" [Vote "Yes" 0,Vote "No" 0]
--
-- HINTS:
--
--   map :: (String -> Vote) -> [String] -> [Vote]
--
createPoll :: String -> [String] -> Poll
createPoll question options =
  notImplemented "Vote.createPoll" (createPollAnswer question options)

-- |
--
-- >>> castVote (Poll "Tabs" [Vote "Yes" 0,Vote "No" 0]) "Yes"
-- Poll "Tabs" [Vote "Yes" 1,Vote "No" 0]
-- >>> castVote (Poll "Tabs" [Vote "Yes" 1,Vote "No" 0]) "Yes"
-- Poll "Tabs" [Vote "Yes" 2,Vote "No" 0]
-- >>> castVote (Poll "Tabs" [Vote "Yes" 2,Vote "No" 0]) "Maybe"
-- Poll "Tabs" [Vote "Yes" 2,Vote "No" 0]
--
-- HINTS:
--
--   map :: (Vote -> Vote) -> [Vote] -> [Vote]
--
castVote :: Poll -> String -> Poll
castVote (Poll question options) vote =
  notImplemented "Vote.castVote" (castVoteAnswer (Poll question options) vote)

-- |
--
-- HINTS:
--
--   map :: (Vote -> String) -> [Vote] -> [String]
--   unlines :: [String] -> String
--   ++ :: String -> String -> String
--
pollRender :: Poll -> String
pollRender (Poll question options) =
  notImplemented "Vote.pollRender" (pollRenderAnswer (Poll question options))
