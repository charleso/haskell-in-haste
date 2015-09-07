# Haskell in Haste

A (very) short workshop designed to introduce Haskell quickly but practically.

## Getting Started

This workshop is 

1. [Download Stack](https://github.com/commercialhaskell/stack/wiki/Downloads) for your operating system
2. Clone this repository

         git clone https://github.com/charleso/haskell-in-haste.git

3. Run `stack setup` in the root of the directory
4. Run `stack build` in the root of the directory

## Running

1. Run `stack ghci`
2. Type `main` and enter
3. Type ":r" to reload

## Haskell Overview

TODO This should probably live in a separate file

### Hello World

```haskell
main = putStrLn "Hello world"
```

### Reading a type signature

```haskell
count :: Int -> Int -> Int
count a b = a + b
```

```
> count 1 2
3

> count "a" 2
<interactive>:8:1:
    Couldn't match expected type ‘Int’ with actual type ‘[Char]’
```

- Last type is the return type

### Type Inference

```haskell
count a b = a + b
```

### Hoogle

- https://www.haskell.org/hoogle/
