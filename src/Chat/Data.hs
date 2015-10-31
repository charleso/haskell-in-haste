module Chat.Data (
    User
  , Room (..)
  , Message (..)
  , Bot
  , message
  , noMessage
  , notImplemented
  ) where

import           Control.Concurrent
import           Data.Time
import           System.Environment (lookupEnv)
import           System.IO.Unsafe (unsafePerformIO)


type User = String

data Room =
  Room {
    roomUsers :: [User]
  , roomMessages :: [Message]
  } deriving (Eq, Show)

data Message =
  Message {
    messageUser :: User
  , messageBody :: String
  , messageTime :: UTCTime
  } deriving (Eq, Show)

-- | A bot is just a function that might return a new message
type Bot = String -> IO (Maybe String)


message :: String -> IO (Maybe String)
message m = return (Just m)

noMessage :: IO (Maybe String)
noMessage = return Nothing


notImplemented :: String -> a -> a
notImplemented name answer =
  -- May god have mercy on my soul.
  -- There are 1000 better ways of doing this, but this will make it _look_ nice for people just starting out
  unsafePerformIO $ do
    e <- lookupEnv "ANSWERS_ENABLED"
    case e of
      Just "true" ->
        return answer
      _ ->
        error $ name ++ " not implemented"
