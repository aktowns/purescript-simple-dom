# Module Documentation

## Module Data.DOM.Simple.Ajax

### Types

    data XMLHttpRequest :: *


### Values

    makeXMLHttpRequest :: forall eff. Eff (dom :: DOM | eff) XMLHttpRequest

    open :: forall eff. String -> String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    responseText :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String

    send :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    sendWithPayload :: forall eff a. a -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    setRequestHeader :: forall eff. String -> String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit


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

    removeAttribute :: forall eff. String -> HTMLElement -> Eff (dom :: DOM | eff) Unit

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

### Types

    data DOMEvent :: *

    data JavascriptContext :: *


### Type Classes

    class EventTarget b where
      addEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit
      removeEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit


### Type Class Instances

    instance eventTargetHTMLElement :: EventTarget HTMLElement

    instance eventTargetHTMLWindow :: EventTarget HTMLWindow

    instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest


### Values

    eventTarget :: forall t a. DOMEvent -> Eff (dom :: DOM | t) a

    preventDefault :: forall t. DOMEvent -> Eff (dom :: DOM | t) Unit

    ready :: forall t ta. Eff (dom :: DOM | t) Unit -> Eff (dom :: DOM | ta) Unit

    unsafeAddEventListener :: forall t ta a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit

    unsafeRemoveEventListener :: forall t ta a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit