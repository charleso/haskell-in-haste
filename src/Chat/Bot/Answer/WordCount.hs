module Chat.Bot.Answer.WordCount where


wordCountAnswer :: String -> Int
wordCountAnswer s =
  length (wordsAnswer s)

wordsAnswer :: String -> [String]
wordsAnswer s =
  let isSpace c = c == ' '
  in case dropWhile isSpace s of
    "" ->
      []
    s' ->
      let (w, s'') = break isSpace s'
      in w : wordsAnswer s''
