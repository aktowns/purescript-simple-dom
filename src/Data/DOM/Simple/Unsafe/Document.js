/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Document

exports.unsafeTitle = function (src) {
  return function () {
    return src.title;
  };
};

exports.unsafeSetTitle = function (value) {
  return function (src) {
    return function () {
      src.title = value;
    };
  };
};

exports.unsafeBody = function (src) {
  return function () {
    return src.body;
  };
};

exports.unsafeSetBody = function (value) {
  return function (src) {
    return function () {
      src.body = value;
    };
  };
};

exports.unsafeCreateElement = function (tagName) {
  return function (src) {
    return function () {
      return src.createElement(tagName);
    };
  };
};
