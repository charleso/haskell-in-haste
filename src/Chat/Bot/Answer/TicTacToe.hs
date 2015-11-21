module Chat.Bot.Answer.TicTacToe where

import           Chat.Bot.Misc.TicTacToe
import           Data.List


moveAnswer :: Game -> Position -> Result
moveAnswer (Game b pl) pos =
  if not (canMoveAnswer b pos)
  then InProgress (Game b pl)
  else
    let b' = (pos, pl) : b
    in if hasWonAnswer b' pl
       then Won pl b'
         else if length b == 15
           then Draw b'
           else InProgress (Game b' (nextPlayer pl))

canMoveAnswer :: Board -> Position -> Bool
canMoveAnswer b p =
  not $ any ((==) p . fst) b

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
