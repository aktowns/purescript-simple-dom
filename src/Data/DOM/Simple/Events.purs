module Data.DOM.Simple.Events where

import Prelude (class Show, Unit, show, (<$>), (<>))

import Control.Monad.Eff (Eff)

import Data.DOM.Simple.Types (DOMEvent, HTMLWindow, XMLHttpRequest)
import Data.DOM.Simple.Unsafe.Events (unsafeAddEventListener, unsafeEventBooleanProp, unsafeEventKey, unsafeEventKeyCode, unsafeEventNumberProp, unsafeEventProp, unsafeEventStringProp, unsafeEventTarget, unsafeEventView, unsafePreventDefault, unsafeRemoveEventListener, unsafeStopPropagation)
import Data.DOM.Simple.Unsafe.Element (HTMLElement)
import Data.DOM.Simple.Document (HTMLDocument)
import DOM (DOM)

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
                    | MouseUnknownEvent String

instance mouseEventTypeShow :: Show MouseEventType where
  show MouseMoveEvent        = "mousemove"
  show MouseOverEvent        = "mouseover"
  show MouseEnterEvent       = "mouseenter"
  show MouseOutEvent         = "mouseout"
  show MouseLeaveEvent       = "mouseleave"
  show MouseClickEvent       = "click"
  show MouseDblClickEvent    = "dblclick"
  show MouseUpEvent          = "mouseup"
  show MouseDownEvent        = "mousedown"
  show (MouseUnknownEvent x) = "unknown event: " <> x

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
  read x            = MouseUnknownEvent x

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

instance mouseEventTargetHTMLWindow :: MouseEventTarget HTMLWindow where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)

instance mouseEventTargetHTMLDocument :: MouseEventTarget HTMLDocument where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)

instance mouseEventTargetHTMLElement :: MouseEventTarget HTMLElement where
  addMouseEventListener typ    = unsafeAddEventListener (show typ)
  removeMouseEventListener typ = unsafeRemoveEventListener (show typ)


{- Keyboard Events -}

data KeyboardEventType = KeydownEvent | KeypressEvent | KeyupEvent | KeyUnknownEvent String

instance keyboardEventTypeShow :: Show KeyboardEventType where
  show KeydownEvent        = "keydown"
  show KeypressEvent       = "keypress"
  show KeyupEvent          = "keyup"
  show (KeyUnknownEvent x) = "unknown key event:" <> x

instance keyboardEventTypeRead :: Read KeyboardEventType where
  read "keydown"  = KeydownEvent
  read "keypress" = KeypressEvent
  read "keyup"    = KeyupEvent
  read x          = KeyUnknownEvent x

data KeyLocation = KeyLocationStandard | KeyLocationLeft | KeyLocationRight | KeyLocationNumpad | KeyLocationUnknown Int

toKeyLocation :: Int -> KeyLocation
toKeyLocation 0 = KeyLocationStandard
toKeyLocation 1 = KeyLocationLeft
toKeyLocation 2 = KeyLocationRight
toKeyLocation 3 = KeyLocationNumpad
toKeyLocation x = KeyLocationUnknown x

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

instance keyboardEventTargetHTMLWindow :: KeyboardEventTarget HTMLWindow where
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
                 | ScrollEvent | UnknownEvent String

instance uiEventTypeShow :: Show UIEventType where
  show LoadEvent        = "load"
  show UnloadEvent      = "unload"
  show AbortEvent       = "abort"
  show ErrorEvent       = "error"
  show SelectEvent      = "select"
  show ResizeEvent      = "resize"
  show ScrollEvent      = "scroll"
  show (UnknownEvent x) = "unknown uievent:" <> x

instance uiEventTypeRead :: Read UIEventType where
  read "load"     = LoadEvent
  read "unload"   = UnloadEvent
  read "abort"    = AbortEvent
  read "error"    = ErrorEvent
  read "select"   = SelectEvent
  read "resize"   = ResizeEvent
  read "scroll"   = ScrollEvent
  read x          = UnknownEvent x

class (Event e) <= UIEvent e where
  -- XXX this should really be returning an HTMLAbstractView...
  view   :: forall eff. e -> (Eff (dom :: DOM | eff) HTMLWindow)
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

instance uiEventTargetHTMLWindow :: UIEventTarget HTMLWindow where
  addUIEventListener typ    = unsafeAddEventListener (show typ)
  removeUIEventListener typ = unsafeRemoveEventListener (show typ)

data ProgressEventType = ProgressAbortEvent
                       | ProgressErrorEvent
                       | ProgressLoadEvent
                       | ProgressLoadEndEvent
                       | ProgressLoadStartEvent
                       | ProgressProgressEvent
                       | ProgressTimeoutEvent

instance showProgressEventType :: Show ProgressEventType where
    show ProgressAbortEvent     = "abort"
    show ProgressErrorEvent     = "error"
    show ProgressLoadEvent      = "load"
    show ProgressLoadEndEvent   = "loadend"
    show ProgressLoadStartEvent = "loadstart"
    show ProgressProgressEvent  = "progress"
    show ProgressTimeoutEvent   = "timeout"

readProgressEventType :: String -> ProgressEventType
readProgressEventType "abort"     = ProgressAbortEvent
readProgressEventType "error"     = ProgressErrorEvent
readProgressEventType "load"      = ProgressLoadEvent
readProgressEventType "loadend"   = ProgressLoadEndEvent
readProgressEventType "loadstart" = ProgressLoadStartEvent
readProgressEventType "progress"  = ProgressProgressEvent
readProgressEventType "timeout"   = ProgressTimeoutEvent
readProgressEventType _           = ProgressAbortEvent

class (Event e) <= ProgressEvent e where
    progressEventType :: forall eff. e -> (Eff (dom :: DOM | eff) ProgressEventType)
    lengthComputable  :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
    loaded            :: forall eff. e -> (Eff (dom :: DOM | eff) Number)
    total             :: forall eff. e -> (Eff (dom :: DOM | eff) Number)

instance progressEventDOMEvent :: ProgressEvent DOMEvent where
    progressEventType ev = readProgressEventType <$> unsafeEventProp "type" ev
    lengthComputable     = unsafeEventProp "lengthComputable"
    loaded               = unsafeEventProp "loaded"
    total                = unsafeEventProp "total"

class ProgressEventTarget b where
    addProgressEventListener :: forall e t ta. (ProgressEvent e) =>
                                ProgressEventType
                                    -> (e -> Eff (dom :: DOM | t) Unit)
                                    -> b
                                    -> (Eff (dom :: DOM | ta) Unit)

    removeProgressEventListener :: forall e t ta. (ProgressEvent e) =>
                                   ProgressEventType
                                       -> (e -> Eff (dom :: DOM | t) Unit)
                                       -> b
                                       -> (Eff (dom :: DOM | ta) Unit)

instance progressEventTargetXMLHttpRequest :: ProgressEventTarget XMLHttpRequest where
    addProgressEventListener typ    = unsafeAddEventListener (show typ)
    removeProgressEventListener typ = unsafeRemoveEventListener (show typ)


{-
instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest where
  addEventListener = unsafeAddEventListener
  removeEventListener = unsafeRemoveEventListener
-}

{-
ready :: forall t ta. (Eff (dom :: DOM | t) Unit) -> (Eff (dom :: DOM | ta) Unit)
ready cb = document globalWindow >>= (addEventListener "DOMContentLoaded" $ \_ -> cb)
-}
