module Data.DOM.Simple.Events where

import Control.Monad.Eff

import Data.DOM.Simple.Types
import Data.DOM.Simple.Window(document, globalWindow)
import Data.DOM.Simple.Ajax
import Data.DOM.Simple.Unsafe.Events

class EventTarget b where
  addEventListener    :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import eventTarget
  "function eventTarget(event) { \
  \  return function () {         \
  \    return event.target;       \
  \  };                           \
  \}" :: forall eff a. DOMEvent -> (Eff (dom :: DOM | eff) a)

foreign import preventDefault
  "function preventDefault(event) { \
  \  return function () {           \
  \    event.preventDefault();      \
  \  }                              \
  \}" :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) Unit)

instance eventTargetHTMLElement :: EventTarget HTMLElement where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventTargetHTMLDocument :: EventTarget HTMLDocument where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventTargetHTMLWindow :: EventTarget HTMLWindow where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

ready :: forall t ta. (Eff (dom :: DOM | t) Unit) -> (Eff (dom :: DOM | ta) Unit)
ready cb = document globalWindow >>= (addEventListener "DOMContentLoaded" $ \_ -> cb)
