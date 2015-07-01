module Data.DOM.Simple.Unsafe.NodeList where

import DOM
import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeNodeListLength  :: forall eff. NodeList -> Eff (dom :: DOM | eff) Number

foreign import unsafeNodeListItem  :: forall eff. Number -> NodeList -> Eff (dom :: DOM | eff) HTMLElement

foreign import unsafeNodeListToArray ::forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
