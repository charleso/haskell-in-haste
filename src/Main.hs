import           Chat.Bot.Triangle
import           Chat.Bot.Cipher
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
    , return cipherBot
    , return triangleBot
    ]
  startChat bots
