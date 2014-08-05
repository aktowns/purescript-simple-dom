module Data.Dom.Simple.Element where

import Control.Monad.Eff

foreign import data DOM :: !
foreign import data HTMLElement :: *

foreign import document "window.document" :: HTMLElement

foreign import getElementById
  "function getElementById(src) {           \
  \  return function (targ_id) {            \
  \     return src.getElementById(targ_id); \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (getElementById :: DOM | eff) HTMLElement)

foreign import getElementsByClassName
  "function getElementsByClassName(src) {           \
  \  return function (targ_id) {                    \
  \    return src.getElementsByClassName(targ_id);  \
  \  }                                              \
  \}" :: forall eff. HTMLElement -> String -> (Eff (getElementsByClassName :: DOM | eff) [HTMLElement])

foreign import getElementsByName
  "function getElementsByName(src) {                \
  \  return function (targ_id) {                    \
  \    return src.getElementsByName(targ_id);       \
  \  };                                             \
  \}" :: forall eff. HTMLElement -> String -> (Eff (getElementsByName :: DOM | eff) [HTMLElement])

foreign import querySelector
  "function querySelector(src) {            \
  \  return function (selector) {           \
  \    return src.querySelector(selector);  \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (querySelector :: DOM | eff) HTMLElement)

foreign import querySelectorAll
  "function querySelectorAll(src) {             \
  \  return function (selector) {               \
  \    return src.querySelectorAll(selector);   \
  \  };                                         \
  \}" :: forall eff. HTMLElement -> String -> (Eff (querySelectorAll :: DOM | eff) [HTMLElement])

foreign import getAttribute
  "function getAttribute(src) {             \
  \  return function (name) {               \
  \    return src.getAttribute(name);       \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (getAttribute :: DOM | eff) String)

foreign import setAttribute
  "function setAttribute(src) {             \
  \  return function (name) {               \
  \    return function (value) {            \
  \      src.getAttribute(name);            \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> String -> (Eff (setAttribute :: DOM | eff) Unit)

foreign import hasAttribute
  "function hasAttribute(src) {             \
  \  return function (name) {               \
  \    return src.hasAttribute(name);       \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (hasAttribute :: DOM | eff) Boolean)

foreign import innerHTML
  "function innerHTML(src) {                \
  \    return src.innerHTML;                \
  \}" :: forall eff. HTMLElement -> (Eff (innerHTML :: DOM | eff) String)

foreign import setInnerHTML
  "function setInnerHTML(src) {             \
  \  return function (value) {              \
  \    src.innerHTML = value;               \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (innerHTML :: DOM | eff) Unit)

foreign import innerText
  "function innerText(src) {                \
  \    return src.innerText;                \
  \}" :: forall eff. HTMLElement -> (Eff (innerText :: DOM | eff) String)

foreign import setInnerText
  "function setInnerText(src) {             \
  \  return function (value) {              \
  \    src.innerText = value;               \
  \  };                                     \
  \}" :: forall eff. HTMLElement -> String -> (Eff (innerText :: DOM | eff) Unit)
