/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Document

export unsafeTitle = function (src) {
    return function () {
	return src.title;
    };
}

export unsafeSetTitle = function (value) {
    return function (src) {
	return function .title = value;
	};
    };
}

export unsafeBody = function (src) {
    return function () {
	return src.body;
    };
}

export unsafeSetBody = function (value) {
    return function (src) {
	return function () {
            src.body = value;
	};
    };
}
