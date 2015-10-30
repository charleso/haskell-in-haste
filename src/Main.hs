import           Chat.Bot.Answer.Guess
import           Chat.Bot.Answer.Cipher
import           Chat.Bot.Answer.Calculator
import           Chat.Bot.Answer.TicTacToe
import           Chat.Data
import           Chat.Web


main :: IO ()
main = do
  bots <- sequence [
      guessBot
    , return calculatorBot
    , return cipherBot
    , ticTacToeBot
    ]
  startChat bots
