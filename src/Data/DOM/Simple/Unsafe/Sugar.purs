module Data.DOM.Simple.Unsafe.Sugar where

import Control.Monad.Eff
import DOM

import Data.DOM.Simple.Element
import Data.DOM.Simple.Types

foreign import dirtyKindDomRecast :: forall eff effn a. (Element a) => (Eff eff a) -> (Eff (dom :: DOM | effn) a)
