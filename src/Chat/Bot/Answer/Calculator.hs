module Chat.Bot.Answer.Calculator where

import           Chat.Bot.Misc.Calculator
import           Data.List


calculateAnswer :: Operation -> Int -> Int -> Int
calculateAnswer op a b =
  case op of
    Plus -> a + b
    Minus -> a - b
    Multiply -> a * b

operationParserAnswer :: String -> MaybeCalculation
operationParserAnswer string =
  case words string of 
    [a, op, b] ->
      case op of
        "+" -> JustCalculation Plus (read a) (read b)
        "-" -> JustCalculation Minus (read a) (read b)
        "*" -> JustCalculation Multiply (read a) (read b)
        _ -> NothingCalculation
    _ -> NothingCalculation

calculateParseAnswer :: String -> String
calculateParseAnswer string =
  case operationParserAnswer string of
    JustCalculation op a b ->
      show (calculateAnswer op a b)
    NothingCalculation ->
      "Invalid calculation"
