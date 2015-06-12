## Module Data.DOM.Simple.Unsafe.Events

#### `unsafeAddEventListener`

``` purescript
unsafeAddEventListener :: forall eff t e b. String -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeRemoveEventListener`

``` purescript
unsafeRemoveEventListener :: forall eff t e b. String -> (e -> Eff (dom :: DOM | t) Unit) -> b -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeEventTarget`

``` purescript
unsafeEventTarget :: forall eff a. DOMEvent -> Eff (dom :: DOM | eff) a
```

#### `unsafeStopPropagation`

``` purescript
unsafeStopPropagation :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) Unit
```

#### `unsafePreventDefault`

``` purescript
unsafePreventDefault :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeEventKey`

``` purescript
unsafeEventKey :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) String
```

#### `unsafeEventKeyCode`

``` purescript
unsafeEventKeyCode :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) Int
```

#### `unsafeEventNumberProp`

``` purescript
unsafeEventNumberProp :: forall eff. String -> DOMEvent -> Eff (dom :: DOM | eff) Int
```

#### `unsafeEventStringProp`

``` purescript
unsafeEventStringProp :: forall eff. String -> DOMEvent -> Eff (dom :: DOM | eff) String
```

#### `unsafeEventBooleanProp`

``` purescript
unsafeEventBooleanProp :: forall eff. String -> DOMEvent -> Eff (dom :: DOM | eff) Boolean
```

#### `unsafeEventView`

``` purescript
unsafeEventView :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) HTMLWindow
```


