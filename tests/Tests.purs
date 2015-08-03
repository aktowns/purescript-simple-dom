module Main where

import Prelude

import Data.Array
import Data.Maybe

import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.DOM.Simple.Document
import Data.DOM.Simple.Window
import Data.DOM.Simple.Encode
import Data.DOM.Simple.Ajax
import Data.DOM.Simple.Events
import Data.DOM.Simple.Navigator
import qualified Data.DOM.Simple.NodeList as NL

import Test.QuickCheck

foreign import inspect :: forall a. a -> Unit

foreign import tagname :: forall a. a -> String

checkTagName shouldBe element = do
  let name = tagname element
  quickCheck' 1 $ name == shouldBe

checkContents shouldBe element = do
  contents <- textContent (element :: HTMLElement)
  quickCheck' 1 $ contents == shouldBe

checkValue shouldBe element = do
  val <- value (element :: HTMLElement)
  quickCheck' 1 $ val == shouldBe

main = do
  doc <- document globalWindow

  log "Able to get the title of a document"

  docTitle <- title doc
  quickCheck' 1 $ docTitle == "testTitle"

  -- attrib <- "#testDiv1" `getAttribute` "hello"

  log "Able to set the title of a document"

  setTitle "modifiedTitle" doc
  docTitle1 <- title doc

  quickCheck' 1 $ docTitle1 == "modifiedTitle"


  log "Able to get the body element of a document"

  docBody <- body doc

  checkTagName "BODY" docBody

  log "Able to look up elements"

  Just testDiv1 <- getElementById "test1" doc

  checkTagName "DIV" testDiv1
  checkContents "testContent1" testDiv1

  Just testDiv2 <- querySelector ".test2" doc

  checkTagName "DIV" testDiv2
  checkContents "testContent2" testDiv2

  Just testDiv3 <- querySelector "test3" doc

  checkTagName "TEST3" testDiv3
  checkContents "testContent3" testDiv3

  testDivs <- querySelectorAll "div" doc

  log "Able to count items in a nodelist"
  NL.length testDivs >>= (\len -> quickCheck' 1 $ len == 2)

  log "Able to retrieve an item from a nodelist"
  Just testDiv4 <- NL.item 0 testDivs
  checkTagName "DIV" testDiv4

  log "Able to convert a nodelist into an array"
  nl1 <- NL.nodeListToArray testDivs
  nl2 <- NL.nodeListToArray' testDivs
  quickCheck' 1 $ length nl1 == length nl2

  log "Able to modify an elements contents"

  setTextContent "Hello" testDiv1

  checkContents "Hello" testDiv1


  log "Able to modify a form element's value"

  Just testInput1 <- getElementById "input1" doc

  setValue "foo bar baz" testInput1

  checkValue "foo bar baz" testInput1

  log "Able to set an attribute on an element"

  setAttribute "data-test" "hello" testDiv1
  testDiv1Attribute <- getAttribute "data-test" testDiv1

  quickCheck' 1 $ testDiv1Attribute == "hello"


  log "Able to remove an attribute from an element"

  testDiv1HasAttribute <- hasAttribute "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute == true
  removeAttribute "data-test" testDiv1
  testDiv1HasAttribute' <- hasAttribute "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute' == false

  log "Able to set a style attribute on an element"

  setStyleAttr "color" "red" testDiv1
  testDiv1StyleAttr <- getStyleAttr "color" testDiv1

  quickCheck' 1 $ testDiv1StyleAttr == "red"

  navigator <- navigator globalWindow
  log "Able to receive the appName from navigator"
  appName navigator >>= (\name -> quickCheck' 1 $ name == "Node.js jsDom")
  log "Able to receive the appVersion from navigator"
  appVersion navigator >>= (\name -> quickCheck' 1 $ name == "Node.js jsDom")
  log "Able to receive the language from navigator"
  language navigator >>= (\name -> quickCheck' 1 $ name == "en-US")

  log "Able to append a child"
  appendChild docBody testDiv1

  -- Tests for offset* properties of an element. These behave strangely
  -- with Zombie.js, so these tests just ensure that a value is returned.

  log "Able to get the offsetParent of an element"
  -- HTMLElement.offsetParent is "undefined" in Zombie.js
  noParent <- offsetParent testDiv1
  quickCheck' 1 $ isNothing noParent

  log "Able to get the offsetHeight of an element"
  heightVal <- offsetHeight testDiv1
  quickCheck' 1 $ heightVal == 0

  log "Able to get the offsetWidth of an element"
  widthVal <- offsetWidth testDiv1
  quickCheck' 1 $ widthVal == 0

  log "Able to get the offsetTop of an element"
  topVal <- offsetTop testDiv1
  quickCheck' 1 $ topVal == 0

  log "Able to get the offsetLeft of an element"
  leftVal <- offsetLeft testDiv1
  quickCheck' 1 $ leftVal == 0

  -- Unavailable in Zombie
  -- log "Able to add a class"

  --hasTestClass1 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass1 == false

  -- classAdd "testClass" testDiv1
  -- hasTestClass2 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass2 == true
