module Chat.Bot.TicTacToe where

import           Chat.Bot.Answer.TicTacToe
import           Chat.Bot.Misc.TicTacToe
import           Chat.Data
import           Data.List

-- | This bot is used to play a game of tic-tac-toe.
--
-- This has been inspired by the following challenge.
-- It's worth trying to implement this in your language of choice. :)
--
-- http://blog.tmorris.net/posts/understanding-practical-api-design-static-typing-and-functional-programming/
--
-- LEVEL: Hard
--
-- >>> start ~> NW
-- O
-- >>> start ~> NW ~> E ~> W ~> S ~> SW
-- O  O XOX
-- >>> start ~> NW ~> N ~> NE ~> W ~> E ~> M ~> S ~> SE ~> SW
-- OXOXXOOOX
-- >>> start ~> NW ~> E ~> W ~> S ~> SW ~> SW
-- O  O XOX
-- >>> start ~> NW ~> NW
-- O
--
-- Some useful functions:
--
-- length :: [a] -> Int
move :: Game -> Position -> Result
move g pos =
  notImplemented "TicTacToe.move" (moveAnswer g pos)

-- Determine if the Position is already taken.
--
-- Some useful functions:
--
-- any :: (a -> Bool) -> [a] -> Bool
canMove :: Board -> Position -> Bool
canMove b p =
  notImplemented "TicTacToe.canMove" (canMoveAnswer b p)

-- If you want to save yourself some time calculating this, the following is a useful trick.
--
-- http://mathworld.wolfram.com/MagicSquare.html
--
-- Some useful functions:
--
-- permutations :: [a] -> [[a]]
-- any :: (a -> Bool) -> [a] -> Bool
hasWon :: Board -> Player -> Bool
hasWon b p =
  notImplemented "TicTacToe.hasWon" (hasWonAnswer b p)


-- See Misc/TicTacToe.hs
{-
data Position = NW | N | NE | W | M | E | SW | S | SE deriving (Bounded, Enum, Eq, Ord, Show)
data Player = O | X deriving Eq

type Move = (Position, Player)
type Board = [(Position, Player)]
newtype EndBoard = EndBoard Board deriving (Eq, Show)
data Game = Game Board Player deriving (Eq, Show)
data Result = InProgress Game | Draw EndBoard | Won Player EndBoard deriving Eq
-}


-- | A silly DSL function for making the examples easy to follow/run
(~>) :: Result -> Position -> Result
(~>) r p = case r of
  InProgress g -> move g p
  r -> r
