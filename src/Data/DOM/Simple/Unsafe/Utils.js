/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Utils

exports.ensure3 = function (nothing) {
  return function (just) {
    return function (v) {
      if (v === undefined || v === null) {
        return nothing;
      } else {
        return just(v);
      }
    };
  };
};

exports.showImpl = function (v) {
  return function () {
    return v.toString();
  };
};
