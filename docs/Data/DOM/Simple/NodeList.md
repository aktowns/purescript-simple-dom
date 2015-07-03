## Module Data.DOM.Simple.NodeList

#### `NodeListInst`

``` purescript
class NodeListInst b where
  length :: forall eff. b -> Eff (dom :: DOM | eff) Int
  item :: forall eff. Int -> b -> Eff (dom :: DOM | eff) (Maybe HTMLElement)
```

##### Instances
``` purescript
instance nodeList :: NodeListInst NodeList
```

#### `nodeListToArray`

``` purescript
nodeListToArray :: forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
```

#### `nodeListToArray'`

``` purescript
nodeListToArray' :: forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
```


