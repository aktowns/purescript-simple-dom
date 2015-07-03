/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.NodeList

exports.unsafeNodeListLength = function (nl) {
  return function () {
    return nl.length;
  };
};

exports.unsafeNodeListItem = function (idx) {
  return function (nl) {
    return function () {
      return nl.item(idx);
    };
  };
};

exports.unsafeNodeListToArray = function (nl) {
  return function () {
    return Array.prototype.slice.call(nl);
  };
};
