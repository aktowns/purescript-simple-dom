module Data.DOM.Simple.Element where

import Control.Monad.Eff

import Data.DOM.Simple.Unsafe.Element
import Data.DOM.Simple.Types

class Element b where
  getElementById         :: forall eff. String -> b -> (Eff (dom :: DOM | eff) HTMLElement)
  getElementsByClassName :: forall eff. String -> b -> (Eff (dom :: DOM | eff) [HTMLElement])
  getElementsByName      :: forall eff. String -> b -> (Eff (dom :: DOM | eff) [HTMLElement])
  querySelector          :: forall eff. String -> b -> (Eff (dom :: DOM | eff) HTMLElement)
  querySelectorAll       :: forall eff. String -> b -> (Eff (dom :: DOM | eff) [HTMLElement])
  getAttribute           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) String)
  setAttribute           :: forall eff. String -> String -> b -> (Eff (dom :: DOM | eff) Unit)
  hasAttribute           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Boolean)
  removeAttribute        :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  children               :: forall eff. b -> (Eff (dom :: DOM | eff) [HTMLElement])
  innerHTML              :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setInnerHTML           :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  textContent            :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setTextContent         :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  contentWindow          :: forall eff. b -> (Eff (dom :: DOM | eff) HTMLWindow)
  classRemove            :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classAdd               :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classToggle            :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  classContains          :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Boolean)

instance htmlElement :: Element HTMLElement where
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

foreign import globalWindow
  "var globalWindow = window;" :: HTMLWindow

foreign import getDocument
  "function getDocument(win) { \
  \  return function () {      \
  \    return win.document;    \
  \  };                        \
  \}" :: forall eff. HTMLWindow -> (Eff (dom :: DOM | eff) HTMLDocument)
