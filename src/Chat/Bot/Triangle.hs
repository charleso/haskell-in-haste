module Chat.Bot.Triangle where

import Chat.Data
import Data.List

-- Given three sides of a triangle, identify what type of triangle:
-- 
--     Isosceles (2 equal sides)
--     Equilateral (3 equal sides)
--     Right-angled (a^2 + b^2 = b^2)
--     Scalene (all sides different)
--     Nothing special
--     Impossible/invalid (to be valid: sum of the lengths of any two sides of a triangle must be greater than the length of the third side)

equilateral :: Double -> Double -> Double -> Bool
equilateral a b c = a == b && b == c

isosceles :: Double -> Double -> Double -> Bool
isosceles a b c = a == b || b == c || a == c

rightAngle :: Double -> Double -> Double -> Bool
rightAngle a b c = (a^2 + b^2) == c^2 || (a^2 + c^2) == b^2 ||
     (b^2 + c^2) == a^2

scalene :: Double -> Double -> Double -> Bool
scalene a b c = a /= b && b /= c && a /= c

impossible :: Double -> Double -> Double -> Bool
impossible a b c = (a + b) < c && (a + c) < b && (b + c) < a

-- Worth teaching guards?
implementMe :: Double -> Double -> Double -> String
implementMe a b c 
    | equilateral a b c == True = "This triangle is equilateral"
    | (rightAngle a b c == True) && (isosceles a b c == True) = "This is a right isosceles triangle" -- never actually validates because of rounding errors
    | isosceles a b c == True = "This triangle is isosceles"
    | rightAngle a b c == True = "This triangle is alright!"
    | scalene a b c == True = "This is a scalene triangle"
    | impossible a b c == True = "This is not a triangle"
    | otherwise = "This triangle is not very special"
    
----- most of this can be ignored. If this example is to teach map
----- it may be worth having them poke at the guts or maybe restructuring
triangleBot :: Bot
triangleBot m = maybe (return Nothing) triangleTest $ stripPrefix "/triangle " m
    where triangleTest m' =  let (a:b:c:[]) = map (readIn) $ words m'
                                 readIn x = read x :: Double
                             in return $ Just $ implementMe a b c


