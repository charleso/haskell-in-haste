{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Chat.Bot.Answer.Calculator where

import           Chat.Bot.Calculator
import           Chat.Data
import           Control.Concurrent
import           Control.Monad
import           Data.Attoparsec.Text
import qualified Data.Text as T
import           Data.List

calculateAnswer :: Operation -> Int -> Int -> Int
calculateAnswer op a b = case op of
  Plus -> a + b
  Minus -> a - b
  Multiply -> a * b

operationParserAnswer :: Parser (Operation, Int, Int)
operationParserAnswer = do
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

calculateParseAnswer :: T.Text -> Either String Int
calculateParseAnswer m =
  (\(o, a, b) -> calculateAnswer o a b) <$> parseOnly operationParserAnswer m

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
