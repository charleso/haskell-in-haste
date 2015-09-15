import           Chat.Bot.MarcoPolo
import           Chat.Data
import           Chat.Web


main :: IO ()
main = do
  bots <- sequence [
      return marcoPoloBot
    ]
  startChat bots
