## Module Data.DOM.Simple.Unsafe.Ajax

#### `unsafeReadyState`

``` purescript
unsafeReadyState :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Int
```

#### `unsafeOnReadyStateChange`

``` purescript
unsafeOnReadyStateChange :: forall eff e. Fn2 XMLHttpRequest (Eff e Unit) (Eff (dom :: DOM | eff) Unit)
```

#### `unsafeOpen`

``` purescript
unsafeOpen :: forall eff. Fn3 XMLHttpRequest String String (Eff (dom :: DOM | eff) Unit)
```

#### `unsafeSend`

``` purescript
unsafeSend :: forall eff. Fn1 XMLHttpRequest (Eff (dom :: DOM | eff) Unit)
```

#### `unsafeSendWithPayload`

``` purescript
unsafeSendWithPayload :: forall eff a. Fn2 XMLHttpRequest a (Eff (dom :: DOM | eff) Unit)
```

#### `unsafeSetResponseType`

``` purescript
unsafeSetResponseType :: forall eff. Fn2 XMLHttpRequest String (Eff (dom :: DOM | eff) Unit)
```

#### `unsafeResponseType`

``` purescript
unsafeResponseType :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String
```

#### `unsafeResponse`

``` purescript
unsafeResponse :: forall eff a. XMLHttpRequest -> Eff (dom :: DOM | eff) a
```

#### `unsafeGetResponseHeader`

``` purescript
unsafeGetResponseHeader :: forall eff a. Fn2 XMLHttpRequest String (Eff (dom :: DOM | eff) String)
```


