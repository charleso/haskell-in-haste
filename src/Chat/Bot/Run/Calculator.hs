{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Run.Calculator where

import           Chat.Bot.Calculator
import           Chat.Data
import           Data.List (stripPrefix)


calculatorBot :: String -> Maybe String
calculatorBot message =
  case stripPrefix "/calculator " message of
    Nothing -> Nothing
    Just string -> Just (calculateParse string)
