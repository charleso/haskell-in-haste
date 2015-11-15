module Chat.Bot.Answer.Vote where

import           Chat.Bot.Misc.Vote


createPollAnswer :: String -> [String] -> Poll
createPollAnswer question answers =
  let initialVote answer = Vote answer 0
  in Poll question (map initialVote answers)

castVoteAnswer :: Poll -> String -> Poll
castVoteAnswer (Poll question votes) vote =
  let updateQuestion (Vote answer count) =
        Vote answer (if answer == vote then count + 1 else count)
  in Poll question (map updateQuestion votes)

pollRenderAnswer :: Poll -> String
pollRenderAnswer (Poll question votes) =
  let voteRender (Vote answer count) = answer ++ ": " ++ show count
  in question ++ "\n" ++ unlines (map voteRender votes)
