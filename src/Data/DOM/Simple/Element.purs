module Data.DOM.Simple.Element where

import Prelude

import Control.Monad.Eff
import DOM
import DOM.Node.Types (NodeList())
import DOM.HTML.Types (HTMLElement(), Window())

import           Data.DOM.Simple.Unsafe.Utils (ensure, showImpl)
import qualified Data.DOM.Simple.Unsafe.Element as SUE

import Data.Foldable(for_)
import Data.Maybe
import qualified Data.Array as A
import qualified Data.Tuple as T

data Element b = Element {
   getElementById         :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  ,getElementsByClassName :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) (Array HTMLElement))
  ,getElementsByName      :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) (Array HTMLElement))
  ,querySelector          :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  ,querySelectorAll       :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) NodeList)
  ,getAttribute           :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) String)
  ,setAttribute           :: forall eff. String -> String      -> b     -> (Eff (dom :: DOM | eff) Unit)
  ,hasAttribute           :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Boolean)
  ,removeAttribute        :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,getStyleAttr           :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) String)
  ,setStyleAttr           :: forall eff. String -> String      -> b     -> (Eff (dom :: DOM | eff) Unit)
  ,children               :: forall eff. b      ->                         (Eff (dom :: DOM | eff) (Array HTMLElement))
  ,appendChild            :: forall eff. b      -> HTMLElement ->          (Eff (dom :: DOM | eff) Unit)
  ,innerHTML              :: forall eff. b      ->                         (Eff (dom :: DOM | eff) String)
  ,setInnerHTML           :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,textContent            :: forall eff. b      ->                         (Eff (dom :: DOM | eff) String)
  ,setTextContent         :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,value                  :: forall eff. b      ->                         (Eff (dom :: DOM | eff) String)
  ,setValue               :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,contentWindow          :: forall eff. b      ->                         (Eff (dom :: DOM | eff) Window)
  ,classRemove            :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,classAdd               :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,classToggle            :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Unit)
  ,classContains          :: forall eff. String -> b           ->          (Eff (dom :: DOM | eff) Boolean)
  ,offsetParent           :: forall eff. b      ->                         (Eff (dom :: DOM | eff) (Maybe HTMLElement))
  ,offsetHeight           :: forall eff. b      ->                         (Eff (dom :: DOM | eff) Int)
  ,offsetWidth            :: forall eff. b      ->                         (Eff (dom :: DOM | eff) Int)
  ,offsetTop              :: forall eff. b      ->                         (Eff (dom :: DOM | eff) Int)
  ,offsetLeft             :: forall eff. b      ->                         (Eff (dom :: DOM | eff) Int)
}

element'HTMLElement :: Element HTMLElement
element'HTMLElement = Element {
   getElementById          : \id el -> (SUE.unsafeGetElementById id el) >>= (ensure >>> return)
  ,getElementsByClassName  : SUE.unsafeGetElementsByClassName
  ,getElementsByName       : SUE.unsafeGetElementsByName
  ,querySelector           : \sel el -> (SUE.unsafeQuerySelector sel el) >>= (ensure >>> return)
  ,querySelectorAll        : SUE.unsafeQuerySelectorAll
  ,getAttribute            : SUE.unsafeGetAttribute
  ,setAttribute            : SUE.unsafeSetAttribute
  ,hasAttribute            : SUE.unsafeHasAttribute
  ,removeAttribute         : SUE.unsafeRemoveAttribute
  ,getStyleAttr            : SUE.unsafeGetStyleAttr
  ,setStyleAttr            : SUE.unsafeSetStyleAttr
  ,children                : SUE.unsafeChildren
  ,appendChild             : SUE.unsafeAppendChild
  ,innerHTML               : SUE.unsafeInnerHTML
  ,setInnerHTML            : SUE.unsafeSetInnerHTML
  ,textContent             : SUE.unsafeTextContent
  ,setTextContent          : SUE.unsafeSetTextContent
  ,value                   : SUE.unsafeValue
  ,setValue                : SUE.unsafeSetValue
  ,contentWindow           : SUE.unsafeContentWindow
  ,classRemove             : SUE.unsafeClassRemove
  ,classAdd                : SUE.unsafeClassAdd
  ,classToggle             : SUE.unsafeClassToggle
  ,classContains           : SUE.unsafeClassContains
  ,offsetParent            : \el -> (SUE.unsafeOffsetParent el) >>= (ensure >>> return)
  ,offsetHeight            : SUE.unsafeOffsetHeight
  ,offsetWidth             : SUE.unsafeOffsetWidth
  ,offsetTop               : SUE.unsafeOffsetTop
  ,offsetLeft              : SUE.unsafeOffsetLeft
}

{--
instance showHtmlElement :: Show HTMLElement where
  show = showImpl
--}

type ManySetter eff a = Array (T.Tuple String String) ->
                        a ->
                        (Eff (dom :: DOM | eff) Unit)

setAttributes :: forall eff a. Element a -> (ManySetter eff a)
setAttributes (Element { setAttribute = f }) xs y = for_ xs $ \kv -> f (T.fst kv) (T.snd kv) y

setStyleAttrs :: forall eff a. Element a -> (ManySetter eff a)
setStyleAttrs (Element { setStyleAttr = f }) xs y = for_ xs $ \kv -> f (T.fst kv) (T.snd kv) y

{--
setMany :: forall ineff a. (String -> String -> a -> (Eff (dom :: DOM | eff) Unit)) ->
                         Array (T.Tuple String String) ->
                         a ->
                         (Eff (dom :: DOM | eff) Unit)
setMany f xs y = for_ xs $ \kv -> f (T.fst kv) (T.snd kv) y
                         --}

click :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
click = SUE.unsafeClick

focus :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
focus = SUE.unsafeFocus

blur :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
blur = SUE.unsafeBlur
