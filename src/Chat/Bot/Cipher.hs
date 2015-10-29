module Chat.Bot.Cipher where

import           Chat.Data
import           Data.List


-- LEVEL: Medium

-- Goal is to implement a bot that takes a number and a string
-- and returns a string with the characters ciphered by RotN 
-- where N is the integer supplied.

-- Examples
-- > cipher (cipherTable 1) 'a'
-- 'b'
-- > cipher (cipherTable (-1)) 'C' 
-- 'B'
-- > map (cipher (cipherTable 39)) "Foo! Bar, Bazz.."
-- "Sbb! One, Onmm.."
cipher :: Int -> String -> String
cipher n text =
  error "cipher not implemented"


type Shift = Int
type Phrase = String

cipherLookup ::  [(Char, Char)] -> Char -> Char
cipherLookup list c =
  maybe c id $ lookup c list

cipherTable :: Int -> [(Char, Char)]
cipherTable n =
  zip alphLower shiftLow ++ zip alphUpper shiftUpper where
    shiftLow = drop n alphLower ++ take n alphLower
    shiftUpper = drop n alphUpper ++ take n alphUpper

alphLower = ['a'..'z']
alphUpper = ['A'..'Z']
