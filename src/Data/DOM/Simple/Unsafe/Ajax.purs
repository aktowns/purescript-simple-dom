module Data.DOM.Simple.Unsafe.Ajax where

import Prelude

import DOM
import Control.Monad.Eff
import Data.Function

import Data.DOM.Simple.Types

foreign import unsafeReadyState :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Int

foreign import unsafeOnReadyStateChange :: forall eff e. Fn2 XMLHttpRequest (Eff e Unit) (Eff (dom :: DOM | eff) Unit)

foreign import unsafeOpen :: forall eff. Fn3 XMLHttpRequest String String (Eff (dom :: DOM | eff) Unit)

foreign import unsafeSend :: forall eff. Fn1 XMLHttpRequest (Eff (dom :: DOM | eff) Unit)

foreign import unsafeSendWithPayload :: forall eff a. Fn2 XMLHttpRequest a (Eff (dom :: DOM | eff) Unit)

foreign import unsafeSetResponseType :: forall eff. Fn2 XMLHttpRequest String (Eff (dom :: DOM | eff) Unit)

foreign import unsafeResponseType :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String

foreign import unsafeResponse :: forall eff a. XMLHttpRequest -> Eff (dom :: DOM | eff) a

foreign import unsafeGetResponseHeader :: forall eff a. Fn2 XMLHttpRequest String (Eff (dom :: DOM | eff) String)
