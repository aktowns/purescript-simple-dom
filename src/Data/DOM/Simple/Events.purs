module Data.DOM.Simple.Events where

import Control.Monad.Eff
import Data.Dom.Simple.Element

foreign import data JavascriptContext :: *

foreign import addEventListener
  "function addEventListener(targ) {           \
  \  return function (cb) {                    \
  \     return function (src) {                \
  \       return function () {                 \
  \         src.addEventListener(targ, cb);    \
  \       };                                   \
  \     };                                     \
  \  };                                        \
  \}" :: forall eff reff. String -> (JavascriptContext -> (Eff (dom :: DOM | reff) Unit)) -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)
