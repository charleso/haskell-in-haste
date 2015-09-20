module Chat.Bot.Cipher where

import Chat.Data
import Data.List


-- LEVEL: Easy?

-- Goal is to implement a bot that takes a number and a string
-- and returns a string with the characters ciphered by RotN 
-- where N is the integer supplied.

-- There are a lot of ways to do this, pitfalls / PITA issues
-- if participants take the wrong approach.
-- key ones I identify:
-- negative integers (handled by mod in my example bot)
-- integers greater than 26 (as above)
-- punctuation
-- capitalisation
-- inelgant rotation e.g. excessive type conversions/lookups

-- Below is an example I feel is elegant
type Shift = Int
type Phrase = String

cipher :: Char -> [(Char, Char)] -> Char
cipher c list = maybe c id $ lookup c list

cipherTable :: Int -> [(Char, Char)]
cipherTable n = zip alphLower shiftLow ++ zip alphUpper shiftUpper where
    shiftLow = drop n alphLower ++ take n alphLower
    shiftUpper = drop n alphUpper ++ take n alphUpper

alphLower = ['a'..'z']
alphUpper = ['A'..'Z']

----- most of this can be ignored. If this example is to teach map
----- it may be worth having them poke at the guts or maybe restructuring
cipherBot :: Bot
cipherBot m = maybe (return Nothing) encipher $ stripPrefix "/cipher " m
    where encipher m' =  let (nS,rest) = break (==' ') m'
                             n = mod (read nS) 26 :: Int
                             list = cipherTable n
                         in return $ Just $ map (flip cipher list) rest


