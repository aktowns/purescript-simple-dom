## Module Data.DOM.Simple.Events

#### `Read`

``` purescript
class Read s where
  read :: String -> s
```

##### Instances
``` purescript
instance mouseEventTypeRead :: Read MouseEventType
instance keyboardEventTypeRead :: Read KeyboardEventType
instance uiEventTypeRead :: Read UIEventType
```

#### `Event`

``` purescript
class Event e where
  eventTarget :: forall eff a. e -> Eff (dom :: DOM | eff) a
  stopPropagation :: forall eff. e -> Eff (dom :: DOM | eff) Unit
  preventDefault :: forall eff. e -> Eff (dom :: DOM | eff) Unit
```

##### Instances
``` purescript
instance eventDOMEvent :: Event DOMEvent
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
```

##### Instances
``` purescript
instance mouseEventTypeShow :: Show MouseEventType
instance mouseEventTypeRead :: Read MouseEventType
```

#### `MouseEvent`

``` purescript
class (Event e) <= MouseEvent e where
  mouseEventType :: forall eff. e -> Eff (dom :: DOM | eff) MouseEventType
  screenX :: forall eff. e -> Eff (dom :: DOM | eff) Int
  screenY :: forall eff. e -> Eff (dom :: DOM | eff) Int
```

##### Instances
``` purescript
instance mouseEventDOMEvent :: MouseEvent DOMEvent
```

#### `MouseEventTarget`

``` purescript
class MouseEventTarget b where
  addMouseEventListener :: forall e t ta. (MouseEvent e) => MouseEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
  removeMouseEventListener :: forall e t ta. (MouseEvent e) => MouseEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
```

##### Instances
``` purescript
instance mouseEventTargetHTMLWindow :: MouseEventTarget HTMLWindow
instance mouseEventTargetHTMLDocument :: MouseEventTarget HTMLDocument
instance mouseEventTargetHTMLElement :: MouseEventTarget HTMLElement
```

#### `KeyboardEventType`

``` purescript
data KeyboardEventType
  = KeydownEvent
  | KeypressEvent
  | KeyupEvent
```

##### Instances
``` purescript
instance keyboardEventTypeShow :: Show KeyboardEventType
instance keyboardEventTypeRead :: Read KeyboardEventType
```

#### `KeyLocation`

``` purescript
data KeyLocation
  = KeyLocationStandard
  | KeyLocationLeft
  | KeyLocationRight
  | KeyLocationNumpad
```

#### `toKeyLocation`

``` purescript
toKeyLocation :: Int -> KeyLocation
```

#### `KeyboardEvent`

``` purescript
class (Event e) <= KeyboardEvent e where
  keyboardEventType :: forall eff. e -> Eff (dom :: DOM | eff) KeyboardEventType
  key :: forall eff. e -> Eff (dom :: DOM | eff) String
  keyCode :: forall eff. e -> Eff (dom :: DOM | eff) Int
  keyLocation :: forall eff. e -> Eff (dom :: DOM | eff) KeyLocation
  altKey :: forall eff. e -> Eff (dom :: DOM | eff) Boolean
  ctrlKey :: forall eff. e -> Eff (dom :: DOM | eff) Boolean
  metaKey :: forall eff. e -> Eff (dom :: DOM | eff) Boolean
  shiftKey :: forall eff. e -> Eff (dom :: DOM | eff) Boolean
```

##### Instances
``` purescript
instance keyboardEventDOMEvent :: KeyboardEvent DOMEvent
```

#### `KeyboardEventTarget`

``` purescript
class KeyboardEventTarget b where
  addKeyboardEventListener :: forall e t ta. (KeyboardEvent e) => KeyboardEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
  removeKeyboardEventListener :: forall e t ta. (KeyboardEvent e) => KeyboardEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
```

##### Instances
``` purescript
instance keyboardEventTargetHTMLWindow :: KeyboardEventTarget HTMLWindow
instance keyboardEventTargetHTMLDocument :: KeyboardEventTarget HTMLDocument
instance keyboardEventTargetHTMLElement :: KeyboardEventTarget HTMLElement
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
```

##### Instances
``` purescript
instance uiEventTypeShow :: Show UIEventType
instance uiEventTypeRead :: Read UIEventType
```

#### `UIEvent`

``` purescript
class (Event e) <= UIEvent e where
  view :: forall eff. e -> Eff (dom :: DOM | eff) HTMLWindow
  detail :: forall eff. e -> Eff (dom :: DOM | eff) Int
```

##### Instances
``` purescript
instance uiEventDOMEvent :: UIEvent DOMEvent
```

#### `UIEventTarget`

``` purescript
class UIEventTarget b where
  addUIEventListener :: forall e t ta. (UIEvent e) => UIEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
  removeUIEventListener :: forall e t ta. (UIEvent e) => UIEventType -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | ta) Unit
```

##### Instances
``` purescript
instance uiEventTargetHTMLWindow :: UIEventTarget HTMLWindow
```


