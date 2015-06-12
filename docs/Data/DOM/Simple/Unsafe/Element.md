## Module Data.DOM.Simple.Unsafe.Element

#### `unsafeGetElementById`

``` purescript
unsafeGetElementById :: forall eff a. String -> a -> Eff (dom :: DOM | eff) HTMLElement
```

#### `unsafeGetElementsByClassName`

``` purescript
unsafeGetElementsByClassName :: forall eff a. String -> a -> Eff (dom :: DOM | eff) (Array HTMLElement)
```

#### `unsafeGetElementsByName`

``` purescript
unsafeGetElementsByName :: forall eff a. String -> a -> Eff (dom :: DOM | eff) (Array HTMLElement)
```

#### `unsafeQuerySelector`

``` purescript
unsafeQuerySelector :: forall eff a. String -> a -> Eff (dom :: DOM | eff) HTMLElement
```

#### `unsafeQuerySelectorAll`

``` purescript
unsafeQuerySelectorAll :: forall eff a. String -> a -> Eff (dom :: DOM | eff) NodeList
```

#### `unsafeGetAttribute`

``` purescript
unsafeGetAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetAttribute`

``` purescript
unsafeSetAttribute :: forall eff a. String -> String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeHasAttribute`

``` purescript
unsafeHasAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Boolean
```

#### `unsafeRemoveAttribute`

``` purescript
unsafeRemoveAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeGetStyleAttr`

``` purescript
unsafeGetStyleAttr :: forall eff a. String -> a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetStyleAttr`

``` purescript
unsafeSetStyleAttr :: forall eff a. String -> String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeChildren`

``` purescript
unsafeChildren :: forall eff a. a -> Eff (dom :: DOM | eff) (Array HTMLElement)
```

#### `unsafeAppendChild`

``` purescript
unsafeAppendChild :: forall eff a. a -> HTMLElement -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeInnerHTML`

``` purescript
unsafeInnerHTML :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetInnerHTML`

``` purescript
unsafeSetInnerHTML :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeTextContent`

``` purescript
unsafeTextContent :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetTextContent`

``` purescript
unsafeSetTextContent :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeValue`

``` purescript
unsafeValue :: forall eff a. a -> Eff (dom :: DOM | eff) String
```

#### `unsafeSetValue`

``` purescript
unsafeSetValue :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeContentWindow`

``` purescript
unsafeContentWindow :: forall eff a. a -> Eff (dom :: DOM | eff) HTMLWindow
```

#### `unsafeClassAdd`

``` purescript
unsafeClassAdd :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeClassRemove`

``` purescript
unsafeClassRemove :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeClassToggle`

``` purescript
unsafeClassToggle :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeClassContains`

``` purescript
unsafeClassContains :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Boolean
```

#### `unsafeClick`

``` purescript
unsafeClick :: forall eff a. a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeFocus`

``` purescript
unsafeFocus :: forall eff a. a -> Eff (dom :: DOM | eff) Unit
```

#### `unsafeBlur`

``` purescript
unsafeBlur :: forall eff a. a -> Eff (dom :: DOM | eff) Unit
```


