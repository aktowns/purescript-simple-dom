/* global exports */
"use strict";

// module Data.DOM.Simple.Unsafe.Events

exports.unsafeAddEventListener = function (targ) {
  return function (cb) {
    return function (src) {
      return function () {
        src.addEventListener(targ, function (evt) {
          cb(evt)();
        });
      };
    };
  };
};

exports.unsafeRemoveEventListener = function (targ) {
  return function (cb) {
    return function (src) {
      return function () {
        src.removeEventListener(targ, function (evt) {
          cb(evt)();
        });
      };
    };
  };
};

exports.unsafeEventTarget = function (event) {
  return function () {
    return event.target;
  };
};

exports.unsafeStopPropagation = function (event) {
  return function () {
    event.stopPropagation();
  };
};

exports.unsafePreventDefault = function (event) {
  return function () {
    event.preventDefault();
  };
};

// XXX Wallpaper over the fact that some browsers don't support
// KeyboardEvent.key yet.  It's a hack, since it doesn't correctly
// handle modifier keys, etc.
exports.unsafeEventKey = function (event) {
  return function () {
    return event.key === undefined ? String.fromCharCode(event.keyCode) : event.key;
  };
};

exports.unsafeEventKeyCode = function (event) {
  return function () {
    return event.keyCode;
  };
};

exports.unsafeEventNumberProp = function (prop) {
  return function (event) {
    return function () {
      return event[prop];
    };
  };
};

exports.unsafeEventStringProp = function (prop) {
  return function (event) {
    return function () {
      return event[prop];
    };
  };
};

exports.unsafeEventBooleanProp = function (prop) {
  return function (event) {
    return function () {
      return !!event[prop];
    };
  };
};

// XXX really should be returning an HTMLAbstractView here...
exports.unsafeEventView = function (event) {
  return function () {
    return event.view;
  };
};
