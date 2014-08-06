## purescript-dom-simple

A hopefully easy to use library for dealing with the DOM and general javascript APIs.  
Minimal dependencies, and aiming to be as close to the javascript api as possible.  

Very much a WIP, and learning as i go.

Module documentation is available [here](API.md)


### Some Examples
    -- Set the contents of an iframe to arbitary html content
    setContents contents = do
      doc <- getDocument globalWindow                           -- doc = window.document
      iframe <- querySelector "#siteFrame" doc                  -- iframe = doc.querySelector("#siteFrame")
      iframeDoc <- (contentWindow iframe) >>= getDocument       -- iframeDoc = iframe.contentWindow.document
      querySelector "html" iframeDoc >>= setInnerHTML contents  -- iframeDoc.querySelector("html").innerHTML = contents


    -- Change all a href's on a page and add the original link as a data attribute
    modifyLinkTarget link = do
      attr <- getAttribute "href" link                    -- attr = link.getAttribute("href")
      setAttribute "href" "#" link                        -- link.setAttribute("href", "#")
      setAttribute "data-target" attr link                -- link.setAttribute("data-target", attr)
      return link

    modifyLinks page = do
      links <- querySelectorAll "a" page                  -- links = [HTMLElement]
      sequence $ A.map modifyLinkTarget links             -- links.map(modifyLinkTarget)
