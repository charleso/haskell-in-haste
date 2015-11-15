module Chat.Bot.Answer.Ping where


pingBotAnswer :: String -> Maybe String
pingBotAnswer message =
  case message of
    "/ping" -> Just "pong"
    _ -> Nothing
