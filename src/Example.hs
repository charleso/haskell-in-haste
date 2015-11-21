module Example where

import Data.Char

add :: Int -> Int -> Int
add a b = a + b

toUpperList :: [Char] -> [Char]
toUpperList list =
  map toUpper list
