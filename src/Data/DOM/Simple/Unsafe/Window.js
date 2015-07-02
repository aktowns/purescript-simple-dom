/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Window

exports.unsafeDocument = function (win) {
  return function () {
    return win.document;
  };
};

exports.unsafeNavigator = function (win) {
  return function () {
    return win.navigator;
  };
};

exports.unsafeLocation = function (win) {
  return function () {
    return win.location;
  };
};

exports.unsafeGetLocation = function (loc) {
  return function () {
    return loc;
  };
};

exports.unsafeSetLocation = function (value) {
  return function (loc) {
    return function () {
      loc.assign(value);
    };
  };
};

exports.unsafeGetSearchLocation = function (loc) {
  return function () {
    return loc.search;
  };
};

exports.unsafeSetTimeout = function (win) {
  return function (delay) {
    return function (func) {
      return function () {
        return win.setTimeout(func, delay);
      };
    };
  };
};

exports.unsafeSetInterval = function (win) {
  return function (delay) {
    return function (func) {
      return function () {
        return win.setInterval(func, delay);
      };
    };
  };
};

exports.unsafeClearTimeout = function (win) {
  return function (timeout) {
    return function () {
      win.clearTimeout(timeout);
    };
  };
};

exports.unsafeInnerWidth = function (win) {
  return function () {
    return win.innerWidth;
  };
};

exports.unsafeInnerHeight = function (win) {
  return function () {
    return win.innerHeight;
  };
};
