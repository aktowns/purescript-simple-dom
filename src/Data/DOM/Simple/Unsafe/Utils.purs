module Data.DOM.Simple.Unsafe.Utils where

import Data.Maybe

forceImport = Just "a"

foreign import ensure
  "function ensure(v) {                         \
  \  if (v === undefined || v === null) {       \
  \    return new PS.Data_Maybe.Nothing;           \
  \  } else {                                   \
  \    return new PS.Data_Maybe.Just(v);           \
  \  }                                          \
  \}" :: forall a. a -> Maybe a

foreign import showImpl
  "function showImpl(v) {   \
  \  return function () {   \
  \    return v.toString(); \
  \  };                     \
  \}" :: forall a. a -> String
