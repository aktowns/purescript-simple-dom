module Data.DOM.Simple.Unsafe.Utils where

import Data.Maybe

foreign import ensure3 :: forall a. Maybe a -> (a -> Maybe a) -> a -> Maybe a

ensure = ensure3 Nothing Just

foreign import showImpl :: forall a. a -> String
