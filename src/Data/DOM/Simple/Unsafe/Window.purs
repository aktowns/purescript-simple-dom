module Data.DOM.Simple.Unsafe.Window where

import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeDocument
  "function unsafeDocument(win) {    \
  \  return function () {            \
  \    return win.document;          \
  \  };                              \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLDocument)

foreign import unsafeLocation
  "function unsafeLocation(win) {   \
  \  return function () {           \
  \    return win.location;         \
  \  };                             \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) DOMLocation)

-- hmmm. useless re-cast?
foreign import unsafeGetLocation
  "function unsafeGetLocation(loc) {\
  \  return function () {           \
  \    return loc;                  \
  \  };                             \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetLocation
  "function unsafeSetLocation(value) {  \
  \  return function (loc) {            \
  \    return function () {             \
  \      location = value;              \
  \    };                               \
  \  };                                 \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeGetSearchLocation
  "function unsafeGetSearchLocation(loc) { \
  \  return function () {                  \
  \    return loc.search;                  \
  \  };                                    \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)
