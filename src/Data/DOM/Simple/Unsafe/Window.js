/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Window

export unsafeDocument = function (win) {
    return function () {
	return win.document;
    };
}

export unsafeNavigator = function (win) {
    return function () {
	return win.navigator;
    };
}

export unsafeLocation = function (win) {
    return function () {
	return win.location;
    };
}

export unsafeGetLocation = function (loc) {
    return function () {
	return loc;
    };
}

export unsafeSetLocation = function (value) {
    return function (loc) {
	return function () {
            location.assign(value);
	};
    };
}

export unsafeGetSearchLocation = function (loc) {
    return function () {
	return loc.search;
    };
}

export unsafeSetTimeout = function (win) {
    return function(delay) {
	return function(func) {
            return function() {
		return win.setTimeout(func, delay);
            };
	};
    };
}

export unsafeSetInterval = function (win) {
    return function(delay) {
	return function(func) {
            return function() {
		return win.setInterval(func, delay);
            };
	};
    };
}

export unsafeClearTimeout = function (win) {
    return function(timeout) {
	return function() {
            win.clearTimeout(timeout);
	};
    };
}

export unsafeInnerWidth = function (win) {
    return function() {
	return win.innerWidth;
    };
}

export unsafeInnerHeight = function (win) {
    return function() {
	return win.innerHeight;
    };
}
