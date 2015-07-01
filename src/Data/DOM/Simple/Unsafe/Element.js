/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Element

  function unsafeGetElementById(targ_id) {
    return function (src) {
      return function () {
        return src.getElementById(targ_id);
      };
    };
  }
function unsafeGetElementsByClassName(targ_id) {
    return function (src) {
      return function () {
        return src.getElementsByClassName(targ_id);
      };
    };
  }

  function unsafeGetElementsByName(targ_id) {
    return function (src) {
      return function () {
        return src.getElementsByName(targ_id);
      };
    };
  }

  function unsafeQuerySelector(selector) {
    return function (src) {
      return function () {
        return src.querySelector(selector);
      };
    };
  }

  function unsafeQuerySelectorAll(selector) {
    return function (src) {
      return function () {
        return src.querySelectorAll(selector);
      };
    };
  }

  function unsafeGetAttribute(name) {
    return function (src) {
      return function () {
        return src.getAttribute(name);
      };
    };
  }

  function unsafeSetAttribute(name) {
    return function (value) {
      return function (src) {
        return function () {
          src.setAttribute(name, value);
          return {};
        };
      };
    };
  }

  function unsafeHasAttribute(name) {
    return function (src) {
      return function () {
        return src.hasAttribute(name);
      };
    };
  }

  function unsafeRemoveAttribute(name) {
    return function (src) {
      return function () {
        src.removeAttribute(name);
        return {};
      };
    };
  }

  function unsafeGetStyleAttr(name) {
    return function (src) {
      return function () {
        return src.style[name];
      };
    };
  }

  function unsafeSetStyleAttr(name) {
    return function (value) {
      return function (src) {
        return function () {
          src.style[name] = value;
          return {};
        };
      };
    };
  }

  function unsafeChildren(src) {
    return function () {
      return src.children;
    };
  }

  function unsafeAppendChild(src) {
    return function (child) {
      return function () {
        return src.appendChild(child);
      };
    };
  }

  function unsafeInnerHTML(src) {
    return function () {
      return src.innerHTML;
    };
  }

  function unsafeSetInnerHTML(value) {
    return function (src) {
      return function () {
        src.innerHTML = value;
        return {};
      };
    };
  }

  function unsafeTextContent(src) {
    return function () {
      return src.textContent;
    };
  }

  function unsafeSetTextContent(value) {
    return function (src) {
      return function () {
        src.textContent = value;
        return {};
      };
    };
  }

function unsafeValue(src) {
    return function () {
      return src.value;
    };
}

  function unsafeSetValue(value) {
    return function (src) {
      return function () {
        src.value = value;
        return {};
      };
    };
  }

  function unsafeContentWindow(obj) {
    return function () {
      return obj.contentWindow;
    };
  }

  function unsafeClassAdd(value) {
    return function (src) {
      return function () {
        src.classList.add(value);
        return {};
      };
    };
  }

  function unsafeClassRemove(value) {
    return function (src) {
      return function () {
        src.classList.remove(value);
        return {};
      };
    };
  }

  function unsafeClassToggle(value) {
    return function (src) {
      return function () {
        src.classList.toggle(value);
        return {};
      };
    };
  }

  function unsafeClassContains(value) {
    return function (src) {
      return function () {
        return src.classList.contains(value);
      };
    };
  }

  function unsafeClick(src) {
    return function () {
      src.click();
      return {};
    };
  }

  function unsafeFocus(src) {
    return function () {
      src.focus();
      return {};
    };
  }

  function unsafeBlur(src) {
    return function () {
      src.blur();
      return {};
    };
  }
