module Chat.Bot.TicTacToe where

import           Chat.Bot.Answer.TicTacToe
import           Chat.Bot.Misc.TicTacToe
import           Chat.Data
import           Data.List

-- |
-- LEVEL: Hard
--
-- USAGE: /ttt [POSITION]
--
-- EXAMPLE:
--  > /ttt NW
--  O........
--  > /ttt E
--  O....X...
--
-- This bot is used to play a game of tic-tac-toe.
-- This has been inspired by the following challenge.
-- It's worth trying to implement this in your language of choice. :)
--
-- http://blog.tmorris.net/posts/understanding-practical-api-design-static-typing-and-functional-programming/

-- |
-- Determine if the Position is already taken.
--
-- >>> canMove [(NW, O), (NE, X)] NW
-- False
-- >>> canMove [(NW, O), (NE, X)] E
-- True
--
-- HINTS:
--   any :: (a -> Bool) -> [a] -> Bool
--
canMove :: Board -> Position -> Bool
canMove b p =
  notImplemented "TicTacToe.canMove" (canMoveAnswer b p)

-- |
-- If you want to save yourself some time calculating this, the following is a useful trick.
--
-- http://mathworld.wolfram.com/MagicSquare.html
--
-- >>> hasWon [(NW, O), (N, X), (NE, O), (W, X), (E, O), (M, X), (S, O), (SE, X), (SW, O)] O
-- False
-- >>> hasWon [(NW, O), (E, X), (W, O), (S, X), (SW, O)] X
-- False
-- >>> hasWon [(NW, O), (E, X), (W, O), (S, X), (SW, O)] O
-- True
--
-- HINTS:
--   permutations :: [a] -> [[a]]
--   any :: (a -> Bool) -> [a] -> Bool
--   map :: (a -> b) -> [a] -> [b]
--   filter :: (a -> Bool) -> [a] -> [a]
--
hasWon :: Board -> Player -> Bool
hasWon b p =
  notImplemented "TicTacToe.hasWon" (hasWonAnswer b p)

-- |
-- >>> start ~> NW
-- O........
-- >>> start ~> NW ~> E ~> W ~> S ~> SW
-- O..O.XOX.
-- >>> start ~> NW ~> N ~> NE ~> W ~> E ~> M ~> S ~> SE ~> SW
-- OXOXXOOOX
-- >>> start ~> NW ~> E ~> W ~> S ~> SW ~> SW
-- O..O.XOX.
-- >>> start ~> NW ~> NW
-- O........
--
-- HINTS:
--   length :: [a] -> Int
--   This will need to call `canMove` and `hasWon`
--
move :: Game -> Position -> Result
move g pos =
  notImplemented "TicTacToe.move" (moveAnswer g pos)

-- See Misc/TicTacToe.hs
{-
data Position = NW | N | NE | W | M | E | SW | S | SE
  deriving (Bounded, Enum, Eq, Ord, Show)
data Player = O | X
  deriving Eq

type Move = (Position, Player)
type Board = [(Position, Player)]
data Game = Game Board Player
  deriving (Eq, Show)
data Result = InProgress Game | Draw Board | Won Player Board
  deriving Eq
-}


-- | A silly DSL function for making the examples easy to follow/run
(~>) :: Result -> Position -> Result
(~>) r p = case r of
  InProgress g -> move g p
  r -> r
