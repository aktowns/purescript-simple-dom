module Data.DOM.Simple.Unsafe.Element where

import Control.Monad.Eff

import Data.DOM.Simple.Types

foreign import unsafeGetElementById
  "function unsafeGetElementById(targ_id) {      \
  \  return function (src) {                     \
  \    return function () {                      \
  \      return src.getElementById(targ_id);     \
  \    };                                        \
  \  };                                          \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeGetElementsByClassName
  "function unsafeGetElementsByClassName(targ_id) {   \
  \  return function (src) {                          \
  \    return function () {                           \
  \      return src.getElementsByClassName(targ_id);  \
  \    };                                             \
  \  }                                                \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import unsafeGetElementsByName
  "function unsafeGetElementsByName(targ_id) {      \
  \  return function (src) {                        \
  \    return function () {                         \
  \      return src.getElementsByName(targ_id);     \
  \    };                                           \
  \  };                                             \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import unsafeQuerySelector
  "function unsafeQuerySelector(selector) {   \
  \  return function (src) {                  \
  \    return function () {                   \
  \      return src.querySelector(selector);  \
  \    };                                     \
  \  };                                       \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) HTMLElement)

foreign import unsafeQuerySelectorAll
  "function unsafeQuerySelectorAll(selector) {  \
  \  return function (src) {                    \
  \    return function () {                     \
  \      return src.querySelectorAll(selector); \
  \    };                                       \
  \  };                                         \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import unsafeGetAttribute
  "function unsafeGetAttribute(name) {      \
  \  return function (src) {                \
  \    return function () {                 \
  \      return src.getAttribute(name);     \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetAttribute
  "function unsafeSetAttribute(name) {      \
  \  return function (value) {              \
  \    return function (src) {              \
  \      return function () {               \
  \        src.setAttribute(name, value);   \
  \      };                                 \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeHasAttribute
  "function unsafeHasAttribute(name) {      \
  \  return function (src) {                \
  \    return function () {                 \
  \      return src.hasAttribute(name);     \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Boolean)

foreign import unsafeRemoveAttribute
  "function unsafeRemoveAttribute(name) {   \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.removeAttribute(name);         \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeChildren
  "function unsafeChildren(src) {           \
  \    return function () {                 \
  \      return src.children;               \
  \  };                                     \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) [HTMLElement])

foreign import unsafeInnerHTML
  "function unsafeInnerHTML(src) {          \
  \  return function () {                   \
  \    return src.innerHTML;                \
  \  };                                     \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetInnerHTML
  "function unsafeSetInnerHTML(value) {     \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.innerHTML = value;             \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeTextContent
  "function unsafeTextContent(src) {        \
  \  return function () {                   \
  \    return src.textContent;              \
  \  };                                     \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) String)

foreign import unsafeSetTextContent
  "function unsafeSetTextContent(value) {   \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.textContent = value;           \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeContentWindow
  "function unsafeContentWindow(obj) {  \
  \  return function () {               \
  \    return obj.contentWindow;        \
  \  };                                 \
  \}" :: forall eff a. a -> (Eff (dom :: DOM | eff) HTMLWindow)


foreign import unsafeClassAdd
  "function unsafeClassAdd(value) {         \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.classList.add(value);          \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassRemove
  "function unsafeClassRemove(value) {      \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.classList.remove(value);       \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassToggle
  "function unsafeClassToggle(value) {      \
  \  return function (src) {                \
  \    return function () {                 \
  \      src.classList.toggle(value);       \
  \    };                                   \
  \  };                                     \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Unit)

foreign import unsafeClassContains
  "function unsafeClassContains(value) {        \
  \  return function (src) {                    \
  \    return function () {                     \
  \      return src.classList.contains(value);  \
  \    };                                       \
  \  };                                         \
  \}" :: forall eff a. String -> a -> (Eff (dom :: DOM | eff) Boolean)
