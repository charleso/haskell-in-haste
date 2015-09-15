import           Chat.Bot.Calculator
import           Chat.Bot.Guess
import           Chat.Bot.MarcoPolo
import           Chat.Data
import           Chat.Web


main :: IO ()
main = do
  bots <- sequence [
      return marcoPoloBot
    , guessBot
    , return calculatorBot
    ]
  startChat bots
