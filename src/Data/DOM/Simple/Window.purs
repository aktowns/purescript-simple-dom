module Data.DOM.Simple.Window where

import Control.Monad.Eff

import Data.DOM.Simple.Types
import Data.DOM.Simple.Unsafe.Window

class Location b where
  getLocation :: forall eff. b -> (Eff (dom :: DOM | eff) String)
  setLocation :: forall eff. String -> b -> (Eff (dom :: DOM | eff) Unit)
  search      :: forall eff. b -> (Eff (dom :: DOM | eff) String)

class Window b where
  document    :: forall eff. b -> (Eff (dom :: DOM | eff) HTMLDocument)
  location :: forall eff. b -> (Eff (dom :: DOM | eff) DOMLocation)

instance htmlWindow :: Window HTMLWindow where
  document = unsafeDocument
  location = unsafeLocation

instance domLocation :: Location DOMLocation where
  getLocation = unsafeGetLocation
  setLocation = unsafeSetLocation
  search = unsafeGetSearchLocation

foreign import globalWindow
  "var globalWindow = window;" :: HTMLWindow
