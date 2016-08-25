module Test.Main where

import Prelude (Unit, bind, (==), ($), (>>=))

import Data.Array (length)
import Data.Maybe (Maybe(..), isNothing)

import Control.Monad.Eff.Class (liftEff)

import Data.DOM.Simple.Element
import Data.DOM.Simple.Document   (body, title, setTitle)
import Data.DOM.Simple.Window     (globalWindow, navigator, document)
import Data.DOM.Simple.Navigator  (language, appVersion, appName)
import Data.DOM.Simple.NodeList as NL

import Test.Spec                  (describe, it)
import Test.Spec.Runner           (run)
import Test.Spec.Assertions       (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)

foreign import inspect :: forall a. a -> Unit

foreign import tagname :: forall a. a -> String

main = run [consoleReporter] do
  describe "purescript-simple-dom" do
    describe "document" do
      it "Able to get the title of a document" do
        doc <- liftEff (document globalWindow)
        docTitle <- liftEff (title doc)
        docTitle `shouldEqual` "testTitle"
      it "Able to set the title of a document" do
        docTitle <- liftEff do
          doc <- document globalWindow
          setTitle "modifiedTitle" doc
          title doc
        docTitle `shouldEqual` "modifiedTitle"

    describe "body" do
      it "Able to get the body element of a document" do
        docBody <- liftEff do
          doc <- document globalWindow
          body doc
        tagname docBody `shouldEqual` "BODY"
      it "Able to append a child" do
        liftEff do
          doc <- document globalWindow
          docBody <- body doc
          Just testDiv <- getElementById "test1" doc
          appendChild docBody testDiv

    describe "elements" do
      it "Able to look up element by id" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        tagname     testDiv `shouldEqual` "DIV"
        content <- liftEff (textContent testDiv)
        content `shouldEqual` "testContent1"
      it "Able to look up element by class name" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (querySelector ".test2" doc)
        tagname     testDiv `shouldEqual` "DIV"
        content <- liftEff (textContent testDiv)
        content `shouldEqual` "testContent2"
      it "Able to look up element by tag name" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (querySelector "test3" doc)
        tagname     testDiv `shouldEqual` "DIV"
        content <- liftEff (textContent testDiv)
        content `shouldEqual` "testContent3"
      it "Able to count items in a nodelist" do
        doc <- liftEff (document globalWindow)
        n <- liftEff do
          testDivs <- querySelectorAll "div" doc
          NL.length testDivs
        n `shouldEqual` 2
      it "Able to retrieve an item from a nodelist" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff do
          testDivs <- querySelectorAll "div" doc
          NL.item 0 testDivs
        tagname testDiv `shouldEqual` "DIV"
      it "Able to convert a nodelist into an array" do
        doc <- liftEff (document globalWindow)
        testDivs <- liftEff (querySelectorAll "div" doc)
        nl1 <- liftEff (NL.nodeListToArray  testDivs)
        nl2 <- liftEff (NL.nodeListToArray' testDivs)
        length nl1 `shouldEqual` length nl2

    describe "element modification" do
      it "Able to modify input's value" do
        doc <- liftEff (document globalWindow)
        Just testInput <- liftEff (getElementById "input1" doc)
        liftEff (setValue "foo bar baz" testInput)
        val <- liftEff (value testInput)
        val `shouldEqual` "foo bar baz"
      it "Able to modify element's content" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        liftEff (setTextContent "Hello" testDiv)
        content <- liftEff (textContent testDiv)
        content `shouldEqual` "Hello"
      it "Able to set an attribute on an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        testDivAttribute <- liftEff do
          setAttribute "data-test" "hello" testDiv
          getAttribute "data-test" testDiv
        testDivAttribute `shouldEqual` "hello"
      it "Able to remove an attribute from an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        testDivHasAttribute <- liftEff (hasAttribute "data-test" testDiv)
        testDivHasAttribute `shouldEqual` true
        liftEff (removeAttribute "data-test" testDiv)
        testDivHasAttribute' <- liftEff (hasAttribute "data-test" testDiv)
        testDivHasAttribute' `shouldEqual` false
      it "Able to set a style attribute on an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        liftEff (setStyleAttr "color" "red" testDiv)
        testDivStyleAttr <- liftEff (getStyleAttr "color" testDiv)
        testDivStyleAttr `shouldEqual` "red"

    describe "navigator" do
      it "Able to receive the appName from navigator" do
        navigator <- liftEff (navigator globalWindow)
        name <- liftEff (appName navigator)
        name `shouldEqual` "Node.js jsDom"
      it "Able to receive the appVersion from navigator" do
        navigator <- liftEff (navigator globalWindow)
        ver <- liftEff (appVersion navigator)
        ver `shouldEqual` "Node.js jsDom"
      it "Able to receive the language from navigator" do
        navigator <- liftEff (navigator globalWindow)
        lang <- liftEff (language navigator)
        lang `shouldEqual` "en-US"

    -- Tests for offset* properties of an element. These behave strangely
    -- with Zombie.js, so these tests just ensure that a value is returned.
    describe "offset" do
      it "Able to get the offsetParent of an element" do
        -- HTMLElement.offsetParent is "undefined" in Zombie.js
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        noParent <- liftEff (offsetParent testDiv)
        isNothing noParent `shouldEqual` true
      it "Able to get the offsetHeight of an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        heightVal <- liftEff (offsetHeight testDiv)
        heightVal `shouldEqual` 0
      it "Able to get the offsetWidth of an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        widthVal <- liftEff (offsetWidth testDiv)
        widthVal `shouldEqual` 0
      it "Able to get the offsetTop of an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        topVal <- liftEff (offsetTop testDiv)
        topVal `shouldEqual` 0
      it "Able to get the offsetLeft of an element" do
        doc <- liftEff (document globalWindow)
        Just testDiv <- liftEff (getElementById "test1" doc)
        leftVal <- liftEff (offsetLeft testDiv)
        leftVal `shouldEqual` 0

      -- Unavailable in Zombie
      {-
      it "Able to add a class" do
        hasTestClass <- classContains "testClass" testDiv
        hasTestClass `shouldEqual` false

        classAdd "testClass" testDiv
        hasTestClass' <- classContains "testClass" testDiv
        hasTestClass' `shouldEqual` true
      -}
