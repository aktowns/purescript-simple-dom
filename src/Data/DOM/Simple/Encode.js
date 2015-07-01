/* global exports */
"use strict";

// module Data.Dom.Simple.Encode

export encodeURIComponent = function (uri) {
    return encodeURIComponent(uri);
}

export decodeURIComponent = function (uri) {
    return decodeURIComponent(uri);
}

export encodeURI = function (uri) {
    return encodeURI(uri);
}

export decodeURI = function (uri) {
    return decodeURI(uri);
}

export paramatize = function (obj) {
    return Object.keys(obj).map(function(key) {
	return key + '=' + encodeURIComponent(obj[key]);
    }).join('&');
}

export toJsonString = function (obj) {
    return function () {
	return JSON.stringify(obj);
    };
}


