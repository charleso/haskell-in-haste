module Chat.Bot.Vote where

import           Chat.Bot.Answer.Vote
import           Chat.Bot.Misc.Vote
import           Chat.Data

{-
  USAGE: /poll question answer answer answer
  USAGE: /poll
  USAGE: /vote answer

  Create a poll for people to vote on.

  EXAMPLE:
    > /poll Tabs Yes No
    Poll created
    > /vote Yes
    > /poll
    Tabs? Yes: 1 No: 0
-}

-- See Misc/Vote.hs
{-
  data Vote = Vote String Int
  data Poll = Poll String [Vote]
-}

-- | LEVEL: Medium
--
-- >>> createPoll "Tabs" ["Yes","No"]
-- Poll "Tabs" [Vote "Yes" 0,Vote "No" 0]
--
-- HINTS:
--
--   map :: (a -> b) -> [a] -> [b]
--
createPoll :: String -> [String] -> Poll
createPoll question options =
  notImplemented "Vote.createPoll" (createPollAnswer question options)

-- | LEVEL: Medium
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
--   map :: (a -> b) -> [a] -> [b]
--
castVote :: Poll -> String -> Poll
castVote (Poll question options) vote =
  notImplemented "Vote.castVote" (castVoteAnswer (Poll question options) vote)

-- | LEVEL: Medium
--
-- HINTS:
--
--   map :: (a -> b) -> [a] -> [b]
--   unlines :: [String] -> String
--   ++ :: [a] -> [a] -> [a]
--
pollRender :: Poll -> String
pollRender (Poll question options) =
  notImplemented "Vote.pollRender" (pollRenderAnswer (Poll question options))
