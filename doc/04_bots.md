# Bots

![screenshot](../static/images/screenshot.png)

## Layout

```
src/
  Chat/
    Bot/
      Answer/
      Misc/
      Run/
      ...
      Guess.hs

  Chat.hs
```

## Bot

```haskell
type Bot = String -> IO (Maybe String)
```

## Bot pretend

```haskell
type Bot = String -> Maybe String
```
