module Chat.Bot.Ping where

import           Chat.Bot.Answer.Ping
import           Chat.Data

{-
  USAGE: /ping

  EXAMPLE:
    > /ping
    pong
-}

-- | LEVEL: Example
--
-- >>> pingBot "/ping"
-- JustReply "pong"
-- >>> pingBot "/pong"
-- NothingReply
pingBot :: String -> MaybeReply
pingBot message =
  notImplemented "pingBot" (pingBotAnswer message)
