module Data.DOM.Simple.Element where

import Prelude

import Control.Monad.Eff
import DOM
import DOM.Node.Types

import Data.DOM.Simple.Unsafe.Utils(ensure, showImpl)
import Data.DOM.Simple.Unsafe.Element
import Data.DOM.Simple.Types

import Data.Foldable(for_)
import Data.Maybe
import Data.Array as A
import Data.Tuple as T

class Element b where
  getElementById         :: forall eff. String -> b -> (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  getElementsByClassName :: forall eff. String -> b -> (Eff (dom :: DOM | eff) (Array HTMLElement))
  getElementsByName      :: forall eff. String -> b -> (Eff (dom :: DOM | eff) (Array HTMLElement))
  querySelector          :: forall eff. String -> b -> (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  querySelectorAll       :: forall eff. String -> b -> (Eff (dom :: DOM | eff) NodeList)
  getAttribute           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) String)
  setAttribute           :: forall eff. String -> String -> b -> (Eff (dom :: DOM | eff) Unit)
  hasAttribute           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Boolean)
  removeAttribute        :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  getStyleAttr           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) String)
  setStyleAttr           :: forall eff. String -> String -> b -> (Eff (dom :: DOM | eff) Unit)
  children               :: forall eff. b -> (Eff (dom :: DOM | eff) (Array HTMLElement))
  appendChild            :: forall eff. b -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)
  innerHTML              :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setInnerHTML           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  textContent            :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setTextContent         :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  value                  :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setValue               :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  contentWindow          :: forall eff. b -> (Eff (dom :: DOM | eff) HTMLWindow)
  classRemove            :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classAdd               :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classToggle            :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classContains          :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Boolean)
  offsetParent           :: forall eff. b -> (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  offsetHeight           :: forall eff. b -> (Eff (dom :: DOM | eff) Int)
  offsetWidth            :: forall eff. b -> (Eff (dom :: DOM | eff) Int)
  offsetTop              :: forall eff. b -> (Eff (dom :: DOM | eff) Int)
  offsetLeft             :: forall eff. b -> (Eff (dom :: DOM | eff) Int)

instance htmlElement :: Element HTMLElement where
  getElementById id el    = (unsafeGetElementById id el) >>= (ensure >>> pure)
  getElementsByClassName  = unsafeGetElementsByClassName
  getElementsByName       = unsafeGetElementsByName
  querySelector sel el    = (unsafeQuerySelector sel el) >>= (ensure >>> pure)
  querySelectorAll        = unsafeQuerySelectorAll
  getAttribute            = unsafeGetAttribute
  setAttribute            = unsafeSetAttribute
  hasAttribute            = unsafeHasAttribute
  removeAttribute         = unsafeRemoveAttribute
  getStyleAttr            = unsafeGetStyleAttr
  setStyleAttr            = unsafeSetStyleAttr
  children                = unsafeChildren
  appendChild             = unsafeAppendChild
  innerHTML               = unsafeInnerHTML
  setInnerHTML            = unsafeSetInnerHTML
  textContent             = unsafeTextContent
  setTextContent          = unsafeSetTextContent
  value                   = unsafeValue
  setValue                = unsafeSetValue
  contentWindow           = unsafeContentWindow
  classRemove             = unsafeClassRemove
  classAdd                = unsafeClassAdd
  classToggle             = unsafeClassToggle
  classContains           = unsafeClassContains
  offsetParent el         = (unsafeOffsetParent el) >>= (ensure >>> pure)
  offsetHeight            = unsafeOffsetHeight
  offsetWidth             = unsafeOffsetWidth
  offsetTop               = unsafeOffsetTop
  offsetLeft              = unsafeOffsetLeft

setAttributes :: forall eff a. (Element a) => Array (T.Tuple String String) -> a -> (Eff (dom :: DOM | eff) Unit)
setAttributes xs el = for_ xs (\kv -> setAttribute (T.fst kv) (T.snd kv) el)

setStyleAttrs :: forall eff a. (Element a) => Array (T.Tuple String String) -> a -> (Eff (dom :: DOM | eff) Unit)
setStyleAttrs xs el = for_ xs (\kv -> setStyleAttr (T.fst kv) (T.snd kv) el)

click :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
click = unsafeClick

focus :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
focus = unsafeFocus

blur :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
blur = unsafeBlur
