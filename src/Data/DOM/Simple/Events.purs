module Data.DOM.Simple.Events where

import Control.Monad.Eff
import Data.Dom.Simple.Element

foreign import data JavascriptContext :: *

foreign import addEventListener
  "function addEventListener(src) {              \
  \  return function (targ) {                    \
  \     return function (cb) {                   \
  \       src.addEventListener(targ, cb);        \
  \     };                                       \
  \  };                                          \
  \}" :: forall eff reff. HTMLElement -> String -> (JavascriptContext -> (Eff (dom :: DOM | reff) Unit)) -> (Eff (dom :: DOM | eff) Unit)
