/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Element

exports.unsafeGetElementById = function (targId) {
  return function (src) {
    return function () {
      return src.getElementById(targId);
    };
  };
};

exports.unsafeGetElementsByClassName = function (targId) {
  return function (src) {
    return function () {
      return Array.prototype.slice.call(src.getElementsByClassName(targId));
    };
  };
};

exports.unsafeGetElementsByName = function (targId) {
  return function (src) {
    return function () {
      return Array.prototype.slice.call(src.getElementsByName(targId));
    };
  };
};

exports.unsafeQuerySelector = function (selector) {
  return function (src) {
    return function () {
      return src.querySelector(selector);
    };
  };
};

exports.unsafeQuerySelectorAll = function (selector) {
  return function (src) {
    return function () {
      return src.querySelectorAll(selector);
    };
  };
};

exports.unsafeGetAttribute = function (name) {
  return function (src) {
    return function () {
      return src.getAttribute(name);
    };
  };
};

exports.unsafeSetAttribute = function (name) {
  return function (value) {
    return function (src) {
      return function () {
        src.setAttribute(name, value);
        return {};
      };
    };
  };
};

exports.unsafeHasAttribute = function (name) {
  return function (src) {
    return function () {
      return src.hasAttribute(name);
    };
  };
};

exports.unsafeRemoveAttribute = function (name) {
  return function (src) {
    return function () {
      src.removeAttribute(name);
      return {};
    };
  };
};

exports.unsafeGetStyleAttr = function (name) {
  return function (src) {
    return function () {
      return src.style[name];
    };
  };
};

exports.unsafeSetStyleAttr = function (name) {
  return function (value) {
    return function (src) {
      return function () {
        src.style[name] = value;
        return {};
      };
    };
  };
};

exports.unsafeChildren = function (src) {
  return function () {
    return Array.prototype.slice.call(src.children);
  };
};

exports.unsafeAppendChild = function (src) {
  return function (child) {
    return function () {
      return src.appendChild(child);
    };
  };
};

exports.unsafeInnerHTML = function (src) {
  return function () {
    return src.innerHTML;
  };
};

exports.unsafeSetInnerHTML = function (value) {
  return function (src) {
    return function () {
      src.innerHTML = value;
      return {};
    };
  };
};

exports.unsafeTextContent = function (src) {
  return function () {
    return src.textContent;
  };
};

exports.unsafeSetTextContent = function (value) {
  return function (src) {
    return function () {
      src.textContent = value;
      return {};
    };
  };
};

exports.unsafeValue = function (src) {
  return function () {
    return src.value;
  };
};

exports.unsafeSetValue = function (value) {
  return function (src) {
    return function () {
      src.value = value;
      return {};
    };
  };
};

exports.unsafeContentWindow = function (obj) {
  return function () {
    return obj.contentWindow;
  };
};

exports.unsafeClassAdd = function (value) {
  return function (src) {
    return function () {
      src.classList.add(value);
      return {};
    };
  };
};

exports.unsafeClassRemove = function (value) {
  return function (src) {
    return function () {
      src.classList.remove(value);
      return {};
    };
  };
};

exports.unsafeClassToggle = function (value) {
  return function (src) {
    return function () {
      src.classList.toggle(value);
      return {};
    };
  };
};

exports.unsafeClassContains = function (value) {
  return function (src) {
    return function () {
      return src.classList.contains(value);
    };
  };
};

exports.unsafeClick = function (src) {
  return function () {
    src.click();
    return {};
  };
};

exports.unsafeFocus = function (src) {
  return function () {
    src.focus();
    return {};
  };
};

exports.unsafeBlur = function (src) {
  return function () {
    src.blur();
    return {};
  };
};

exports.unsafeOffsetParent = function (src) {
  return function () {
    return src.offsetParent;
  };
};

exports.unsafeOffsetHeight = function (src) {
  return function () {
    return src.offsetHeight;
  };
};

exports.unsafeOffsetWidth = function (src) {
  return function () {
    return src.offsetWidth;
  };
};

exports.unsafeOffsetTop = function (src) {
  return function () {
    return src.offsetTop;
  };
};

exports.unsafeOffsetLeft = function (src) {
  return function () {
    return src.offsetLeft;
  };
};
