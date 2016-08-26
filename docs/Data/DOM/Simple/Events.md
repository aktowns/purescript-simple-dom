## Module Data.DOM.Simple.Events

#### `Read`

``` purescript
class Read s where
  read :: String -> s
```

##### Instances
``` purescript
Read MouseEventType
Read KeyboardEventType
Read UIEventType
```

#### `Event`

``` purescript
class Event e where
  eventTarget :: forall eff a. e -> (Eff (dom :: DOM | eff) a)
  stopPropagation :: forall eff. e -> (Eff (dom :: DOM | eff) Unit)
  preventDefault :: forall eff. e -> (Eff (dom :: DOM | eff) Unit)
```

##### Instances
``` purescript
Event DOMEvent
```

#### `MouseEventType`

``` purescript
data MouseEventType
  = MouseMoveEvent
  | MouseOverEvent
  | MouseEnterEvent
  | MouseOutEvent
  | MouseLeaveEvent
  | MouseClickEvent
  | MouseDblClickEvent
  | MouseUpEvent
  | MouseDownEvent
  | MouseUnknownEvent String
```

##### Instances
``` purescript
Show MouseEventType
Read MouseEventType
```

#### `MouseEvent`

``` purescript
class (Event e) <= MouseEvent e where
  mouseEventType :: forall eff. e -> (Eff (dom :: DOM | eff) MouseEventType)
  screenX :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  screenY :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  clientX :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  clientY :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
```

##### Instances
``` purescript
MouseEvent DOMEvent
```

#### `MouseEventTarget`

``` purescript
class MouseEventTarget b where
  addMouseEventListener :: forall e t ta. MouseEvent e => MouseEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeMouseEventListener :: forall e t ta. MouseEvent e => MouseEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
```

##### Instances
``` purescript
MouseEventTarget HTMLWindow
MouseEventTarget HTMLDocument
MouseEventTarget HTMLElement
```

#### `KeyboardEventType`

``` purescript
data KeyboardEventType
  = KeydownEvent
  | KeypressEvent
  | KeyupEvent
  | KeyUnknownEvent String
```

##### Instances
``` purescript
Show KeyboardEventType
Read KeyboardEventType
```

#### `KeyLocation`

``` purescript
data KeyLocation
  = KeyLocationStandard
  | KeyLocationLeft
  | KeyLocationRight
  | KeyLocationNumpad
  | KeyLocationUnknown Int
```

#### `toKeyLocation`

``` purescript
toKeyLocation :: Int -> KeyLocation
```

#### `KeyboardEvent`

``` purescript
class (Event e) <= KeyboardEvent e where
  keyboardEventType :: forall eff. e -> (Eff (dom :: DOM | eff) KeyboardEventType)
  key :: forall eff. e -> (Eff (dom :: DOM | eff) String)
  keyCode :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
  keyLocation :: forall eff. e -> (Eff (dom :: DOM | eff) KeyLocation)
  altKey :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  ctrlKey :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  metaKey :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  shiftKey :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
```

##### Instances
``` purescript
KeyboardEvent DOMEvent
```

#### `KeyboardEventTarget`

``` purescript
class KeyboardEventTarget b where
  addKeyboardEventListener :: forall e t ta. KeyboardEvent e => KeyboardEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeKeyboardEventListener :: forall e t ta. KeyboardEvent e => KeyboardEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
```

##### Instances
``` purescript
KeyboardEventTarget HTMLWindow
KeyboardEventTarget HTMLDocument
KeyboardEventTarget HTMLElement
```

#### `UIEventType`

``` purescript
data UIEventType
  = LoadEvent
  | UnloadEvent
  | AbortEvent
  | ErrorEvent
  | SelectEvent
  | ResizeEvent
  | ScrollEvent
  | UnknownEvent String
```

##### Instances
``` purescript
Show UIEventType
Read UIEventType
```

#### `UIEvent`

``` purescript
class (Event e) <= UIEvent e where
  view :: forall eff. e -> (Eff (dom :: DOM | eff) HTMLWindow)
  detail :: forall eff. e -> (Eff (dom :: DOM | eff) Int)
```

##### Instances
``` purescript
UIEvent DOMEvent
```

#### `UIEventTarget`

``` purescript
class UIEventTarget b where
  addUIEventListener :: forall e t ta. UIEvent e => UIEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeUIEventListener :: forall e t ta. UIEvent e => UIEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
```

##### Instances
``` purescript
UIEventTarget HTMLWindow
```

#### `ProgressEventType`

``` purescript
data ProgressEventType
  = ProgressAbortEvent
  | ProgressErrorEvent
  | ProgressLoadEvent
  | ProgressLoadEndEvent
  | ProgressLoadStartEvent
  | ProgressProgressEvent
  | ProgressTimeoutEvent
```

##### Instances
``` purescript
Show ProgressEventType
```

#### `readProgressEventType`

``` purescript
readProgressEventType :: Partial => String -> ProgressEventType
```

#### `ProgressEvent`

``` purescript
class (Event e) <= ProgressEvent e where
  progressEventType :: forall eff. e -> (Eff (dom :: DOM | eff) ProgressEventType)
  lengthComputable :: forall eff. e -> (Eff (dom :: DOM | eff) Boolean)
  loaded :: forall eff. e -> (Eff (dom :: DOM | eff) Number)
  total :: forall eff. e -> (Eff (dom :: DOM | eff) Number)
```

##### Instances
``` purescript
ProgressEvent DOMEvent
```

#### `ProgressEventTarget`

``` purescript
class ProgressEventTarget b where
  addProgressEventListener :: forall e t ta. ProgressEvent e => ProgressEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
  removeProgressEventListener :: forall e t ta. ProgressEvent e => ProgressEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> (Eff (dom :: DOM | ta) Unit)
```

##### Instances
``` purescript
ProgressEventTarget XMLHttpRequest
```


