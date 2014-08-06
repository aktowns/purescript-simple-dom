module Data.DOM.Simple.Unsafe.Document where

import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeTitle
  "function unsafeTitle(src) {        \
  \  return function () {             \
  \    return src.title;              \
  \  };                               \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetTitle
  "function unsafeSetTitle(value) {   \
  \  return function (src) {          \
  \    return function () {           \
  \      src.title = value;           \
  \    };                             \
  \  };                               \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)
