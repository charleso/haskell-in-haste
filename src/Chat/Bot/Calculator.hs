{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Calculator where

import           Chat.Bot.Answer.Calculator
import           Chat.Bot.Misc.Calculator
import           Chat.Data
import           Data.Attoparsec.Text
import qualified Data.Text as T


-- | LEVEL: Easy
--
-- This bot is based directly on a previous workshop (in Scala), and as such the approach should be very similar.
--
-- https://github.com/Svetixbot/calculator
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
-- Hint: try to use pattern matching
calculate :: Operation -> Int -> Int -> Int
calculate op a b =
  notImplemented "Calculator.calculate" (calculateAnswer op a b)



-- LEVEL: Hard
--
-- This methods should return a parser of your operation
--
-- Hint: try to use `do` comprehension
-- Advanced: try to translate this comprehension into a ap/map structure
-- https://hackage.haskell.org/package/attoparsec-0.13.0.1/docs/Data-Attoparsec-Text.html
operationParser :: Parser (Operation, Int, Int)
operationParser =
  notImplemented "Calculator.operationParser" operationParserAnswer


-- | LEVEL: Medium
--
-- This is a main method you invoke to calculate the expression
--
-- Here you will parse your operation and if it is successfull you will make a calculation
--
-- >>> calculateParse "2 + 5"
-- Right 7
-- >>> calculateParse "5 - 2"
-- Right 3
-- >>> calculateParse "2 * 5"
-- Right 10
-- >>> calculateParse "2 / 5"
-- Left "Failed reading: Unknown operator /"
--
-- Hint: ask someone what tuple is and how to access values from it.
-- Hint: You might need to convert String to Text with 'T.pack'
calculateParse :: String -> Either String Int
calculateParse m =
  notImplemented "Calculator.calculateParse" (calculateParseAnswer m)


-- See Misc/Calculator.hs
{-
data Operation =
    Plus
  | Minus
  | Multiply
  deriving (Eq, Show)
-}
