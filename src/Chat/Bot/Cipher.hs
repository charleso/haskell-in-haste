module Chat.Bot.Cipher where

import Chat.Data
import Data.List


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

cipher ::  [(Char, Char)] -> Char ->Char
cipher list c = maybe c id $ lookup c list

cipherTable :: Int -> [(Char, Char)]
cipherTable n = zip alphLower shiftLow ++ zip alphUpper shiftUpper where
    shiftLow = drop n alphLower ++ take n alphLower
    shiftUpper = drop n alphUpper ++ take n alphUpper

implementMe :: Int -> String -> String
implementMe n text = map (cipher $ cipherTable n') text
    where n' = mod n 26

alphLower = ['a'..'z']
alphUpper = ['A'..'Z']

----- most of this can be ignored. If this example is to teach map
----- it may be worth having them poke at the guts or maybe restructuring
cipherBot :: Bot
cipherBot m = maybe (return Nothing) encipher $ stripPrefix "/cipher " m
    where encipher m' =  let (nS,rest) = break (==' ') m'
                             n = (read nS) :: Int
                         in return $ Just $ implementMe n rest


