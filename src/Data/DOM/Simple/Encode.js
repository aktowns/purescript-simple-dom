/* global exports */
"use strict";

// module Data.DOM.Simple.Encode

// testing

exports.encodeURIComponent = window.encodeURIComponent;
exports.decodeURIComponent = window.decodeURIComponent;
exports.encodeURI = window.encodeURI;
exports.decodeURI = window.decodeURI;

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
