module Data.DOM.Simple.JSON where

import Control.Monad.Eff
import Data.Dom.Simple.Element

foreign import data JSONObject :: *


foreign import stringify
  "function stringify(obj) {        \
  \  return function () {           \
  \    return JSON.stringify(obj);  \
  \  };                             \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import parse
  "function parse(str) { \
  \  return function () {      \
  \    return JSON.parse(str); \
  \  };                        \
  \}" :: forall eff. String -> (Eff (dom :: DOM | eff) JSONObject)
