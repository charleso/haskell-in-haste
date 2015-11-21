module Chat where

import           Chat.Bot.Ping
import           Chat.Bot.Run.Guess
import           Chat.Bot.Run.Cipher
import           Chat.Bot.Run.Calculator
import           Chat.Bot.Run.Hangman
import           Chat.Bot.Run.TicTacToe
import           Chat.Bot.Run.Vote
import           Chat.Data
import           Chat.Web


start :: IO ()
start = do
  bots <- sequence [
      guessBot
    , return (toBot calculatorBot)
    , return cipherBot
    , ticTacToeBot
    , return (toBot pingBot)
    , voteBot
    , hangmanBot
    ]
  startChat bots
