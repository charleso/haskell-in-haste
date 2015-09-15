{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Calculator where

import           Chat.Data
import           Control.Concurrent
import           Control.Monad
import           Data.Attoparsec.Text
import qualified Data.Text as T
import           Data.List
import           System.Random


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
calculate op a b = case op of
  Plus -> a + b
  Minus -> a - b
  Multiply -> a * b


-- LEVEL: Hard
--
-- This methods should return a parser of your operation
--
-- Hint: try to use `do` comprehension
-- Advanced: try to translate this comprehension into a ap/map structure
-- https://hackage.haskell.org/package/attoparsec-0.13.0.1/docs/Data-Attoparsec-Text.html
operationParser :: Parser (Operation, Int, Int)
operationParser = do
  a <- decimal
  _ <- string " "
  op <- anyChar >>= \case
    '+' -> return Plus
    '-' -> return Minus
    '*' -> return Multiply
    c   -> fail $ "Unknown operator " ++ [c]
  _ <- string " "
  b <- decimal
  return (op, a, b)


-- LEVEL: Medium
--
-- This is a main method you invoke to calculate the expression
--
-- Here you will parse your operation and if it is successfull you will make a calculation
--
-- Hint: ask someone what tuple is and how to access values from it.
calculateParse :: T.Text -> Either String Int
calculateParse m =
  (\(o, a, b) -> calculate o a b) <$> parseOnly operationParser m

data Operation =
    Plus
  | Minus
  | Multiply
  deriving (Eq, Show)

-------------------------------------------------------------------
------------------------- IGNORE BELOW HERE -----------------------
-------------------------------------------------------------------

calculatorBot :: Bot
calculatorBot m =
  case stripPrefix "/calculator " m of
    Nothing -> noMessage
    Just m' -> message
      . either id show
      $ calculateParse (T.pack m')

