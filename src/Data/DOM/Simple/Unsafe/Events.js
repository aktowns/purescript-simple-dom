/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Event

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

exports.unsafeEventKey = function (event) {
  return function () {
    if (event.key === undefined) {
      return String.fromCharCode(event.keyCode);
    } else {
      return event.key;
    }
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

exports.unsafeEventView = function (event) {
  return function () {
    return event.view;
  };
};
