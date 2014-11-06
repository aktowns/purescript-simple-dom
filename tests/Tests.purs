module Main where

import Data.Array
import Data.Maybe

import Control.Monad.Eff
import Debug.Trace

import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.DOM.Simple.Document
import Data.DOM.Simple.Window
import Data.DOM.Simple.Encode
import Data.DOM.Simple.Ajax
import Data.DOM.Simple.Events

import Test.QuickCheck

foreign import inspect
  "function inspect(msg) { console.log(msg); }"
  :: forall a. a -> Unit

foreign import tagname
  "function tagname(obj) { return obj.tagName; }"
  :: forall a. a -> String

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

  trace "Able to get the title of a document"

  docTitle <- title doc
  quickCheck' 1 $ docTitle == "testTitle"

  -- attrib <- "#testDiv1" `getAttribute` "hello"

  trace "Able to set the title of a document"

  setTitle "modifiedTitle" doc
  docTitle1 <- title doc

  quickCheck' 1 $ docTitle1 == "modifiedTitle"


  trace "Able to get the body element of a document"

  docBody <- body doc

  checkTagName "BODY" docBody

  trace "Able to look up elements"

  Just testDiv1 <- getElementById "test1" doc

  checkTagName "DIV" testDiv1
  checkContents "testContent1" testDiv1

  Just testDiv2 <- querySelector ".test2" doc

  checkTagName "DIV" testDiv2
  checkContents "testContent2" testDiv2

  Just testDiv3 <- querySelector "test3" doc

  checkTagName "TEST3" testDiv3
  checkContents "testContent3" testDiv3


  trace "Able to modify an elements contents"

  setTextContent "Hello" testDiv1

  checkContents "Hello" testDiv1


  trace "Able to modify a form element's value"

  Just testInput1 <- getElementById "input1" doc

  setValue "foo bar baz" testInput1

  checkValue "foo bar baz" testInput1


  trace "Able to set an attribute on an element"

  setAttribute "data-test" "hello" testDiv1
  testDiv1Attribute <- getAttribute "data-test" testDiv1

  quickCheck' 1 $ testDiv1Attribute == "hello"


  trace "Able to remove an attribute from an element"

  testDiv1HasAttribute <- hasAttribute "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute == true
  removeAttribute "data-test" testDiv1
  testDiv1HasAttribute' <- hasAttribute "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute' == false

  -- Unavailable in Zombie
  -- trace "Able to add a class"

  --hasTestClass1 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass1 == false

  -- classAdd "testClass" testDiv1
  -- hasTestClass2 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass2 == true
