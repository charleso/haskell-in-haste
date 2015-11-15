module Chat.Bot.Misc.Calculator where


data Operation =
    Plus
  | Minus
  | Multiply
  deriving (Eq, Show)

data MaybeCalculation =
    JustCalculation Operation Int Int
  | NothingCalculation
  deriving (Eq, Show)
