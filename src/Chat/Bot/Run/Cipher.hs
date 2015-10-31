module Chat.Bot.Run.Cipher where

import           Chat.Data
import           Chat.Bot.Cipher
import           Data.List


cipherBot :: Bot
cipherBot m =
  maybe (return Nothing) encipher $ stripPrefix "/cipher " m
    where encipher m' =  let (nS,rest) = break (==' ') m'
                             n = (read nS) :: Int
                         in return $ Just $ cipher (mod n 26) rest
