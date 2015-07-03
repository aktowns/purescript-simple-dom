## Module Data.DOM.Simple.Encode

#### `encodeURIComponent`

``` purescript
encodeURIComponent :: String -> String
```

#### `decodeURIComponent`

``` purescript
decodeURIComponent :: String -> String
```

#### `encodeURI`

``` purescript
encodeURI :: String -> String
```

#### `decodeURI`

``` purescript
decodeURI :: String -> String
```

#### `paramatize`

``` purescript
paramatize :: forall a. a -> String
```

Given an object, convert it into URL parameters.

#### `toJsonString`

``` purescript
toJsonString :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

Given an object, convert it into a JSON string


