/* jshint undef: false, unused: false */
/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Sugar

// HACK: This is a really dirty hack, is there any way to unify
// the kinds without having to do this? i'm at a loss.
exports.dirtyKindDomRecast = function (_) {
  return function id(x) {
    return x;
  };
};
