module Data.DOM.Simple.Events where

import Control.Monad.Eff

import Data.DOM.Simple.Element
import Data.DOM.Simple.Ajax

foreign import data DOMEvent :: *
foreign import data JavascriptContext :: *

class EventTarget b where
  addEventListener    :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import unsafeAddEventListener
  "function unsafeAddEventListener(targ) {     \
  \  return function (cb) {                    \
  \     return function (src) {                \
  \       return function () {                 \
  \         src.addEventListener(targ, cb);    \
  \       };                                   \
  \     };                                     \
  \  };                                        \
  \}" :: forall t ta a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import unsafeRemoveEventListener
  "function unsafeRemoveEventListener(targ) {   \
  \  return function (cb) {                     \
  \     return function (src) {                 \
  \       return function () {                  \
  \         src.removeEventListener(targ, cb);  \
  \       };                                    \
  \     };                                      \
  \  };                                         \
  \}" :: forall t ta a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import eventTarget
  "function eventTarget(event) { \
  \  return function () {         \
  \    return event.target;       \
  \  };                           \
  \}" :: forall t. DOMEvent -> (Eff (dom :: DOM | t) JavascriptContext)

-- TODO: This is silly, HTMLElement should become a typeclass
-- and we can just expose all the element methods via that
-- otherwise we're going to end up with a lot of variations like this
foreign import eventTargetHTML
  "function eventTargetHTML(event) { \
  \  return function () {         \
  \    return event.target;       \
  \  };                           \
  \}" :: forall t. DOMEvent -> (Eff (dom :: DOM | t) HTMLElement)

foreign import preventDefault
  "function preventDefault(event) { \
  \  return function () {           \
  \    event.preventDefault();      \
  \  }                              \
  \}" :: forall t. DOMEvent -> (Eff (dom :: DOM | t) Unit)

instance eventTargetHTMLElement :: EventTarget HTMLElement where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventTargetHTMLWindow :: EventTarget HTMLWindow where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener


ready :: forall t ta. (Eff (dom :: DOM | t) Unit) -> (Eff (dom :: DOM | ta) Unit)
ready cb = getDocument globalWindow >>= (addEventListener "DOMContentLoaded" $ \_ -> cb)
