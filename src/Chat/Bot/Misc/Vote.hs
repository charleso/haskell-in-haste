module Chat.Bot.Misc.Vote where

import           Chat.Data


data Vote = Vote String Int
  deriving (Show)

data Poll = Poll String [Vote]
  deriving (Show)
