# purescript-simple-dom

[![Build Status](https://travis-ci.org/aktowns/purescript-simple-dom.svg?branch=master)](https://travis-ci.org/aktowns/purescript-simple-dom)

### About

An easy to use library for dealing with the DOM and general javascript APIs.
Minimal dependencies, and aiming to be as close to the javascript API as possible.

### Module Documentation
- [Data.DOM.Simple.Ajax](docs/Data/DOM/Simple/Ajax.md)
- [Data.DOM.Simple.Document](docs/Data/DOM/Simple/Document.md)
- [Data.DOM.Simple.Element](docs/Data/DOM/Simple/Element.md)
- [Data.DOM.Simple.Encode](docs/Data/DOM/Simple/Encode.md)
- [Data.DOM.Simple.Events](docs/Data/DOM/Simple/Events.md)
- [Data.DOM.Simple.Navigator](docs/Data/DOM/Simple/Navigator.md)
- [Data.DOM.Simple.NodeList](docs/Data/DOM/Simple/NodeList.md)
- [Data.DOM.Simple.Sugar](docs/Data/DOM/Simple/Sugar.md)
- [Data.DOM.Simple.Types](docs/Data/DOM/Simple/Types.md)
- [Data.DOM.Simple.Window](docs/Data/DOM/Simple/Window.md)
- [Data.DOM.Simple.Unsafe.Ajax](docs/Data/DOM/Simple/Unsafe/Ajax.md)
- [Data.DOM.Simple.Unsafe.Document](docs/Data/DOM/Simple/Unsafe/Document.md)
- [Data.DOM.Simple.Unsafe.Element](docs/Data/DOM/Simple/Unsafe/Element.md)
- [Data.DOM.Simple.Unsafe.Events](docs/Data/DOM/Simple/Unsafe/Events.md)
- [Data.DOM.Simple.Unsafe.Navigator](docs/Data/DOM/Simple/Unsafe/Navigator.md)
- [Data.DOM.Simple.Unsafe.NodeList](docs/Data/DOM/Simple/Unsafe/NodeList.md)
- [Data.DOM.Simple.Unsafe.Sugar](docs/Data/DOM/Simple/Unsafe/Sugar.md)
- [Data.DOM.Simple.Unsafe.Window](docs/Data/DOM/Simple/Unsafe/Window.md)

### Some Examples

#### Set the contents of an iframe to arbitary html content

```purescript
setContents contents = do
  -- doc = window.document
  doc <- document globalWindow
  -- iframe = doc.querySelector("#siteFrame")
  iframe <- querySelector "#siteFrame" doc
  -- iframeDoc = iframe.contentWindow.document
  iframeDoc <- (contentWindow iframe) >>= document
  -- iframeDoc.querySelector("html").innerHTML = contents
  querySelector "html" iframeDoc >>= setInnerHTML contents

-- or a little shorter
setContents' contents = do
  document globalWindow >>= querySelector "#siteFrame" >>=
    contentWindow >>= document >>= querySelector "html" >>=
      setInnerHTML contents
```


#### Change all a href's on a page and add the original link as a data attribute

```purescript
modifyLinkTarget link = do
  attr <- getAttribute "href" link       -- attr = link.getAttribute("href")
  setAttribute "href" "#" link           -- link.setAttribute("href", "#")
  setAttribute "data-target" attr link   -- link.setAttribute("data-target", attr)
  return link

modifyLinks page = do
  links <- querySelectorAll "a" page      -- links = [HTMLElement]
  sequence $ A.map modifyLinkTarget links -- links.map(modifyLinkTarget)
```

#### Place some content from an API call into a div

```purescript
-- Convert the evt content into text for the callback
handleRequest callback evt = do
  target <- eventTarget event
  text <- responseText target
  callback text

-- Construct and perform AJAX request for the specified url
makeGetRequest url callback = do
  req <- makeXMLHttpRequest
  addEventListener "load" (handleRequest callback) req
  open GET url req
  setRequestHeader "Content-Type" "application/json" req
  send NoData req

-- retrieve the content and place it inside the div
requestContent = do
  let url = "http://myendpoint.com/"
  doc <- document globalWindow

  makeGetRequest url $ \resp -> do
    querySelector "#myDiv" doc >>= setInnerHtml resp
```
