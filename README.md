# Module Documentation

## Module Data.Dom.Simple.Element

### Types

    data DOM :: !

    data HTMLElement :: *

    data HTMLWindow :: *


### Values

    contentWindow :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) HTMLWindow

    getAttribute :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) String

    getDocument :: forall eff. HTMLWindow -> Eff (dom :: DOM | eff) HTMLElement

    getElementById :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) HTMLElement

    getElementsByClassName :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) [HTMLElement]

    getElementsByName :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) [HTMLElement]

    globalWindow :: HTMLWindow

    hasAttribute :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) Boolean

    innerHTML :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) String

    innerText :: forall eff. HTMLElement -> Eff (dom :: DOM | eff) String

    querySelector :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) HTMLElement

    querySelectorAll :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) [HTMLElement]

    setAttribute :: forall eff. HTMLElement -> String -> String -> Eff (dom :: DOM | eff) Unit

    setInnerHTML :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) Unit

    setInnerText :: forall eff. HTMLElement -> String -> Eff (dom :: DOM | eff) Unit


## Module Data.DOM.Simple.Events

### Types

    data JavascriptContext :: *


### Values

    addEventListener :: forall eff reff. HTMLElement -> String -> (JavascriptContext -> Eff (dom :: DOM | reff) Unit) -> Eff (dom :: DOM | eff) Unit