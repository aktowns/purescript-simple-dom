module Data.DOM.Simple.Unsafe.NodeList where

import DOM
import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeNodeListLength :: forall eff. NodeList -> Eff (dom :: DOM | eff) Int

foreign import unsafeNodeListItem :: forall eff. Int -> NodeList -> Eff (dom :: DOM | eff) HTMLElement

foreign import unsafeNodeListToArray ::forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
