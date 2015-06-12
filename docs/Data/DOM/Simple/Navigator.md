## Module Data.DOM.Simple.Navigator

#### `Navigator`

``` purescript
class Navigator b where
  appName :: forall eff. b -> Eff (dom :: DOM | eff) String
  appVersion :: forall eff. b -> Eff (dom :: DOM | eff) String
  appCodeName :: forall eff. b -> Eff (dom :: DOM | eff) String
  language :: forall eff. b -> Eff (dom :: DOM | eff) String
  platform :: forall eff. b -> Eff (dom :: DOM | eff) String
  product :: forall eff. b -> Eff (dom :: DOM | eff) String
  userAgent :: forall eff. b -> Eff (dom :: DOM | eff) String
```

##### Instances
``` purescript
instance domNavigator :: Navigator DOMNavigator
```


