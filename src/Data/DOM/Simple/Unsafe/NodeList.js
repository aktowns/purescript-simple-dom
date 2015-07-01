/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.NodeList

export unsafeNodeListLength = function (nl) {
  return function () {
    return nl.length;
  }
}

export unsafeNodeListItem = function (idx) {
  return function (nl) {
    return function () {
      return nl.item(idx);
    }
  }
}

export unsafeNodeListToArray = function (nl) {
  return function () {
    return Array.prototype.slice.call(nl);
  };
}
