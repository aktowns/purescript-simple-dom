module Data.DOM.Simple.Unsafe.Events where

import Prelude

import DOM
import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeAddEventListener :: forall eff t e b. String -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeRemoveEventListener :: forall eff t e b. String -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeEventTarget :: forall eff a. DOMEvent -> (Eff (dom :: DOM | eff) a)

foreign import unsafeStopPropagation :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafePreventDefault :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeEventKey :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) String)

foreign import unsafeEventKeyCode :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) Int)

foreign import unsafeEventNumberProp :: forall eff. String -> DOMEvent -> (Eff (dom :: DOM | eff) Int)

foreign import unsafeEventStringProp :: forall eff. String -> DOMEvent -> (Eff (dom :: DOM | eff) String)

foreign import unsafeEventBooleanProp :: forall eff. String -> DOMEvent -> (Eff (dom :: DOM | eff) Boolean)

foreign import unsafeEventView :: forall eff. DOMEvent -> (Eff (dom :: DOM | eff) HTMLWindow)
