module Data.DOM.Simple.Events where

import Prelude

import Control.Monad
import Control.Monad.Eff
import DOM
import DOM.HTML.Types (Window(), HTMLElement(), HTMLDocument())

import Data.DOM.Simple.Ajax
import Data.DOM.Simple.Types (DOMEvent())
import Data.DOM.Simple.Unsafe.Events
import Data.DOM.Simple.Window(document, globalWindow)

-- XXX Should this be in the Prelude?
class Read s where
  read :: String -> s

{- Generic properties and methods available on all events. -}

class Event e where
  eventTarget     :: forall eff a. e -> (Eff (dom :: DOM | eff) a)
  stopPropagation :: forall eff. e -> (Eff (dom :: DOM | eff) Unit)
  preventDefault  :: forall eff. e -> (Eff (dom :: DOM | eff) Unit)

instance eventDOMEvent :: Event DOMEvent where
  eventTarget     = unsafeEventTarget
  stopPropagation = unsafeStopPropagation
  preventDefault  = unsafePreventDefault

{- Mouse Events -}

data MouseEventType = MouseMoveEvent | MouseOverEvent | MouseEnterEvent
                    | MouseOutEvent | MouseLeaveEvent | MouseClickEvent
                    | MouseDblClickEvent | MouseUpEvent | MouseDownEvent

instance mouseEventTypeShow :: Show MouseEventType where
  show MouseMoveEvent     = "mousemove"
  show MouseOverEvent     = "mouseover"
  show MouseEnterEvent    = "mouseenter"
  show MouseOutEvent      = "mouseout"
  show MouseLeaveEvent    = "mouseleave"
  show MouseClickEvent    = "click"
  show MouseDblClickEvent = "dblclick"
  show MouseUpEvent       = "mouseup"
  show MouseDownEvent     = "mousedown"

instance mouseEventTypeRead :: Read MouseEventType where
  read "mousemove"  = MouseMoveEvent
  read "mouseover"  = MouseOverEvent
  read "mouseenter" = MouseEnterEvent
  read "mouseout"   = MouseOutEvent
  read "mouseleave" = MouseLeaveEvent
  read "click"      = MouseClickEvent
  read "dblclick"   = MouseDblClickEvent
  read "mouseup"    = MouseUpEvent
  read "mousedown"  = MouseDownEvent

class (Event e) <= MouseEvent e where
  mouseEventType :: forall eff. e -> (Eff (dom :: DOM | eff) MouseEventType)
  screenX :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  screenY :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  clientX :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  clientY :: forall eff. e -> (Eff (dom :: DOM | eff) Int)

instance mouseEventDOMEvent :: MouseEvent DOMEvent where
  mouseEventType ev = read <$> unsafeEventStringProp "type" ev
  screenX = unsafeEventNumberProp "screenX"
  screenY = unsafeEventNumberProp "screenY"
  clientX = unsafeEventNumberProp "clientX"
  clientY = unsafeEventNumberProp "clientY"

class MouseEventTarget b where
  addMouseEventListener :: forall e t ta. (MouseEvent e) =>
                           MouseEventType
                               -> (e -> Eff (dom :: DOM | t) Unit)
                               -> b
                               -> (Eff (dom :: DOM | ta) Unit)

  removeMouseEventListener :: forall e t ta. (MouseEvent e) =>
                              MouseEventType
                                  -> (e -> Eff (dom :: DOM | t) Unit)
                                  -> b
                                  -> (Eff (dom :: DOM | ta) Unit)

instance mouseEventTargetWindow :: MouseEventTarget Window where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)

instance mouseEventTargetHTMLDocument :: MouseEventTarget HTMLDocument where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)

instance mouseEventTargetHTMLElement :: MouseEventTarget HTMLElement where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)


{- Keyboard Events -}

data KeyboardEventType = KeydownEvent | KeypressEvent | KeyupEvent

instance keyboardEventTypeShow :: Show KeyboardEventType where
  show KeydownEvent     = "keydown"
  show KeypressEvent       = "keypress"
  show KeyupEvent       = "keyup"

instance keyboardEventTypeRead :: Read KeyboardEventType where
  read "keydown"  = KeydownEvent
  read "keypress" = KeypressEvent
  read "keyup"    = KeyupEvent

data KeyLocation = KeyLocationStandard | KeyLocationLeft | KeyLocationRight | KeyLocationNumpad

toKeyLocation :: Int -> KeyLocation
toKeyLocation 0 = KeyLocationStandard
toKeyLocation 1 = KeyLocationLeft
toKeyLocation 2 = KeyLocationRight
toKeyLocation 3 = KeyLocationNumpad

class (Event e) <= KeyboardEvent e where
  keyboardEventType :: forall eff. e -> (Eff (dom :: DOM | eff) KeyboardEventType)
  key         :: forall eff. e -> (Eff (dom :: DOM | eff) String)
  keyCode     :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  keyLocation :: forall eff. e -> (Eff (dom :: DOM | eff) KeyLocation)
  altKey      :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  ctrlKey     :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  metaKey     :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  shiftKey    :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)

instance keyboardEventDOMEvent :: KeyboardEvent DOMEvent where
  keyboardEventType ev = read <$> unsafeEventStringProp "type" ev

  key = unsafeEventKey
  keyCode = unsafeEventKeyCode

  keyLocation ev = toKeyLocation <$> unsafeEventNumberProp "keyLocation" ev

  altKey   = unsafeEventBooleanProp "altKey"
  ctrlKey  = unsafeEventBooleanProp "ctrlKey"
  metaKey  = unsafeEventBooleanProp "metaKey"
  shiftKey = unsafeEventBooleanProp "shiftKey"

class KeyboardEventTarget b where
  addKeyboardEventListener :: forall e t ta. (KeyboardEvent e) =>
                              KeyboardEventType
                                  -> (e -> Eff (dom :: DOM | t) Unit)
                                  -> b
                                  -> (Eff (dom :: DOM | ta) Unit)

  removeKeyboardEventListener :: forall e t ta. (KeyboardEvent e) =>
                                 KeyboardEventType
                                     -> (e -> Eff (dom :: DOM | t) Unit)
                                     -> b
                                     -> (Eff (dom :: DOM | ta) Unit)

instance keyboardEventTargetWindow :: KeyboardEventTarget Window where
  addKeyboardEventListener typ    = unsafeAddEventListener (show typ)
  removeKeyboardEventListener typ = unsafeRemoveEventListener (show typ)

instance keyboardEventTargetHTMLDocument :: KeyboardEventTarget HTMLDocument where
  addKeyboardEventListener typ    = unsafeAddEventListener (show typ)
  removeKeyboardEventListener typ = unsafeRemoveEventListener (show typ)

instance keyboardEventTargetHTMLElement :: KeyboardEventTarget HTMLElement where
  addKeyboardEventListener typ    = unsafeAddEventListener (show typ)
  removeKeyboardEventListener typ = unsafeRemoveEventListener (show typ)

{- UI Events -}

-- XXX this is slightly ham-handed, since
-- <http://www.w3.org/TR/DOM-Level-3-Events/#interface-UIEvent>
-- specifies that only some kinds of elements are valid targets for
-- each of these events.  Might make to refactor more carefully based
-- on what targets can accept what handlers.

data UIEventType = LoadEvent | UnloadEvent | AbortEvent
                 | ErrorEvent | SelectEvent | ResizeEvent
                 | ScrollEvent

instance uiEventTypeShow :: Show UIEventType where
  show LoadEvent    = "load"
  show UnloadEvent  = "unload"
  show AbortEvent   = "abort"
  show ErrorEvent   = "error"
  show SelectEvent  = "select"
  show ResizeEvent  = "resize"
  show ScrollEvent  = "scroll"

instance uiEventTypeRead :: Read UIEventType where
  read "load"     = LoadEvent
  read "unload"   = UnloadEvent
  read "abort"    = AbortEvent
  read "error"    = ErrorEvent
  read "select"   = SelectEvent
  read "resize"   = ResizeEvent
  read "scroll"   = ScrollEvent

class (Event e) <= UIEvent e where
  -- XXX this should really be returning an HTMLAbstractView...
  view   :: forall eff. e -> (Eff (dom :: DOM | eff) Window)
  detail :: forall eff. e -> (Eff (dom :: DOM | eff) Int)

instance uiEventDOMEvent :: UIEvent DOMEvent where
  view   = unsafeEventView
  detail = unsafeEventNumberProp "detail"

class UIEventTarget b where
  addUIEventListener :: forall e t ta. (UIEvent e) =>
                        UIEventType
                            -> (e -> Eff (dom :: DOM | t) Unit)
                            -> b
                            -> (Eff (dom :: DOM | ta) Unit)

  removeUIEventListener :: forall e t ta. (UIEvent e) =>
                           UIEventType
                               -> (e -> Eff (dom :: DOM | t) Unit)
                               -> b
                               -> (Eff (dom :: DOM | ta) Unit)

instance uiEventTargetWindow :: UIEventTarget Window where
  addUIEventListener typ    = unsafeAddEventListener (show typ)
  removeUIEventListener typ = unsafeRemoveEventListener (show typ)

{-
instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener
-}

{-
ready :: forall t ta. (Eff (dom :: DOM | t) Unit) -> (Eff (dom :: DOM | ta) Unit)
ready cb = document globalWindow >>= (addEventListener "DOMContentLoaded" $ \_ -> cb)
-}
