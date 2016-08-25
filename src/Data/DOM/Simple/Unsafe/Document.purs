module Data.DOM.Simple.Unsafe.Document where

import Prelude (Unit)

import DOM (DOM)
import Control.Monad.Eff (Eff)

import Data.DOM.Simple.Unsafe.Element (HTMLElement)

foreign import unsafeTitle :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetTitle :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeBody :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeSetBody :: forall eff a. HTMLElement -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeCreateElement :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) HTMLElement)
