module Chat.Bot.Misc.TicTacToe where

import           Chat.Data
import           Control.Concurrent
import           Data.Char
import           Data.Ord
import           Data.List


data Position = NW | N | NE | W | M | E | SW | S | SE deriving (Bounded, Enum, Eq, Ord, Show)
data Player = O | X deriving Eq

type Move = (Position, Player)
type Board = [(Position, Player)]
data Game = Game Board Player deriving (Eq, Show)
data Result = InProgress Game | Draw Board | Won Player Board deriving Eq



-- Useful functions but don't worry about implementation --

instance Show Player where
  show O = "O"
  show X = "X"

instance Show Result where
  show r = printBoard $ case r of
    InProgress (Game b _) -> b
    Draw b -> b
    Won _ b -> b

nextPlayer :: Player -> Player
nextPlayer O = X
nextPlayer X = O

newGame :: Game
newGame =
  Game [] O

readPosition :: String -> Maybe Position
readPosition s = case map toUpper s of
  "NW" -> Just NW
  "N" -> Just N
  "NE" -> Just NE
  "W" -> Just W
  "M" -> Just M
  "E" -> Just E
  "SW" -> Just NW
  "S" -> Just NW
  "SE" -> Just NW
  _ -> Nothing

start :: Result
start =
  InProgress newGame

allPositions :: [Position]
allPositions =
  [minBound..maxBound]

chunksOf :: Int -> [e] -> [[e]]
chunksOf i ls = map (take i) ((splitter ls) (:) []) where
  splitter :: [e] -> ([e] -> a -> a) -> a -> a
  splitter [] _ n = n
  splitter l c n  = l `c` splitter (drop i l) c n

windowsOf :: Int -> [a] -> [[a]]
windowsOf m =
  foldr (zipWith (:)) (repeat []) . take m . tails

printBoard :: Board -> String
printBoard b =
  intercalate "" . chunksOf 3 . flip fmap allPositions $ \pos' ->
    case find ((==) pos' . fst) b of
      Just (_, pl) -> head $ show pl
      Nothing -> ' '
