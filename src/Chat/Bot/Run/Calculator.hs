{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Run.Calculator where

import           Chat.Bot.Calculator
import           Chat.Data
import           Data.List (stripPrefix)


calculatorBot :: String -> MaybeReply
calculatorBot message =
  case stripPrefix "/calculator " message of
    Nothing -> NothingReply
    Just string -> JustReply (calculateParse string)
