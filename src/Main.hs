{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
import Chat


main :: IO ()
main =
  startChat [
      marcoPolo
    ]


-- | A bot is just a function that might return a new message
type Bot = String -> Maybe String

marcoPolo :: Bot
marcoPolo "marco" = Just "polo"
marcoPolo _ = Nothing
