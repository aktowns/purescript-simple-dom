module Data.DOM.Simple.Unsafe.Events where

import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeAddEventListener
  "function unsafeAddEventListener(targ) {              \
  \  return function (cb) {                             \
  \     return function (src) {                         \
  \       return function () {                          \
  \         src.addEventListener(targ, function(evt) {  \
  \           cb(evt)();                                \
  \         });                                         \
  \       };                                            \
  \     };                                              \
  \  };                                                 \
  \}" :: forall eff t a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeRemoveEventListener
  "function unsafeRemoveEventListener(targ) {               \
  \  return function (cb) {                                 \
  \     return function (src) {                             \
  \       return function () {                              \
  \         src.removeEventListener(targ, function (evt) {  \
  \           cb(evt)();                                    \
  \         });                                             \
  \       };                                                \
  \     };                                                  \
  \  };                                                     \
  \}" :: forall eff t a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> (Eff (dom :: DOM | eff) Unit)
