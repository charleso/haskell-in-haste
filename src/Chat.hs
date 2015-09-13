{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Chat (
    startChat
  ) where

import           Control.Concurrent
import           Control.Monad.IO.Class
import           Data.Maybe
import           Data.Monoid
import           Data.Text
import           Data.Time
import           Text.Blaze
import           Text.Blaze.Html.Renderer.Text (renderHtml)
import           Text.Hamlet
import           Web.Scotty
import           Web.Scotty.Cookie


type User = String

data Room =
  Room {
    roomUsers :: [User]
  , roomMessages :: [Message]
  } deriving (Eq, Show)

data Message =
  Message {
    messageUser :: User
  , messageBody :: String
  , messageTime :: UTCTime
  } deriving (Eq, Show)

type Messages = MVar [Message]

type Bot = String -> Maybe String


startChat :: [Bot] -> IO ()
startChat bots = do
  room <- liftIO . newMVar $ Room [] []
  scotty 8080 $ do

    get "/" $ do
      html . renderHtml $ [shamlet|
          <html><body>
            <form method="POST" action="/login">
              Username: <input name="username" autofocus>
        |]

    post "/login" $ do
      username <- param "username"
      liftIO . modifyMVar_ room $ \r ->
        pure $ r { roomUsers = roomUsers r <> [username] }
      setSimpleCookie "SESSION" $ pack username
      redirect "/chat"

    get "/chat" $
      liftIO (readMVar room) >>= chatRoom

    post "/chat/message" $ do
      body <- param "body"
      user <- currentUser
      now <- liftIO getCurrentTime
      let botMessages = fmap (\b -> Message "bot" b now) $ catMaybes (fmap (\b -> b body) bots)
      let message = Message user body now
      liftIO . modifyMVar_ room $ \r ->
        pure $ r { roomMessages = roomMessages r <> [message] <> botMessages }
      liftIO (readMVar room) >>= chatRoom

chatRoom :: Room -> ActionM ()
chatRoom (Room users messages) = do
  user <- currentUser
  let rowClass m = renderHtml $ if user == messageUser m then "current-user" else ""
  html . renderHtml $ [shamlet|
      <html>
        <head>
          <style>
            .current-user {
              background-color: lightblue;
            }
            .user {
              font-weight: bold;
            }
            .time {
              font-style: italic;
            }
        <body>
          <table>
            $forall u <- users
              <tr>
                <td>
                  #{u}
          <table>
            $forall m <- messages
              <tr class="#{rowClass m}">
                <td>
                  <span class="user">#{messageUser m}</span>
                  <span class="time">#{formatTime defaultTimeLocale "%H:%M:%S" $ messageTime $ m}</span>
                <td>#{messageBody m}
          <form method="POST" action="/chat/message">
            <input name="body" autofocus>
    |]

-- FIX Redirect to home page if not found
currentUser :: ActionM User
currentUser = unpack . fromMaybe "unknown" <$> getCookie "SESSION"
