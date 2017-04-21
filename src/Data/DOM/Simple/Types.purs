module Data.DOM.Simple.Types where

import Control.Monad.Eff

foreign import data HTMLWindow        :: Type
foreign import data XMLHttpRequest    :: Type
foreign import data DOMNavigator      :: Type
foreign import data DOMEvent          :: Type
foreign import data DOMLocation       :: Type
foreign import data JavascriptContext :: Type
foreign import data Timeout           :: Type
