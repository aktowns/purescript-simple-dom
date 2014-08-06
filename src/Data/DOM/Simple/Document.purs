module Data.DOM.Simple.Document where

import Control.Monad.Eff

import Data.DOM.Simple.Types
import Data.DOM.Simple.Element
import Data.DOM.Simple.Unsafe.Element
import Data.DOM.Simple.Unsafe.Document

class Document b where
  title :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setTitle :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)

instance htmlDocumentElement :: Element HTMLDocument where
  getElementById          = unsafeGetElementById
  getElementsByClassName  = unsafeGetElementsByClassName
  getElementsByName       = unsafeGetElementsByName
  querySelector           = unsafeQuerySelector
  querySelectorAll        = unsafeQuerySelectorAll
  getAttribute            = unsafeGetAttribute
  setAttribute            = unsafeSetAttribute
  hasAttribute            = unsafeHasAttribute
  removeAttribute         = unsafeRemoveAttribute
  children                = unsafeChildren
  innerHTML               = unsafeInnerHTML
  setInnerHTML            = unsafeSetInnerHTML
  textContent             = unsafeTextContent
  setTextContent          = unsafeSetTextContent
  contentWindow           = unsafeContentWindow
  classRemove             = unsafeClassRemove
  classAdd                = unsafeClassAdd
  classToggle             = unsafeClassToggle
  classContains           = unsafeClassContains

instance htmlDocument :: Document HTMLDocument where
  title                   = unsafeTitle
  setTitle                = unsafeSetTitle

foreign import getDocument
  "function getDocument(win) { \
  \  return function () {      \
  \    return win.document;    \
  \  };                        \
  \}" :: forall eff. HTMLWindow -> (Eff (dom :: DOM | eff) HTMLDocument)
