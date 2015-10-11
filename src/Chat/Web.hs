{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Chat.Web (
    startChat
  ) where

import           Chat.Data
import           Control.Concurrent
import           Control.Monad.IO.Class
import           Data.List
import           Data.Maybe
import           Data.Monoid
import           Data.Text
import           Data.Time
import           Network.Wai.Middleware.Static
import           Text.Blaze
import           Text.Blaze.Html.Renderer.Text (renderHtml)
import           Text.Hamlet
import           Web.Scotty
import           Web.Scotty.Cookie


startChat :: [Bot] -> IO ()
startChat bots = do
  room <- liftIO . newMVar $ Room [] []
  scotty 8080 $ do
    middleware $ staticPolicy (noDots >-> addBase "static")

    get "/" $ do
      html . renderHtml $ [shamlet|
          <html><body>
            <form method="POST" action="/login">
              Username: <input name="username" autofocus>
        |]

    post "/login" $ do
      username <- param "username"
      liftIO $ addUser room username
      setSimpleCookie "SESSION" $ pack username
      redirect "/chat"

    get "/chat" $ do
      user <- currentUser
      liftIO $ addUser room user
      liftIO (readMVar room) >>= chatRoom

    post "/chat/message" $ do
      body <- param "body"
      user <- currentUser
      liftIO $ addUser room user
      now <- liftIO getCurrentTime
      botReplies <- liftIO $ mapM (\b -> b body) bots
      let botMessages = fmap (\b -> Message "bot" b now) $ catMaybes botReplies
      let message = Message user body now
      liftIO . modifyMVar_ room $ \r ->
        pure $ r { roomMessages = roomMessages r <> [message] <> botMessages }
      liftIO (readMVar room) >>= chatRoom

addUser :: MVar Room -> User -> IO ()
addUser room username =
  modifyMVar_ room $ \r ->
    pure $ r { roomUsers = sort . nub $ roomUsers r <> [username] }

chatRoom :: Room -> ActionM ()
chatRoom (Room users messages) = do
  user <- currentUser
  let rowClass m = renderHtml $ if user == messageUser m then "current-user" else ""
  html . renderHtml $ [shamlet|
      <html>
        <head>
          <link href="/style/chat.css" rel="stylesheet" type="text/css">
        <body>
          <table class="main">
            <tr>
              <td class="sidebar">
                <div class="section">
                  <h2>Members
                  <ul>
                    $forall u <- users
                      <li>
                        - #{u}
              <td class="mainbar">
                <table>
                  <tr class="middle">
                    <td>
                      <div class="messages">
                        $forall m <- messages
                          <div class="#{rowClass m}">
                          <div class="row messageRow chat self type_buffer_msg">
                            <span class="date">
                              <span>#{formatTime defaultTimeLocale "%H:%M:%S" $ messageTime $ m}
                            <span class="g">&nbsp;
                            <span class="message">
                              <span class="authorWrap">
                                <span class="buffer bufferLink author user link">#{messageUser m}
                                &nbsp;
                              <span class="content">#{messageBody m}
                  <tr class="footer">
                    <td>
                      <form method="POST" action="/chat/message">
                        <input name="body" autofocus>
        <script type="text/javascript" src="/js/chat.js">

    |]

-- FIX Redirect to home page if not found
currentUser :: ActionM User
currentUser = unpack . fromMaybe "unknown" <$> getCookie "SESSION"
