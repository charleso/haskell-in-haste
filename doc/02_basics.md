# Basics

## Hello World

```haskell
putStrLn "Hello world"
```

## Calling a function

```haskell
> add 1 2
3

> add 1 (add 2 3)
6

> add (add 1 2) 3
6

> add "a" 2
<interactive>:8:1:
    Couldn't match expected type ‘Int’ with actual type ‘[Char]’
```

## Writing a function

```haskell
add a b = a + b
```

```js
function add(a, b) {
	return a + b;
}
```

## Type Inference

```haskell
add a b = a + b
```

```
> :t add
add :: Num a => a -> a -> a
```

## Reading a function type signature

```haskell
add :: Int -> Int -> Int
add a b = a + b
```














## Lambda

```javascript
function add(a, b) {
  return a + b;
}

val add = function(a, b) {
  return a + b;
}
```

```haskell
add :: Int -> Int -> Int
add a b = a + b

add :: Int -> Int -> Int
add = \a b -> a + b
```
















## Lists

```haskell
list :: [Int]
list = [1, 2, 3, 4]
```

## Functions

```haskell
> map (\x -> x + 1) [1, 2, 3, 4]
[2, 3, 4, 5]

> take 2 [1, 2, 3, 4]
[1, 2]
```

## Strings are just Lists

```haskell
helloWorld :: String
helloWorld = "hello world"
```

```haskell
> :i String
type String = [Char]
```

```haskell
helloWorld :: [Char]
helloWorld = "hello world"
```

```haskell
helloWorld :: [Char]
helloWorld = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
```

```haskell
import Data.Char

> map (\x -> toUpper x) "hello world"
"HELLO WORLD"

> take 2 "hello world"
"he"
```






## Data types

- Similar to an "enum"
- _Must_ start with Upper Case

```haskell
data Fruit = Apple | Banana | Tomato
```

## Pattern Matching

```haskell
fruitRender :: Fruit -> String
fruitRender Apple = "apple"
fruitRender Banana = "banana"
fruitRender Tomato = "tomato"
```

```haskell
fruitRender :: Fruit -> String
fruitRender fruit = case fruit of
  Apple -> "apple"
  Banana -> "banana"
  Tomato -> "tomato"
```

## Exhaustive Pattern Matching

```haskell
fruitRender :: Fruit -> String
fruitRender fruit = case fruit of
  Banana -> "banana"
  Tomato -> "tomato"
```

```
Fruit.hs:5:1: Warning:
    Pattern match(es) are non-exhaustive
    In an equation for ‘fruitRender’: Patterns not matched: Apple
```








## Deriving

```haskell
data Fruit = Apple | Banana | Tomato

> Apple
<interactive>:9:1:
    No instance for (Show Fruit) arising from a use of ‘print’
```

```haskell
data Fruit = Apple | Banana | Tomato
  deriving Show

> Apple
Apple
```

- Special Haskell
- Think of it like `toString()` in many languages
  - Except it's not added to data types by default







## Booleans

- Just a data type

```haskell
data Bool = True | False
```

```haskell
not :: Bool -> Bool
not True = False
not False = True
```

- Special syntax

```haskell
if ... then ... else ...
```

```haskell
not :: Bool -> Bool
not b = if b then False else True
```










## Data types ++

- Data constructors can contain values

```haskell
data Eat = Yum Fruit | Yuck Fruit String
```

## _Very_ loose comparison

```java
interface Eat { }

class Yum extends Eat {

  public Yum(Fruit f) { .. }
}

class Yuck extends Eat {

  public Yuck(Fruit f, String m) { .. }
}
```

## Constructors are just functions

```haskell
> :t Yum
Fruit -> Eat

> :t Yuck
Fruit -> String -> Eat
```

## Constructors are just functions

```haskell
> :t Yum Apple
Eat

> :t Yuck Tomato "Not a fruit"
Eat
```

```java
new Yum(Apple)

new Yuck(Tomato, "Not a fruit")
```

## Pattern Matching

```haskell
eat :: Fruit -> Eat
eat fruit = case fruit of
  Apple -> Yum Apple
  Banana -> Yum Banana
  Tomato -> Yuck Tomato "It's not a real fruit"

eatRender :: Eat -> String
eatRender e = case e of
  Yum f ->
    "I ate " ++ fruitRender f
  Yuck f m ->
    "I refuse to eat " ++ fruitRender f ++ " because " ++ m
```









## Lists (again)

- Lists are actually linked-lists

```haskell
empty :: [Int]
empty = []

one :: [Int]
one = 1 : []

list :: [Int]
list = 1 : 2 : 3 : 4 : []
```

- Pattern matching

```haskell
startsWith :: Int -> [Int] -> Bool
startsWith i [] = False
startsWith i (h : v) = i == h
```











## Everything is immutable (by default)

```haskell
data Count = Count Int deriving Show

plusOne :: Count -> Count
plusOne (Count c) = Count (c + 1)

> plusOne (Count 1)
Count 2
```

- Create a _new_ `Count`
- _No_ (easy) way to mutate
  - And needs something "special"
  - Let's not talk about it...








## Loops?

- Recursion

```haskell
contains :: Int -> [Int] -> Bool
contains v [] =
  False
contains v (h : t) =
  if v == h
    then True
    else contains v t
```
















## Higher Order Function

- Functions that take functions as inputs

```haskell
add3 :: Int -> Int
add3 x = x + 3

myMap :: (Int -> Int) -> [Int] -> [Int]
myMap _ [] = []
myMap f (x: xt) = f x : myMap f xt

> myMap add3 [1..5]
[4,5,6,7,8]
```












## "Real world"

- Special `do` syntax
  - Indentation aware (like Python)
  - (Curly brackets and semicolon are available, too.)

```haskell
main :: IO ()
main = do
  putStrLn "Input value"
  v <- input
  putStrLn ("You entered" ++ show v)
```
