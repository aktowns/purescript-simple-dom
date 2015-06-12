## Module Data.DOM.Simple.Element

#### `Element`

``` purescript
class Element b where
  getElementById :: forall eff. String -> b -> Eff (dom :: DOM | eff) (Maybe HTMLElement)
  getElementsByClassName :: forall eff. String -> b -> Eff (dom :: DOM | eff) (Array HTMLElement)
  getElementsByName :: forall eff. String -> b -> Eff (dom :: DOM | eff) (Array HTMLElement)
  querySelector :: forall eff. String -> b -> Eff (dom :: DOM | eff) (Maybe HTMLElement)
  querySelectorAll :: forall eff. String -> b -> Eff (dom :: DOM | eff) NodeList
  getAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) String
  setAttribute :: forall eff. String -> String -> b -> Eff (dom :: DOM | eff) Unit
  hasAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) Boolean
  removeAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  getStyleAttr :: forall eff. String -> b -> Eff (dom :: DOM | eff) String
  setStyleAttr :: forall eff. String -> String -> b -> Eff (dom :: DOM | eff) Unit
  children :: forall eff. b -> Eff (dom :: DOM | eff) (Array HTMLElement)
  appendChild :: forall eff. b -> HTMLElement -> Eff (dom :: DOM | eff) Unit
  innerHTML :: forall eff. b -> Eff (dom :: DOM | eff) String
  setInnerHTML :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  textContent :: forall eff. b -> Eff (dom :: DOM | eff) String
  setTextContent :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  value :: forall eff. b -> Eff (dom :: DOM | eff) String
  setValue :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  contentWindow :: forall eff. b -> Eff (dom :: DOM | eff) HTMLWindow
  classRemove :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  classAdd :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  classToggle :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  classContains :: forall eff. String -> b -> Eff (dom :: DOM | eff) Boolean
```

##### Instances
``` purescript
instance htmlElement :: Element HTMLElement
```

#### `setAttributes`

``` purescript
setAttributes :: forall eff a. (Element a) => Array (Tuple String String) -> a -> Eff (dom :: DOM | eff) Unit
```

#### `setStyleAttrs`

``` purescript
setStyleAttrs :: forall eff a. (Element a) => Array (Tuple String String) -> a -> Eff (dom :: DOM | eff) Unit
```

#### `click`

``` purescript
click :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
```

#### `focus`

``` purescript
focus :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
```

#### `blur`

``` purescript
blur :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) Unit
```


