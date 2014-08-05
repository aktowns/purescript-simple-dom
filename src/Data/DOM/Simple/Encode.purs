module Data.DOM.Simple.Encode where

import Control.Monad.Eff
import Data.Dom.Simple.Element

foreign import encodeURIComponent :: String -> String
foreign import decodeURIComponent :: String -> String
foreign import encodeURI :: String -> String
foreign import decodeURI :: String -> String

foreign import paramatize
  "function paramatize(obj) {                    \
  \  return Object.keys(obj).map(function(key) { \
  \    return key + '=' + obj[key];              \
  \  }).join('&');                               \
  \}" :: forall a. a -> String
