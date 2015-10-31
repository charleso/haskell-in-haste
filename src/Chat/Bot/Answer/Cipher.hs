module Chat.Bot.Answer.Cipher where

import           Chat.Bot.Misc.Cipher


cipherAnswer :: Int -> String -> String
cipherAnswer n text =
  map (cipherLookup (cipherTable n)) text
