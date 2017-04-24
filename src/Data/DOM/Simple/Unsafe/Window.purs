module Data.DOM.Simple.Unsafe.Window where

import Prelude (Unit)

import DOM (DOM)
import Control.Monad.Eff (Eff)

import Data.DOM.Simple.Types (DOMLocation, DOMNavigator, Timeout)
import Data.DOM.Simple.Document (HTMLDocument)

foreign import unsafeDocument :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLDocument)

foreign import unsafeNavigator :: forall eff a. a -> (Eff (dom :: DOM | eff) DOMNavigator)

foreign import unsafeLocation :: forall eff a. a -> (Eff (dom :: DOM | eff) DOMLocation)

-- hmmm. useless re-cast?
foreign import unsafeGetLocation :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetLocation :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeGetSearchLocation :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetTimeout :: forall eff b. b -> Number -> Eff (dom :: DOM | eff) Unit -> (Eff (dom :: DOM | eff) Timeout)

foreign import unsafeSetInterval :: forall eff b. b -> Number -> Eff (dom :: DOM | eff) Unit -> (Eff (dom :: DOM | eff) Timeout)

foreign import unsafeClearTimeout :: forall eff b. b -> Timeout -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeInnerWidth :: forall eff b. b -> (Eff (dom :: DOM | eff) Number)

foreign import unsafeInnerHeight :: forall eff b. b -> (Eff (dom :: DOM | eff) Number)

foreign import unsafePageXOffset :: forall eff b. b -> (Eff (dom :: DOM | eff) Number)

foreign import unsafePageYOffset :: forall eff b. b -> (Eff (dom :: DOM | eff) Number)
