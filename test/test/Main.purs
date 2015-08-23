module Test.Main where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.Array
import Data.Maybe
import Data.Maybe.Unsafe (fromJust)
import DOM.HTML.Types (HTMLElement())

import           Data.DOM.Simple.Types
import           Data.DOM.Simple.Element
import qualified Data.DOM.Simple.Document as IDocument -- :trollface.png:
import           Data.DOM.Simple.Window
import           Data.DOM.Simple.Encode
import           Data.DOM.Simple.Ajax
import           Data.DOM.Simple.Events
import           Data.DOM.Simple.Navigator
import qualified Data.DOM.Simple.NodeList as NL

import Test.QuickCheck

foreign import inspect :: forall a. a -> Unit

foreign import tagname :: forall a. a -> String

checkTagName shouldBe element = do
  let name = tagname element
  quickCheck' 1 $ name == shouldBe

-- checkContents :: forall a. Element a -> String -> a -> _
checkContents (Element {textContent = f}) shouldBe element = do
  contents <- f (element :: HTMLElement)
  quickCheck' 1 $ contents == shouldBe

-- checkValue :: forall a. Element a -> String -> a -> _
checkValue (Element {value = f}) shouldBe element = do
  val <- f (element :: HTMLElement)
  quickCheck' 1 $ val == shouldBe

title (IDocument.Document { title = f }) = f
setTitle (IDocument.Document { setTitle = f }) = f
body (IDocument.Document { body = f }) = f
setBody (IDocument.Document { setBody = f }) = f
createElement (IDocument.Document { createElement = f }) = f

getElementById (Element { getElementById = f }) = f
getElementsByClassName (Element { getElementsByClassName = f }) = f
getElementsByName (Element { getElementsByName = f }) = f
querySelector (Element { querySelector = f }) = f
querySelectorAll (Element { querySelectorAll = f }) = f
getAttribute (Element { getAttribute = f }) = f
setAttribute (Element { setAttribute = f }) = f
hasAttribute (Element { hasAttribute = f }) = f
removeAttribute (Element { removeAttribute = f }) = f
getStyleAttr (Element { getStyleAttr = f }) = f
setStyleAttr (Element { setStyleAttr = f }) = f
children (Element { children = f }) = f
appendChild (Element { appendChild = f }) = f
innerHTML (Element { innerHTML = f }) = f
setInnerHTML (Element { setInnerHTML = f }) = f
textContent (Element { textContent = f }) = f
setTextContent (Element { setTextContent = f }) = f
value (Element { value = f }) = f
setValue (Element { setValue = f }) = f
contentWindow (Element { contentWindow = f }) = f
classRemove (Element { classRemove = f }) = f
classAdd (Element { classAdd = f }) = f
classToggle (Element { classToggle = f }) = f
classContains (Element { classContains = f }) = f
offsetParent (Element { offsetParent = f }) = f
offsetHeight (Element { offsetHeight = f }) = f
offsetWidth (Element { offsetWidth = f }) = f
offsetTop (Element { offsetTop = f }) = f
offsetLeft (Element { offsetLeft = f }) = f


main = do
  let docImpl  = IDocument.document'HTMLDocument
  let docEImpl = IDocument.element'HTMLDocument
  let elImpl   = element'HTMLElement

  doc <- document globalWindow

  log "Able to get the title of a document"

  docTitle <- title IDocument.document'HTMLDocument doc
  quickCheck' 1 $ docTitle == "testTitle"

  -- attrib <- "#testDiv1" `getAttribute` "hello"

  log "Able to set the title of a document"

  setTitle docImpl "modifiedTitle" doc
  docTitle1 <- title IDocument.document'HTMLDocument doc

  quickCheck' 1 $ docTitle1 == "modifiedTitle"


  log "Able to get the body element of a document"

  docBody <- body docImpl doc

  checkTagName "BODY" docBody

  log "Able to look up elements"

  Just testDiv1 <- getElementById docEImpl "test1" doc

  checkTagName "DIV" testDiv1
  checkContents element'HTMLElement "testContent1" testDiv1

  Just testDiv2 <- querySelector docEImpl ".test2" doc

  checkTagName "DIV" testDiv2
  checkContents elImpl "testContent2" testDiv2

  Just testDiv3 <- querySelector docEImpl "test3" doc

  checkTagName "TEST3" testDiv3
  checkContents elImpl "testContent3" testDiv3

  testDivs <- querySelectorAll docEImpl "div" doc

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

  setTextContent elImpl "Hello" testDiv1

  checkContents elImpl "Hello" testDiv1


  log "Able to modify a form element's value"

  Just testInput1 <- getElementById docEImpl "input1" doc

  setValue elImpl "foo bar baz" testInput1

  checkValue elImpl "foo bar baz" testInput1

  log "Able to set an attribute on an element"

  setAttribute elImpl "data-test" "hello" testDiv1
  testDiv1Attribute <- getAttribute elImpl "data-test" testDiv1

  quickCheck' 1 $ testDiv1Attribute == "hello"


  log "Able to remove an attribute from an element"

  testDiv1HasAttribute <- hasAttribute elImpl "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute == true
  removeAttribute elImpl "data-test" testDiv1
  testDiv1HasAttribute' <- hasAttribute elImpl "data-test" testDiv1
  quickCheck' 1 $ testDiv1HasAttribute' == false

  log "Able to set a style attribute on an element"

  setStyleAttr elImpl "color" "red" testDiv1
  testDiv1StyleAttr <- getStyleAttr elImpl "color" testDiv1

  quickCheck' 1 $ testDiv1StyleAttr == "red"

  navigator <- navigator globalWindow
  log "Able to receive the appName from navigator"
  appName navigator >>= (\name -> quickCheck' 1 $ name == "Node.js jsDom" || name == "Netscape")
  log "Able to receive the appVersion from navigator"
  appVersion navigator >>= (\name -> quickCheck' 1 $ name == "Node.js jsDom" || name == "Netscape")
  log "Able to receive the language from navigator"
  language navigator >>= (\name -> quickCheck' 1 $ name == "en-US")

  log "Able to append a child"
  appendChild elImpl docBody testDiv1

  -- Tests for offset* properties of an element. These behave strangely
  -- with Zombie.js, so these tests just ensure that a value is returned.

  -- > Then let's not test those with Zombie.js (whatever it is)?

  log "Able to get the offsetParent of an element"
  -- HTMLElement.offsetParent is "undefined" in Zombie.js
  noParent <- offsetParent elImpl testDiv1
  let force = fromJust noParent
  fv <- innerHTML elImpl force
  log fv
  quickCheck' 1 $ true

  log "Able to get the offsetHeight of an element"
  heightVal <- offsetHeight elImpl testDiv1
  quickCheck' 1 $ heightVal >= 0

  log "Able to get the offsetWidth of an element"
  widthVal <- offsetWidth elImpl testDiv1
  quickCheck' 1 $ widthVal >= 0

  log "Able to get the offsetTop of an element"
  topVal <- offsetTop elImpl testDiv1
  quickCheck' 1 $ topVal >= 0

  log "Able to get the offsetLeft of an element"
  leftVal <- offsetLeft elImpl testDiv1
  quickCheck' 1 $ leftVal >= 0

  -- Unavailable in Zombie
  -- log "Able to add a class"

  --hasTestClass1 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass1 == false

  -- classAdd "testClass" testDiv1
  -- hasTestClass2 <- classContains "testClass" testDiv1
  -- quickCheck' 1 $ hasTestClass2 == true
