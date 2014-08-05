# Module Documentation

## Module Data.DOM.Simple.Ajax

### Types

    data XMLHttpRequest :: *


### Values

    makeXMLHttpRequest :: forall eff. Eff (dom :: DOM | eff) XMLHttpRequest

    open :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    send :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Unit


## Module Data.DOM.Simple.Element

### Types

    data DOM :: !

    data HTMLElement :: *

    data HTMLWindow :: *


### Values

    contentWindow :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) HTMLWindow

    getAttribute :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) String

    getDocument :: forall eff. HTMLWindow -> Eff (dom :: DOM | eff) HTMLElement

    getElementById :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) HTMLElement

    getElementsByClassName :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) [HTMLElement]

    getElementsByName :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) [HTMLElement]

    globalWindow :: HTMLWindow

    hasAttribute :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) Boolean

    innerHTML :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) String

    innerText :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) String

    querySelector :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) HTMLElement

    querySelectorAll :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) [HTMLElement]

    setAttribute :: forall eff. String -> String -> HTMLElement -> Eff (dom :: DOM | eff) Unit

    setInnerHTML :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) Unit

    setInnerText :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) Unit


## Module Data.DOM.Simple.Encode

### Values

    decodeURI :: String -> String

    decodeURIComponent :: String -> String

    encodeURI :: String -> String

    encodeURIComponent :: String -> String

    paramatize :: forall a. a -> String

    toJsonString :: forall eff a. a -> Eff (dom :: DOM | eff) String


## Module Data.DOM.Simple.Events

### Values

    addEventListener :: forall eff reff a b. String -> Eff (dom :: DOM | reff) a -> HTMLElement -> Eff (dom :: DOM | eff) b

    ready :: forall eff a b. Eff (dom :: DOM | eff) a -> Eff (dom :: DOM | eff) b

    removeEventListener :: forall eff reff a b. String -> Eff (dom :: DOM | reff) a -> HTMLElement -> Eff (dom :: DOM | eff) b