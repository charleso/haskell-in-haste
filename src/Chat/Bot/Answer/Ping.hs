module Chat.Bot.Answer.Ping where

import           Chat.Data


pingBotAnswer :: String -> MaybeReply
pingBotAnswer message =
  case message of
    "/ping" -> JustReply "pong"
    _ -> NothingReply
