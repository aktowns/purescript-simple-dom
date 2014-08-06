# Module Documentation

## Module Data.DOM.Simple.Ajax

### Values

    getAllResponseHeaders :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String

    getResponseHeader :: forall eff. String -> XMLHttpRequest -> Eff (dom :: DOM | eff) String

    makeXMLHttpRequest :: forall eff. Eff (dom :: DOM | eff) XMLHttpRequest

    open :: forall eff. String -> String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    overrideMimeType :: forall eff. String -> XMLHttpRequest -> Eff (dom :: DOM | eff) String

    responseText :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String

    send :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    sendWithPayload :: forall eff a. a -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    setRequestHeader :: forall eff. String -> String -> XMLHttpRequest -> Eff (dom :: DOM | eff) Unit

    statusText :: forall eff. XMLHttpRequest -> Eff (dom :: DOM | eff) String


## Module Data.DOM.Simple.Document

### Type Classes

    class Document b where
      title :: forall eff. b -> Eff (dom :: DOM | eff) String
      setTitle :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit


### Type Class Instances

    instance htmlDocument :: Document HTMLDocument

    instance htmlDocumentElement :: Element HTMLDocument


### Values

    getDocument :: forall eff. HTMLWindow -> Eff (dom :: DOM | eff) HTMLDocument


## Module Data.DOM.Simple.Element

### Type Classes

    class Element b where
      getElementById :: forall eff. String -> b -> Eff (dom :: DOM | eff) HTMLElement
      getElementsByClassName :: forall eff. String -> b -> Eff (dom :: DOM | eff) [HTMLElement]
      getElementsByName :: forall eff. String -> b -> Eff (dom :: DOM | eff) [HTMLElement]
      querySelector :: forall eff. String -> b -> Eff (dom :: DOM | eff) HTMLElement
      querySelectorAll :: forall eff. String -> b -> Eff (dom :: DOM | eff) [HTMLElement]
      getAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) String
      setAttribute :: forall eff. String -> String -> b -> Eff (dom :: DOM | eff) Unit
      hasAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) Boolean
      removeAttribute :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      children :: forall eff. b -> Eff (dom :: DOM | eff) [HTMLElement]
      innerHTML :: forall eff. b -> Eff (dom :: DOM | eff) String
      setInnerHTML :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      textContent :: forall eff. b -> Eff (dom :: DOM | eff) String
      setTextContent :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      contentWindow :: forall eff. b -> Eff (dom :: DOM | eff) HTMLWindow
      classRemove :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      classAdd :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      classToggle :: forall eff. String -> b -> Eff (dom :: DOM | eff) Unit
      classContains :: forall eff. String -> b -> Eff (dom :: DOM | eff) Boolean


### Type Class Instances

    instance htmlElement :: Element HTMLElement


### Values

    globalWindow :: HTMLWindow


## Module Data.DOM.Simple.Encode

### Values

    decodeURI :: String -> String

    decodeURIComponent :: String -> String

    encodeURI :: String -> String

    encodeURIComponent :: String -> String

    paramatize :: forall a. a -> String

    toJsonString :: forall eff a. a -> Eff (dom :: DOM | eff) String


## Module Data.DOM.Simple.Events

### Type Classes

    class EventTarget b where
      addEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit
      removeEventListener :: forall t ta a. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | ta) Unit


### Type Class Instances

    instance eventTargetHTMLDocument :: EventTarget HTMLDocument

    instance eventTargetHTMLElement :: EventTarget HTMLElement

    instance eventTargetHTMLWindow :: EventTarget HTMLWindow

    instance eventTargetXMLHttpRequest :: EventTarget XMLHttpRequest


### Values

    eventTarget :: forall eff a. DOMEvent -> Eff (dom :: DOM | eff) a

    preventDefault :: forall eff. DOMEvent -> Eff (dom :: DOM | eff) Unit

    ready :: forall t ta. Eff (dom :: DOM | t) Unit -> Eff (dom :: DOM | ta) Unit


## Module Data.DOM.Simple.Types

### Types

    data DOM :: !

    data DOMEvent :: *

    data HTMLDocument :: *

    data HTMLElement :: *

    data HTMLWindow :: *

    data JavascriptContext :: *

    data XMLHttpRequest :: *


## Module Data.DOM.Simple.Unsafe.Document

### Values

    unsafeSetTitle :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeTitle :: forall eff a. a -> Eff (dom :: DOM | eff) String


## Module Data.DOM.Simple.Unsafe.Element

### Values

    unsafeChildren :: forall eff a. a -> Eff (dom :: DOM | eff) [HTMLElement]

    unsafeClassAdd :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeClassContains :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Boolean

    unsafeClassRemove :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeClassToggle :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeContentWindow :: forall eff a. a -> Eff (dom :: DOM | eff) HTMLWindow

    unsafeGetAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) String

    unsafeGetElementById :: forall eff a. String -> a -> Eff (dom :: DOM | eff) HTMLElement

    unsafeGetElementsByClassName :: forall eff a. String -> a -> Eff (dom :: DOM | eff) [HTMLElement]

    unsafeGetElementsByName :: forall eff a. String -> a -> Eff (dom :: DOM | eff) [HTMLElement]

    unsafeHasAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Boolean

    unsafeInnerHTML :: forall eff a. a -> Eff (dom :: DOM | eff) String

    unsafeQuerySelector :: forall eff a. String -> a -> Eff (dom :: DOM | eff) HTMLElement

    unsafeQuerySelectorAll :: forall eff a. String -> a -> Eff (dom :: DOM | eff) [HTMLElement]

    unsafeRemoveAttribute :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeSetAttribute :: forall eff a. String -> String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeSetInnerHTML :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeSetTextContent :: forall eff a. String -> a -> Eff (dom :: DOM | eff) Unit

    unsafeTextContent :: forall eff a. a -> Eff (dom :: DOM | eff) String


## Module Data.DOM.Simple.Unsafe.Events

### Values

    unsafeAddEventListener :: forall eff t a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | eff) Unit

    unsafeRemoveEventListener :: forall eff t a b. String -> (DOMEvent -> Eff (dom :: DOM | t) a) -> b -> Eff (dom :: DOM | eff) Unit