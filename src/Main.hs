{-# LANGUAGE OverloadedStrings #-}
import           Web.Scotty

main :: IO ()
main = scotty 8080 $ do

  get "/" $ do
    html $ "<html><body>Hello world"
