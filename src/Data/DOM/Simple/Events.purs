module Data.DOM.Simple.Events where

import Control.Monad.Eff

import Data.DOM.Simple.Element
import Data.DOM.Simple.Ajax

class EventBindable b where
  addEventListener    :: forall t ta a. String -> (Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeEventListener :: forall t ta a. String -> (Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import unsafeAddEventListener
  "function addEventListener(targ) {           \
  \  return function (cb) {                    \
  \     return function (src) {                \
  \       return function () {                 \
  \         src.addEventListener(targ, cb);    \
  \       };                                   \
  \     };                                     \
  \  };                                        \
  \}" :: forall t ta a b. String -> (Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

foreign import unsafeRemoveEventListener
  "function removeEventListener(targ) {         \
  \  return function (cb) {                     \
  \     return function (src) {                 \
  \       return function () {                  \
  \         src.removeEventListener(targ, cb);  \
  \       };                                    \
  \     };                                      \
  \  };                                         \
  \}" :: forall t ta a b. String -> (Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | ta) Unit)

instance eventBindableHTMLElement :: EventBindable HTMLElement where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventBindableHTMLWindow :: EventBindable HTMLWindow where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

instance eventBindableXMLHttpRequest :: EventBindable XMLHttpRequest where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener

ready :: forall t ta a b. (Eff (dom :: DOM | t) a) -> (Eff (dom :: DOM | ta) Unit)
ready cb = getDocument globalWindow >>= (addEventListener "DOMContentLoaded" cb)
