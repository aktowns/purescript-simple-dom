module Data.DOM.Simple.Unsafe.Element where

import Prelude

import DOM
import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeGetElementById :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeGetElementsByClassName :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) (Array HTMLElement))

foreign import unsafeGetElementsByName :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) (Array HTMLElement))

foreign import unsafeQuerySelector :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeQuerySelectorAll :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) NodeList)

foreign import unsafeGetAttribute :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetAttribute :: forall eff a. String -> String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeHasAttribute :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Boolean)

foreign import unsafeRemoveAttribute :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeGetStyleAttr :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetStyleAttr :: forall eff a. String -> String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeChildren :: forall eff a. a -> (Eff (dom :: DOM | eff) (Array HTMLElement))

foreign import unsafeAppendChild :: forall eff a. a -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeInnerHTML :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetInnerHTML :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeTextContent :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetTextContent :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeValue :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetValue :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeContentWindow :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLWindow)

foreign import unsafeClassAdd :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassRemove :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassToggle :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassContains :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Boolean)

foreign import unsafeClick :: forall eff a. a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeFocus :: forall eff a. a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeBlur :: forall eff a. a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeOffsetParent :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeOffsetHeight :: forall eff a. a -> (Eff (dom :: DOM | eff) Int)

foreign import unsafeOffsetWidth :: forall eff a. a -> (Eff (dom :: DOM | eff) Int)

foreign import unsafeOffsetTop :: forall eff a. a -> (Eff (dom :: DOM | eff) Int)

foreign import unsafeOffsetLeft :: forall eff a. a -> (Eff (dom :: DOM | eff) Int)
