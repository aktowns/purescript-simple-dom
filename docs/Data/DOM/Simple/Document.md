## Module Data.DOM.Simple.Document

#### `Document`

``` purescript
data Document b
  = Document { title :: forall eff. b -> Eff (dom :: DOM | eff) String, setTitle :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit, body :: forall eff. b -> Eff (dom :: DOM | eff) HTMLElement, setBody :: forall eff. HTMLElement -> b -> Eff (dom :: DOM | eff) Unit, createElement :: forall eff. String -> b -> Eff (dom :: DOM | eff) HTMLElement }
```

#### `element'HTMLDocument`

``` purescript
element'HTMLDocument :: Element HTMLDocument
```

#### `document'HTMLDocument`

``` purescript
document'HTMLDocument :: Document HTMLDocument
```


