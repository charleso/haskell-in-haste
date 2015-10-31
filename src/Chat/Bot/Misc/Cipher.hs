module Chat.Bot.Misc.Cipher where

import           Data.List


cipherLookup ::  [(Char, Char)] -> Char -> Char
cipherLookup list c =
  maybe c id (lookup c list)

cipherTable :: Int -> [(Char, Char)]
cipherTable n =
  zip alphLower shiftLow ++ zip alphUpper shiftUpper
    where
      shiftLow = drop n alphLower ++ take n alphLower
      shiftUpper = drop n alphUpper ++ take n alphUpper

alphLower :: [Char]
alphLower = ['a'..'z']

alphUpper :: [Char]
alphUpper = ['A'..'Z']
