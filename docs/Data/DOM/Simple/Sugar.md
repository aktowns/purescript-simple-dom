## Module Data.DOM.Simple.Sugar

#### `DOMArrows`

``` purescript
class DOMArrows b where
  (#<-) :: forall eff. b -> Tuple String String -> Eff (dom :: DOM | eff) Unit
  (<-#) :: forall eff. b -> String -> Eff (dom :: DOM | eff) String
  (<-?) :: forall eff. b -> String -> Eff (dom :: DOM | eff) (Maybe HTMLElement)
  (%<-) :: forall eff. b -> String -> Eff (dom :: DOM | eff) Unit
  (@<-) :: forall eff. b -> String -> Eff (dom :: DOM | eff) Unit
```

##### Instances
``` purescript
instance arrowsHTMLElement :: (Element a) => DOMArrows a
instance arrowsEffHTMLElement :: (Element a) => DOMArrows (Eff eff a)
instance arrowsMaybeHTMLElement :: (Element a) => DOMArrows (Maybe a)
```


