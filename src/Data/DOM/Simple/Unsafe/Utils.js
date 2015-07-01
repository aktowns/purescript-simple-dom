/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Utils

export ensure3 = function (nothing) {
    return function(just) {
	return function(v) {
            if (v === undefined || v === null) {
		return nothing;
            } else {
		return just(v);
            }
	};
    };
}

export showImpl = function (v) {
    return function () {
	return v.toString();
    };
}
