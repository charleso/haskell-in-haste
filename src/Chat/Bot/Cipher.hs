module Chat.Bot.Cipher where

import Chat.Data
import Data.List


-- LEVEL: Easy
--

type Shift = Int
type Phrase = String

alphLower = ['a'..'z']
alphUpper = ['A'..'Z']

cipherTable :: Int -> [(Char, Char)]
cipherTable n = zip alphLower shiftLow ++ zip alphUpper shiftUpper where
    shiftLow = drop n alphLower ++ take n alphLower
    shiftUpper = drop n alphUpper ++ take n alphUpper

cipherBot :: Bot
cipherBot m = maybe (return Nothing) encipher $ stripPrefix "/cipher " m
    where encipher m' =  let (nS,rest) = break (==' ') m'
                             n = mod (read nS) 26 :: Int
                             list = cipherTable n
                         in return $ Just $ map (flip cipher list) rest

cipher :: Char -> [(Char, Char)] -> Char
cipher c list = maybe c id $ lookup c list
