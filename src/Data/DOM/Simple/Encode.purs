module Data.DOM.Simple.Encode where

import Control.Monad.Eff
import Data.Dom.Simple.Element

foreign import encodeURIComponent :: String -> String
foreign import decodeURIComponent :: String -> String
foreign import encodeURI :: String -> String
foreign import decodeURI :: String -> String
