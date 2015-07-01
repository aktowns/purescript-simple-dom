/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Navigator


export unsafeAppName =  function (navi) {
    return function () {
	return navi.appName;
    };
}

export unsafeAppVersion =  function (navi) {
    return function () {
	return navi.appName;
    };
}

export unsafeAppCodeName =  function (navi) {
    return function () {
	return navi.appCodeName;
    };
}

export unsafeLanguage =  function (navi) {
    return function () {
	return navi.language;
    };
}

export unsafePlatform =  function (navi) {
    return function () {
	return navi.platform;
    };
}

export unsafeProduct =  function (navi) {
    return function () {
	return navi.product;
    };
}

export unsafeUserAgent =  function (navi) {
    return function () {
	return navi.userAgent;
    };
}
