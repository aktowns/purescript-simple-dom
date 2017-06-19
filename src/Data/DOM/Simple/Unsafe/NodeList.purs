module Data.DOM.Simple.Unsafe.NodeList where

import DOM (DOM)
import DOM.Node.Types (NodeList)
import Control.Monad.Eff (Eff)

import Data.DOM.Simple.Unsafe.Element (HTMLElement)

foreign import unsafeNodeListLength :: forall eff. NodeList -> Eff (dom :: DOM | eff) Int

foreign import unsafeNodeListItem :: forall eff. Int -> NodeList -> Eff (dom :: DOM | eff) HTMLElement

foreign import unsafeNodeListToArray ::forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
