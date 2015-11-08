# Tools

## Hoogle

- Search the libraries by type
- https://www.haskell.org/hoogle/

## Type hole

```haskell
foo :: Maybe Int -> Int
foo m =
  _ m
```

```
/Foo.hs:25:9:
Found hole ‘_’ with type: Maybe Int -> Int
Relevant bindings include
  m :: Maybe Int
    (bound at /Foo.hs:24:5)
  foo :: Maybe Int -> Int
    (bound at /Foo.hs:24:1)
In the expression: _
In the expression: _ m
In an equation for ‘foo’: foo m = _ m
```

```haskell
foo :: Maybe Int -> Int
foo m =
  maybe _a _b m
```

```
/Foo.hs:25:9:
Found hole ‘_a’ with type: Int
Relevant bindings include
  m :: Maybe Int
    (bound at /Foo.hs:24:5)
  foo :: Maybe Int -> Int
    (bound at /Foo.hs:24:1)
In the first argument of ‘maybe’, namely ‘_a’
In the expression: maybe _a _b m
In an equation for ‘foo’: foo m = maybe _a _b m

/Foo.hs:25:12:
Found hole ‘_b’ with type: Int -> Int
Relevant bindings include
  m :: Maybe Int
    (bound at /Foo.hs:24:5)
  foo :: Maybe Int -> Int
    (bound at /Foo.hs:24:1)
In the second argument of ‘maybe’, namely ‘_b’
In the expression: maybe _a _b m
In an equation for ‘foo’: foo m = maybe _a _b m
```

```haskell
foo :: Maybe Int -> Int
foo m =
  maybe 0 _b m
```

```
/Foo.hs:25:12:
Found hole ‘_b’ with type: Int -> Int
Relevant bindings include
  m :: Maybe Int
    (bound at /Foo.hs:24:5)
  foo :: Maybe Int -> Int
    (bound at /Foo.hs:24:1)
In the second argument of ‘maybe’, namely ‘_b’
In the expression: maybe _a _b m
In an equation for ‘foo’: foo m = maybe _a _b m
```
