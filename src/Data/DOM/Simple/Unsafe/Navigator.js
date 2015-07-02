/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Navigator

exports.unsafeAppName = function (navi) {
  return function () {
    return navi.appName;
  };
};

exports.unsafeAppVersion = function (navi) {
  return function () {
    return navi.appName;
  };
};

exports.unsafeAppCodeName = function (navi) {
  return function () {
    return navi.appCodeName;
  };
};

exports.unsafeLanguage = function (navi) {
  return function () {
    return navi.language;
  };
};

exports.unsafePlatform = function (navi) {
  return function () {
    return navi.platform;
  };
};

exports.unsafeProduct = function (navi) {
  return function () {
    return navi.product;
  };
};

exports.unsafeUserAgent = function (navi) {
  return function () {
    return navi.userAgent;
  };
};
