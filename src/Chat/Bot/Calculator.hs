{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Calculator where

import           Chat.Data
import           Data.Attoparsec.Text
import qualified Data.Text as T


-- This bot is based directly on a previous workshop (in Scala), and as such the approach should be very similar.
--
--
-- https://github.com/Svetixbot/calculator

-- LEVEL: Easy
--
-- This method makes the calculation itself
-- Based on operation return a result of calculation or an error if operaiton is not supported
--
-- Hint: try to use pattern matching
calculate :: Operation -> Int -> Int -> Int
calculate op a b =
  error "calculate not implemented"



-- LEVEL: Hard
--
-- This methods should return a parser of your operation
--
-- Hint: try to use `do` comprehension
-- Advanced: try to translate this comprehension into a ap/map structure
-- https://hackage.haskell.org/package/attoparsec-0.13.0.1/docs/Data-Attoparsec-Text.html
operationParser :: Parser (Operation, Int, Int)
operationParser =
  error "operationParser not implemented"


-- LEVEL: Medium
--
-- This is a main method you invoke to calculate the expression
--
-- Here you will parse your operation and if it is successfull you will make a calculation
--
-- Hint: ask someone what tuple is and how to access values from it.
calculateParse :: T.Text -> Either String Int
calculateParse m =
  error "calculateParse not implemented"


data Operation =
    Plus
  | Minus
  | Multiply
  deriving (Eq, Show)
