/* jshint maxparams: false */
/* global exports, XMLHttpRequest */
"use strict";

// module Data.DOM.Simple.Ajax

exports.maybeFn = function (nothing, just, a) {
  return a == null ? nothing : just(a);
};

exports.makeXMLHttpRequest = function () {
  return new XMLHttpRequest();
};

exports.responseText = function (obj) {
  return function () {
    return obj.responseText;
  };
};

exports.status = function (obj) {
  return function () {
    return obj.status;
  };
};

exports.statusText = function (obj) {
  return function () {
    return obj.statusText;
  };
};

exports.setRequestHeader = function (key) {
  return function (value) {
    return function (obj) {
      return function () {
        obj.setRequestHeader(key, value);
        return {};
      };
    };
  };
};

exports.getAllResponseHeaders = function (obj) {
  return function () {
    return obj.getAllResponseHeaders();
  };
};

exports.overrideMimeType = function (mime) {
  return function (obj) {
    return function () {
      obj.overrideMimeType(mime);
      return {};
    };
  };
};
