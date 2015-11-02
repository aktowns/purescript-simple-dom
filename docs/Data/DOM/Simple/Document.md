## Module Data.DOM.Simple.Document

#### `HTMLDocument`

``` purescript
data HTMLDocument :: *
```

##### Instances
``` purescript
instance htmlDocumentElement :: Element HTMLDocument
instance htmlDocument :: Document HTMLDocument
instance showHtmlDocument :: Show HTMLDocument
```

#### `Document`

``` purescript
class Document b where
  title :: forall eff. b -> Eff (dom :: DOM | eff) String
  setTitle :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
  body :: forall eff. b -> Eff (dom :: DOM | eff) HTMLElement
  setBody :: forall eff. HTMLElement -> b -> Eff (dom :: DOM | eff) Unit
  createElement :: forall eff. String -> b -> Eff (dom :: DOM | eff) HTMLElement
```

##### Instances
``` purescript
instance htmlDocument :: Document HTMLDocument
```


