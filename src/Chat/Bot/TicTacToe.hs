module Chat.Bot.TicTacToe where

import           Chat.Data
import           Control.Concurrent
import           Data.Char
import           Data.Ord
import           Data.List

-- This bot is used to play a game of tic-tac-toe.
--
-- This has been inspired by the following challenge.
-- It's worth trying to implement this in your language of choice. :)
--
-- http://blog.tmorris.net/posts/understanding-practical-api-design-static-typing-and-functional-programming/
--
-- LEVEL: Hard
--
-- >>> start >>> NW
-- "O        "
-- >>> start >>> NW >>> E >>> W >>> S >>> SW
-- "O  O XOX "
-- >>> start >>> NW >>> N >>> NE >>> W >>> E >>> M >>> S >>> SE >>> SW
-- "OXOXXOOOX"
-- >>> start >>> NW >>> E >>> W >>> S >>> SW >>> SW
-- "O  O XOX "
-- >>> start >>> NW >>> NW
-- "O  O XOX "


-- Some useful functions:
--
-- length :: [a] -> Int
move :: Game -> Position -> Result
move (Game b pl) pos =
  if not (canMove b pos)
  then InProgress (Game b pl)
  else
    let b' = (pos, pl) : b
    in if hasWon b' pl
       then Won pl $ EndBoard b'
         else if length b == 15
           then Draw $ EndBoard b'
           else InProgress (Game b' (nextPlayer pl))

-- Determine if the Position is already taken.
--
-- Some useful functions:
--
-- any :: (a -> Bool) -> [a] -> Bool
canMove :: Board -> Position -> Bool
canMove b p =
  not $ any ((==) p . fst) b

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
  let toMagic x = case x of
          NW -> 8
          N -> 1
          NE -> 6
          W -> 3
          M -> 5
          E -> 7
          SW -> 4
          S -> 9
          SE -> 2
      b' = b >>= \(pos, pl) -> if pl == p then [pos] else []
  in any ((==) 15 . sum . take 3) . permutations . fmap toMagic $ b'

printBoard :: Board -> String
printBoard b =
  intercalate "\n" . chunksOf 3 . flip fmap allPositions $ \pos' ->
    case find ((==) pos' . fst) b of
      Just (_, pl) -> head $ show pl
      Nothing -> ' '


data Position = NW | N | NE | W | M | E | SW | S | SE deriving (Bounded, Enum, Eq, Ord, Show)
data Player = O | X deriving Eq

type Move = (Position, Player)
type Board = [(Position, Player)]
newtype EndBoard = EndBoard Board deriving (Eq, Show)
data Game = Game Board Player deriving (Eq, Show)
data Result = InProgress Game | Draw EndBoard | Won Player EndBoard deriving Eq

-- Useful functions but don't worry about implementation --

instance Show Player where
  show O = "O"
  show X = "X"

instance Show Result where
  show r = printBoard $ case r of
    InProgress (Game b _) -> b
    Draw (EndBoard b) -> b
    Won _ (EndBoard b) -> b

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

-------------------------------------------------------------------
------------------------- IGNORE BELOW HERE -----------------------
-------------------------------------------------------------------

(>>>) :: Result -> Position -> Result
(>>>) r p = case r of
  InProgress g -> move g p
  r -> r


ticTacToeBot :: IO Bot
ticTacToeBot = do
  game <- newMVar []
  return $ \m -> case stripPrefix "/ttt " m of
    Nothing ->
      return Nothing
    Just g -> do
      b <- readMVar game
      let g' = readPosition g
      return $ maybe (Just "Invalid position") undefined g'
