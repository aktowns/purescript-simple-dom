module Main where

import Data.Array
import Data.Maybe

import Debug.Trace

import Data.DOM.Simple.Types
import Data.DOM.Simple.Element

import Test.QuickCheck

foreign import inspect
  "function inspect(msg) { console.log(msg.textContent); }"
  :: forall a. a -> Unit

main = do
  document <- getDocument globalWindow

  trace "Able to look up elements"

  testDiv1 <- getElementById "test1" document
  testDiv1Contents <- textContent testDiv1

  quickCheck' 1 $ testDiv1Contents == "testContent1"

  testDiv2 <- querySelector ".test2" document
  testDiv2Contents <- textContent testDiv2

  quickCheck' 1 $ testDiv2Contents == "testContent2"

  testDiv3 <- querySelector "test3" document
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
