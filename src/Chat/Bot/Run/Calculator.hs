{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Run.Calculator where

import           Chat.Bot.Calculator
import           Chat.Data
import           Data.List (stripPrefix)


calculatorBot :: Bot
calculatorBot m =
  case stripPrefix "/calculator " m of
    Nothing -> noMessage
    Just m' -> message
      . either id show
      $ calculateParse m'
