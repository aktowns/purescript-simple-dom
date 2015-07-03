## Module Data.DOM.Simple.Unsafe.Document

#### `unsafeTitle`

``` purescript
unsafeTitle :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetTitle`

``` purescript
unsafeSetTitle :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeBody`

``` purescript
unsafeBody :: forall eff a. a -> Eff (dom :: DOM | eff) HTMLElement
```

#### `unsafeSetBody`

``` purescript
unsafeSetBody :: forall eff a. HTMLElement -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeCreateElement`

``` purescript
unsafeCreateElement :: forall eff a. String -> a -> Eff (dom :: DOM | eff) HTMLElement
```


