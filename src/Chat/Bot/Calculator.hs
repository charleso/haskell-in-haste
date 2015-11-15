{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Calculator where

import           Chat.Bot.Answer.Calculator
import           Chat.Bot.Misc.Calculator
import           Chat.Data


-- | LEVEL: Easy
--
-- This method makes the calculation itself
-- Based on operation return a result of calculation or an error if operaiton is not supported
--
-- >>> calculate Plus 2 5
-- 7
-- >>> calculate Minus 5 2
-- 3
-- >>> calculate Multiply 2 5
-- 10
--
calculate :: Operation -> Int -> Int -> Int
calculate op a b =
  notImplemented "Calculator.calculate" (calculateAnswer op a b)



-- LEVEL: Easy
--
-- >>> calculateParse "2 + 5"
-- JustCalculation 7
-- >>> calculateParse "5 - 2"
-- JustCalculation 3
-- >>> calculateParse "2 * 5"
-- JustCalculation 10
-- >>> calculateParse "2 / 5"
-- NothingCalculation
--
-- HINT:
--   words :: String -> [String]
--   read :: String -> Int
--
operationParser :: String -> MaybeCalculation
operationParser =
  notImplemented "Calculator.operationParser" operationParserAnswer


-- | LEVEL: Easy
--
-- This is a main method you invoke to calculate the expression
--
-- Here you will parse your operation and if it is successfull you will make a calculation
--
-- HINT:
--   show :: Int -> String
--
calculateParse :: String -> String
calculateParse m =
  notImplemented "Calculator.calculateParse" (calculateParseAnswer m)


-- See Misc/Calculator.hs
{-
data Operation = Plus | Minus | Multiply

data MaybeCalculation = JustCalculation Operation Int Int | NothingCalculation
-}
