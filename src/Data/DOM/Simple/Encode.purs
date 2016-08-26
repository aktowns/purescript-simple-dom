module Data.DOM.Simple.Encode where

import DOM (DOM)
import Control.Monad.Eff (Eff)

foreign import encodeURIComponent :: String -> String
foreign import decodeURIComponent :: String -> String
foreign import encodeURI :: String -> String
foreign import decodeURI :: String -> String

-- | Given an object, convert it into URL parameters.
foreign import paramatize :: forall a. a -> String

-- | Given an object, convert it into a JSON string
foreign import toJsonString :: forall eff a. a -> (Eff (dom :: DOM | eff) String)
