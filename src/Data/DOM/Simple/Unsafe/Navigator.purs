module Data.DOM.Simple.Unsafe.Navigator where

import DOM (DOM)
import Control.Monad.Eff (Eff)

import Data.DOM.Simple.Types (DOMNavigator)

foreign import unsafeAppName ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafeAppVersion ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafeAppCodeName ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafeLanguage ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafePlatform ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafeProduct ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String

foreign import unsafeUserAgent ::forall eff. DOMNavigator -> Eff (dom :: DOM | eff) String
