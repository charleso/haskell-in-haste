module Example where

import Data.Char

-- Functions

add :: Int -> Int -> Int
add a b = a + b

-- Data

data Fruit = Apple | Banana | Tomato
  deriving (Eq, Show)

-- Data > Pattern Matching

fruitToString :: Fruit -> String
fruitToString fruit = case fruit of
  Apple -> "apple"
  Banana -> "banana"
  Tomato -> "tomato"

-- Data > Data Types++

data MaybeFruit = JustFruit Fruit | NothingFruit
  deriving (Eq, Show)

fruitFromString :: String -> MaybeFruit
fruitFromString string = case string of
  "apple" -> JustFruit Apple
  "banana" -> JustFruit Banana
  "tomato" -> JustFruit Tomato
  _ -> NothingFruit

maybeFruit :: MaybeFruit -> Fruit -> Fruit
maybeFruit mf other = case mf of
  JustFruit fruit -> fruit
  NothingFruit -> other

-- Lists

plusOneList :: [Int] -> [Int]
plusOneList list =
  let plusOne x = x + 1
  in map plusOne list

toUpperList :: [Char] -> [Char]
toUpperList list =
  map toUpper list

-- Data > Parametric

fruitFromString2 :: String -> Maybe Fruit
fruitFromString2 string = case string of
  "apple" -> Just Apple
  "banana" -> Just Banana
  "tomato" -> Just Tomato
  _ -> Nothing
