{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Calculator where

import           Chat.Bot.Answer.Calculator
import           Chat.Bot.Misc.Calculator
import           Chat.Data

{-
  LEVEL: Easy

  USAGE: /calculate a operation b

  Simple calculator to add, minus or multiply two numbers

  EXAMPLE:
    > /calculate 2 + 5
    7
    > /calculate 10 - 2
    8
    > /calculate 3 * 5
    15
    > /calculate 8 / 3
    Invalid calculation
-}

-- |
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



-- |
--
-- >>> operationParser "2 + 5"
-- JustCalculation Plus 2 5
-- >>> operationParser "5 - 2"
-- JustCalculation Minus 5 2
-- >>> operationParser "2 * 5"
-- JustCalculation Multiply 2 5
-- >>> operationParser "2 / 5"
-- NothingCalculation
--
-- HINT:
--   words :: String -> [String]
--   read :: String -> Int
--   Try pattern matching on lists. :)
--
operationParser :: String -> MaybeCalculation
operationParser input =
  notImplemented "Calculator.operationParser" operationParserAnswer input


-- |
--
-- This is a main method you invoke to calculate the expression
--
-- Here you will parse your operation and if it is successfull you will make a calculation
--
-- >>> calculateParse "2 + 5"
-- "7"
-- >>> calculateParse "5 - 2"
-- "3"
-- >>> calculateParse "2 * 5"
-- "10"
-- >>> calculateParse "2 / 5"
-- "Invalid calculation"
--
-- HINT:
--   show :: Int -> String
--
calculateParse :: String -> String
calculateParse input =
  notImplemented "Calculator.calculateParse" (calculateParseAnswer input)


-- See Misc/Calculator.hs
{-
data Operation = Plus | Minus | Multiply

data MaybeCalculation = JustCalculation Operation Int Int | NothingCalculation
-}
