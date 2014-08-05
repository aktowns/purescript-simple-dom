module Data.DOM.Simple.Events where

import Control.Monad.Eff
import Data.DOM.Simple.Element

foreign import addEventListener
  "function addEventListener(targ) {           \
  \  return function (cb) {                    \
  \     return function (src) {                \
  \       return function () {                 \
  \         src.addEventListener(targ, cb);    \
  \       };                                   \
  \     };                                     \
  \  };                                        \
  \}" :: forall eff reff a b. String -> (Eff (dom :: DOM | reff) a) -> HTMLElement -> (Eff (dom :: DOM | eff) b)

foreign import removeEventListener
  "function removeEventListener(targ) {         \
  \  return function (cb) {                     \
  \     return function (src) {                 \
  \       return function () {                  \
  \         src.removeEventListener(targ, cb);  \
  \       };                                    \
  \     };                                      \
  \  };                                         \
  \}" :: forall eff reff a b. String -> (Eff (dom :: DOM | reff) a) -> HTMLElement -> (Eff (dom :: DOM | eff) b)


ready :: forall eff a b. (Eff (dom :: DOM | eff) a) -> (Eff (dom :: DOM | eff) b)
ready cb = getDocument globalWindow >>= (addEventListener "DOMContentLoaded" cb)
