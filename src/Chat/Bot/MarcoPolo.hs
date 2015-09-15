module Chat.Bot.MarcoPolo where

import           Chat.Data


marcoPoloBot :: Bot
marcoPoloBot "marco" = message "polo"
marcoPoloBot _ = noMessage
