module Chat.Bot.Ping where

import           Chat.Bot.Answer.Ping
import           Chat.Data

{-
  LEVEL: Example

  USAGE: /ping

  EXAMPLE:
    > /ping
    pong
-}

-- |
--
-- >>> pingBot "/ping"
-- JustReply "pong"
-- >>> pingBot "/pong"
-- NothingReply
pingBot :: String -> MaybeReply
pingBot message =
  notImplemented "pingBot" (pingBotAnswer message)
