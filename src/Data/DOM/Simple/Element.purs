module Data.Dom.Simple.Element where

import Control.Monad.Eff

foreign import data DOM :: !
foreign import data HTMLElement :: *
foreign import data HTMLWindow :: *

foreign import globalWindow
  "function globalWindow() { return window; }" :: HTMLWindow

foreign import getDocument
  "function getDocument(win) { \
  \  return win.document;      \
  \}" :: forall eff. HTMLWindow -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import getElementById
  "function getElementById(targ_id) {       \
  \  return function (src) {                \
  \     return src.getElementById(targ_id); \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import getElementsByClassName
  "function getElementsByClassName(targ_id) {       \
  \  return function (src) {                        \
  \    return src.getElementsByClassName(targ_id);  \
  \  }                                              \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import getElementsByName
  "function getElementsByName(targ_id) {            \
  \  return function (src) {                        \
  \    return src.getElementsByName(targ_id);       \
  \  };                                             \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import querySelector
  "function querySelector(selector) {       \
  \  return function (src) {                \
  \    return src.querySelector(selector);  \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import querySelectorAll
  "function querySelectorAll(selector) {        \
  \  return function (src) {                    \
  \    return src.querySelectorAll(selector);   \
  \  };                                         \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import getAttribute
  "function getAttribute(name) {            \
  \  return function (src) {                \
  \    return src.getAttribute(name);       \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) String)

foreign import setAttribute
  "function setAttribute(name) {            \
  \  return function (value) {              \
  \    return function (src) {              \
  \      src.getAttribute(name);            \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff. String -> String -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)

foreign import hasAttribute
  "function hasAttribute(name) {            \
  \  return function (src) {                \
  \    return src.hasAttribute(name);       \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) Boolean)

foreign import innerHTML
  "function innerHTML(src) {                \
  \    return src.innerHTML;                \
  \}" :: forall eff. HTMLElement -> (Eff (dom :: DOM | eff) String)

foreign import setInnerHTML
  "function setInnerHTML(value) {           \
  \  return function (src) {                \
  \    src.innerHTML = value;               \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)

foreign import innerText
  "function innerText(src) {                \
  \    return src.innerText;                \
  \}" :: forall eff. HTMLElement -> (Eff (dom :: DOM | eff) String)

foreign import setInnerText
  "function setInnerText(value) {           \
  \  return function (src) {                \
  \    src.innerText = value;               \
  \  };                                     \
  \}" :: forall eff. String -> HTMLElement -> (Eff (dom :: DOM | eff) Unit)

foreign import contentWindow
  "function contentWindow(obj) {  \
  \  return obj.contentWindow;    \
  \}" :: forall eff. HTMLElement -> (Eff (dom :: DOM | eff) HTMLWindow)
