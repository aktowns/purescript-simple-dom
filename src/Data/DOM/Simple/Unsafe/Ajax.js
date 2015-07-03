/* jshint maxparams: false */
/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Ajax

exports.unsafeReadyState = function (obj) {
  return function () {
    return obj.readyState;
  };
};

exports.unsafeOnReadyStateChange = function (obj, fn) {
  return function () {
    obj.onreadystatechange = fn;
    return {};
  };
};

exports.unsafeOpen = function (obj, method, url) {
  return function () {
    obj.open(method, url);
    return {};
  };
};

exports.unsafeSend = function (obj) {
  return function () {
    obj.send();
    return {};
  };
};

exports.unsafeSendWithPayload = function (obj, payload) {
  return function () {
    obj.send(payload);
    return {};
  };
};

exports.unsafeSetResponseType = function (obj, rt) {
  return function () {
    obj.responseType = rt;
    return {};
  };
};

exports.unsafeResponseType = function (obj) {
  return function () {
    return obj.responseType;
  };
};

exports.unsafeResponse = function (obj) {
  return function () {
    return obj.response;
  };
};

exports.unsafeGetResponseHeader = function (obj, key) {
  return function () {
    return obj.getResponseHeader(key);
  };
};
