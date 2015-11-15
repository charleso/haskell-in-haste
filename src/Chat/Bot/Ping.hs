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
-- Just "pong"
-- >>> pingBot "/pong"
-- Nothing
pingBot :: String -> Maybe String
pingBot message =
  notImplemented "pingBot" (pingBotAnswer message)
