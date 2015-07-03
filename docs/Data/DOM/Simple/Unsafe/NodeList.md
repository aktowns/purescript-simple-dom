## Module Data.DOM.Simple.Unsafe.NodeList

#### `unsafeNodeListLength`

``` purescript
unsafeNodeListLength :: forall eff. NodeList -> Eff (dom :: DOM | eff) Int
```

#### `unsafeNodeListItem`

``` purescript
unsafeNodeListItem :: forall eff. Int -> NodeList -> Eff (dom :: DOM | eff) HTMLElement
```

#### `unsafeNodeListToArray`

``` purescript
unsafeNodeListToArray :: forall eff. NodeList -> Eff (dom :: DOM | eff) (Array HTMLElement)
```


