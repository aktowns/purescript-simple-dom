# Module Documentation

## Module Data.Dom.Simple.Element

### Types

    data DOM :: !

    data HTMLElement :: *

    data HTMLWindow :: *


### Values

    contentWindow :: forall eff. HTMLElement -> Eff (contentWindow :: DOM | eff) HTMLWindow

    getAttribute :: forall eff. HTMLElement -> String -> Eff (getAttribute :: DOM | eff) String

    getDocument :: forall eff. HTMLWindow -> Eff (getDocument :: DOM | eff) HTMLElement

    getElementById :: forall eff. HTMLElement -> String -> Eff (getElementById :: DOM | eff) HTMLElement

    getElementsByClassName :: forall eff. HTMLElement -> String -> Eff (getElementsByClassName :: DOM | eff) [HTMLElement]

    getElementsByName :: forall eff. HTMLElement -> String -> Eff (getElementsByName :: DOM | eff) [HTMLElement]

    globalWindow :: HTMLWindow

    hasAttribute :: forall eff. HTMLElement -> String -> Eff (hasAttribute :: DOM | eff) Boolean

    innerHTML :: forall eff. HTMLElement -> Eff (innerHTML :: DOM | eff) String

    innerText :: forall eff. HTMLElement -> Eff (innerText :: DOM | eff) String

    querySelector :: forall eff. HTMLElement -> String -> Eff (querySelector :: DOM | eff) HTMLElement

    querySelectorAll :: forall eff. HTMLElement -> String -> Eff (querySelectorAll :: DOM | eff) [HTMLElement]

    setAttribute :: forall eff. HTMLElement -> String -> String -> Eff (setAttribute :: DOM | eff) Unit

    setInnerHTML :: forall eff. HTMLElement -> String -> Eff (innerHTML :: DOM | eff) Unit

    setInnerText :: forall eff. HTMLElement -> String -> Eff (innerText :: DOM | eff) Unit