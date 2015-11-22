module Chat.Bot.Answer.TicTacToe where

import           Chat.Bot.Misc.TicTacToe
import           Data.List


moveAnswer :: Game -> Position -> Result
moveAnswer (Game board player) pos =
  if not (canMoveAnswer board pos)
  then InProgress (Game board player)
  else
    let newBoard = (pos, player) : board
    in if hasWonAnswer newBoard player
       then Won player newBoard
         else if length board == 15
           then Draw newBoard
           else InProgress (Game newBoard (nextPlayer player))

canMoveAnswer :: Board -> Position -> Bool
canMoveAnswer board pos =
  let inPosition (pos', _) = pos == pos'
  in not (any inPosition board)

hasWonAnswer :: Board -> Player -> Bool
hasWonAnswer board player =
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
      isPlayer move = player == snd move
      positions = map fst (filter isPlayer board)
      addsUp counts = 15 == sum (take 3 counts)
  in any addsUp (permutations (fmap toMagic positions))
