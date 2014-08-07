module Data.DOM.Simple.Window where

import Control.Monad.Eff

import Data.DOM.Simple.Types
import Data.DOM.Simple.Unsafe.Window

class Window b where
  document :: forall eff. b -> (Eff (dom :: DOM | eff) HTMLDocument)

instance htmlWindow :: Window HTMLWindow where
  document = unsafeDocument

foreign import globalWindow
  "var globalWindow = window;" :: HTMLWindow
