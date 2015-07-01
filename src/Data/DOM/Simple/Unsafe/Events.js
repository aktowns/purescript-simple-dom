/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Event

export unsafeAddEventListener = function ) {
    return function (cb) {
	return function (src) {
            return function () {
		src.addEventListener(targ, function(evt) {
		    cb(evt)();
		});
            };
	};
    };
}

export unsafeRemoveEventListener = function (targ) {
    return function (cb) {
	return function (src) {
            return function () {
		src.removeEventListener(targ, function (evt) {
		    cb(evt)();
		});
            };
	};
    };
}

export unsafeEventTarget = function (event) {
    return function  event.target;
    };
}

export unsafeStopPropagation = function (event) {
    return function () {
	event.stopPropagation();
    };
}

export unsafePreventDefault = function (event) {
    return function () {
	event.preventDefault();
    };
}

export unsafeEventKey = function (event) {
    return function() {
	return event.key === undefined
            ? String.fromCharCode(event.keyCode)
            : event.key;
    };
}

export unsafeEventKeyCode = function (event) {
    return function() {
	return event.keyCode;
    };
}

export unsafeEventNumberProp = function (prop) {
    return function (event) {
	return function() {
            return event[prop];
	};
    };
}

export unsafeEventStringProp = function (prop) {
    return function (event) {
	return function() {
            return event[prop];
	};
    };
}

export unsafeEventBooleanProp = function (prop) {
    return function (event) {
	return function() {
            return !!event[prop];
	};
    };
}

export unsafeEventView = function (event) {
    return function() {
	return event.view;
    };
}
