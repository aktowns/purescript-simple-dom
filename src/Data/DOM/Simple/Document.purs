module Data.DOM.Simple.Document where

import Prelude

import Control.Monad.Eff (Eff())

import           Data.DOM.Simple.Element (Element(..))
import           Data.DOM.Simple.Unsafe.Document ( unsafeTitle
                                                 , unsafeSetTitle
                                                 , unsafeBody
                                                 , unsafeSetBody
                                                 , unsafeCreateElement )
import qualified Data.DOM.Simple.Unsafe.Element as SUE
import           Data.DOM.Simple.Unsafe.Utils (ensure, showImpl)

import DOM (DOM())
import DOM.HTML.Types (HTMLDocument(), HTMLElement())

data Document b = Document {
   title           :: forall eff. b            ->      (Eff (dom :: DOM | eff) String)
  ,setTitle        :: forall eff. String       -> b -> (Eff (dom :: DOM | eff) Unit)
  ,body            :: forall eff. b            ->      (Eff (dom :: DOM | eff) HTMLElement)
  ,setBody         :: forall eff. HTMLElement  -> b -> (Eff (dom :: DOM | eff) Unit)
  ,createElement   :: forall eff. String       -> b -> (Eff (dom :: DOM | eff) HTMLElement)
}

element'HTMLDocument :: Element HTMLDocument
element'HTMLDocument = Element {
   getElementById          : \id el -> (SUE.unsafeGetElementById id el) >>= (ensure >>> return)
  ,getElementsByClassName  : SUE.unsafeGetElementsByClassName
  ,getElementsByName       : SUE.unsafeGetElementsByName
  ,querySelector           : \sel el -> (SUE.unsafeQuerySelector sel el) >>= (ensure >>> return)
  ,querySelectorAll        : SUE.unsafeQuerySelectorAll
  ,getAttribute            : SUE.unsafeGetAttribute
  ,setAttribute            : SUE.unsafeSetAttribute
  ,hasAttribute            : SUE.unsafeHasAttribute
  ,removeAttribute         : SUE.unsafeRemoveAttribute
  ,getStyleAttr            : SUE.unsafeGetStyleAttr
  ,setStyleAttr            : SUE.unsafeSetStyleAttr
  ,children                : SUE.unsafeChildren
  ,appendChild             : SUE.unsafeAppendChild
  ,innerHTML               : SUE.unsafeInnerHTML
  ,setInnerHTML            : SUE.unsafeSetInnerHTML
  ,textContent             : SUE.unsafeTextContent
  ,setTextContent          : SUE.unsafeSetTextContent
  ,value                   : SUE.unsafeValue
  ,setValue                : SUE.unsafeSetValue
  ,contentWindow           : SUE.unsafeContentWindow
  ,classRemove             : SUE.unsafeClassRemove
  ,classAdd                : SUE.unsafeClassAdd
  ,classToggle             : SUE.unsafeClassToggle
  ,classContains           : SUE.unsafeClassContains
  ,offsetParent            : \el -> (SUE.unsafeOffsetParent el) >>= (ensure >>> return)
  ,offsetHeight            : SUE.unsafeOffsetHeight
  ,offsetWidth             : SUE.unsafeOffsetWidth
  ,offsetTop               : SUE.unsafeOffsetTop
  ,offsetLeft              : SUE.unsafeOffsetLeft
}

document'HTMLDocument :: Document HTMLDocument
document'HTMLDocument = Document {
   title          : unsafeTitle
  ,setTitle       : unsafeSetTitle
  ,body           : unsafeBody
  ,setBody        : unsafeSetBody
  ,createElement  : unsafeCreateElement
}

{--
instance showHtmlDocument :: Show HTMLDocument where
  show = showImpl
--}
