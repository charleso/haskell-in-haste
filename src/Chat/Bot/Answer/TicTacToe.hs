module Chat.Bot.Answer.TicTacToe where

import           Chat.Bot.TicTacToe
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
moveAnswer :: Game -> Position -> Result
moveAnswer (Game b pl) pos =
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
canMoveAnswer :: Board -> Position -> Bool
canMoveAnswer b p =
  not $ any ((==) p . fst) b

-- If you want to save yourself some time calculating this, the following is a useful trick.
--
-- http://mathworld.wolfram.com/MagicSquare.html
--
-- Some useful functions:
--
-- permutations :: [a] -> [[a]]
-- any :: (a -> Bool) -> [a] -> Bool
hasWonAnswer :: Board -> Player -> Bool
hasWonAnswer b p =
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


-------------------------------------------------------------------
------------------------- IGNORE BELOW HERE -----------------------
-------------------------------------------------------------------


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
