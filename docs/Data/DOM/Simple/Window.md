## Module Data.DOM.Simple.Window

#### `Location`

``` purescript
class Location b where
  getLocation :: forall eff. b -> Eff (dom :: DOM | eff) String
  setLocation :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  search :: forall eff. b -> Eff (dom :: DOM | eff) String
```

##### Instances
``` purescript
instance domLocation :: Location DOMLocation
```

#### `Window`

``` purescript
class Window b where
  document :: forall eff. b -> Eff (dom :: DOM | eff) HTMLDocument
  navigator :: forall eff. b -> Eff (dom :: DOM | eff) DOMNavigator
  location :: forall eff. b -> Eff (dom :: DOM | eff) DOMLocation
  setTimeout :: forall eff. b -> Number -> Eff (dom :: DOM | eff) Unit -> Eff (dom :: DOM | eff) Timeout
  setInterval :: forall eff. b -> Number -> Eff (dom :: DOM | eff) Unit -> Eff (dom :: DOM | eff) Timeout
  clearTimeout :: forall eff. b -> Timeout -> Eff (dom :: DOM | eff) Unit
  innerWidth :: forall eff. b -> Eff (dom :: DOM | eff) Number
  innerHeight :: forall eff. b -> Eff (dom :: DOM | eff) Number
```

##### Instances
``` purescript
instance htmlWindow :: Window HTMLWindow
```

#### `globalWindow`

``` purescript
globalWindow :: HTMLWindow
```

#### `getLocationValue`

``` purescript
getLocationValue :: String -> String -> Maybe String
```


