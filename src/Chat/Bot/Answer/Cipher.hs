module Chat.Bot.Answer.Cipher where

import           Chat.Data
import           Chat.Bot.Cipher
import           Data.List


cipherAnswer :: Int -> String -> String
cipherAnswer n text =
  map (cipherLookup $ cipherTable n') text
    where n' = mod n 26

----- most of this can be ignored. If this example is to teach map
----- it may be worth having them poke at the guts or maybe restructuring
cipherBot :: Bot
cipherBot m =
  maybe (return Nothing) encipher $ stripPrefix "/cipher " m
    where encipher m' =  let (nS,rest) = break (==' ') m'
                             n = (read nS) :: Int
                         in return $ Just $ cipher n rest
