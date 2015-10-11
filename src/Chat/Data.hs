module Chat.Data (
    User
  , Room (..)
  , Message (..)
  , Bot
  , message
  , noMessage
  ) where

import           Control.Concurrent
import           Data.Time


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
