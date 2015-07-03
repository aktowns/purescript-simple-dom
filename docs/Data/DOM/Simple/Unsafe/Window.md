## Module Data.DOM.Simple.Unsafe.Window

#### `unsafeDocument`

``` purescript
unsafeDocument :: forall eff a. a -> Eff (dom :: DOM | eff) HTMLDocument
```

#### `unsafeNavigator`

``` purescript
unsafeNavigator :: forall eff a. a -> Eff (dom :: DOM | eff) DOMNavigator
```

#### `unsafeLocation`

``` purescript
unsafeLocation :: forall eff a. a -> Eff (dom :: DOM | eff) DOMLocation
```

#### `unsafeGetLocation`

``` purescript
unsafeGetLocation :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetLocation`

``` purescript
unsafeSetLocation :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeGetSearchLocation`

``` purescript
unsafeGetSearchLocation :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetTimeout`

``` purescript
unsafeSetTimeout :: forall eff b. b -> Number -> Eff (dom :: DOM | eff) Unit -> Eff (dom :: DOM | eff) Timeout
```

#### `unsafeSetInterval`

``` purescript
unsafeSetInterval :: forall eff b. b -> Number -> Eff (dom :: DOM | eff) Unit -> Eff (dom :: DOM | eff) Timeout
```

#### `unsafeClearTimeout`

``` purescript
unsafeClearTimeout :: forall eff b. b -> Timeout -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeInnerWidth`

``` purescript
unsafeInnerWidth :: forall eff b. b -> Eff (dom :: DOM | eff) Number
```

#### `unsafeInnerHeight`

``` purescript
unsafeInnerHeight :: forall eff b. b -> Eff (dom :: DOM | eff) Number
```


