module Main where

import Data.Array
import Data.Maybe

import Debug.Trace

import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.DOM.Simple.Document
import Data.DOM.Simple.Encode
import Data.DOM.Simple.Ajax
import Data.DOM.Simple.Events

import Test.QuickCheck

foreign import inspect
  "function inspect(msg) { console.log(msg.textContent); }"
  :: forall a. a -> Unit

foreign import tagname
  "function tagname(obj) { return obj.tagName; }"
  :: forall a. a -> String

main = do
  document <- getDocument globalWindow

  trace "Able to get the title of a document"

  docTitle <- title document

  quickCheck' 1 $ docTitle == "testTitle"

  trace "Able to set the title of a document"

  setTitle "modifiedTitle" document
  docTitle1 <- title document

  quickCheck' 1 $ docTitle1 == "modifiedTitle"

  trace "Able to look up elements"

  testDiv1 <- getElementById "test1" document

  quickCheck' 1 $ tagname testDiv1 == "DIV"

  testDiv1Contents <- textContent testDiv1

  quickCheck' 1 $ testDiv1Contents == "testContent1"

  testDiv2 <- querySelector ".test2" document

  quickCheck' 1 $ tagname testDiv2 == "DIV"

  testDiv2Contents <- textContent testDiv2

  quickCheck' 1 $ testDiv2Contents == "testContent2"

  testDiv3 <- querySelector "test3" document

  quickCheck' 1 $ tagname testDiv3 == "TEST3"

  testDiv3Contents <- textContent testDiv3

  quickCheck' 1 $ testDiv3Contents == "testContent3"

  trace "Able to modify an elements contents"

  setTextContent "Hello" testDiv1
  testDiv1Contents' <- textContent testDiv1

  quickCheck' 1 $ testDiv1Contents' == "Hello"

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

  trace "Done"
