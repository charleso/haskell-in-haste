module Chat.Bot.Cipher where

import           Chat.Bot.Answer.Cipher
import           Chat.Bot.Misc.Cipher
import           Chat.Data


-- | LEVEL: Medium
--
-- Goal is to implement a bot that takes a number and a string
-- and returns a string with the characters ciphered by RotN 
-- where N is the integer supplied.
--
-- >>> cipher 1 "a"
-- "b"
-- >>> cipher 25 "C"
-- "B"
-- >>> cipher 13 "Foo! Bar, Bazz.."
-- "Sbb! One, Onmm.."
--
-- Hint: Look in 'Misc/Cipher.hs' for some useful functions
cipher :: Int -> String -> String
cipher n text =
  notImplemented "Cipher.cipher" (cipherAnswer n text)
