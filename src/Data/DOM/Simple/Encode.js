/* global exports */
"use strict";

// module Data.Dom.Simple.Encode

exports.encodeURIComponent = function (uri) {
  return encodeURIComponent(uri);
};

exports.decodeURIComponent = function (uri) {
  return decodeURIComponent(uri);
};

exports.encodeURI = function (uri) {
  return encodeURI(uri);
};

exports.decodeURI = function (uri) {
  return decodeURI(uri);
};

exports.paramatize = function (obj) {
  return Object.keys(obj).map(function (key) {
    return key + "=" + encodeURIComponent(obj[key]);
  }).join("&");
};

exports.toJsonString = function (obj) {
  return function () {
    return JSON.stringify(obj);
  };
};
