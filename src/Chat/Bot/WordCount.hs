module Chat.Bot.WordCount where

import           Chat.Data


-- LEVEL: Easy
--
-- NOTE: There is an implementation of 'words' already defined in Haskell.
-- If you can find it, feel free to start with that version before implementing it yourself below.
--
-- >>> wordCount ""
-- 0
-- >>> wordCount "hello world"
-- 2
-- >>> wordCount "the quick brown fox jumps over the lazy dog"
-- 9
wordCount :: String -> Int
wordCount s =
  error "wordCount not implemented"


-- LEVEL: Medium
--
-- Some form of recursion is required.
-- Functions that might come in handy:
--
--     dropWhile :: (a -> Bool) -> [a] -> [a]
--     break :: (a -> Bool) -> [a] -> ([a], [a])
--
-- >>> wordss ""
-- []
-- >>> wordss "hello world"
-- ["hello", "world"]
-- >>> wordss "the quick brown fox jumps over the lazy dog"
-- ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
wordss :: String -> [String]
wordss s =
  error "words not implemented"
