module Chat where

import           Chat.Bot.Ping
import           Chat.Bot.Run.Guess
import           Chat.Bot.Run.Cipher
import           Chat.Bot.Run.Calculator
import           Chat.Bot.Run.TicTacToe
import           Chat.Bot.Run.Vote
import           Chat.Bot.Run.WordCount
import           Chat.Data
import           Chat.Web


start :: IO ()
start = do
  bots <- sequence [
      guessBot
    , return (toBot calculatorBot)
    , return cipherBot
    , return wordCountBot
    , ticTacToeBot
    , return (toBot pingBot)
    , voteBot
    ]
  startChat bots
