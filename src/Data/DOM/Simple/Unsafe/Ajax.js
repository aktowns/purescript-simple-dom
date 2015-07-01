/* global exports */
"use strict";

// module Data.Dom.Simple.Unsafe.Ajax


export unsafeReadyState = function (obj) {
    return function () {
	return obj.readyState;
    };
}


export unsafeOnReadyStateChange = function (obj, fn) {
    return function () {
	obj.onreadystatechange = fn;
	return {};
    };
}


export unsafeOpen = function (obj, method, url) {
    return function () {
	obj.open(method, url);
	return {};
    };
}


export unsafeSend = function (obj) {
    return function () {
	obj.send();
	return {};
    };
}


export unsafeSendWithPayload = function (obj, payload) {
    return function () {
	obj.send(payload);
	return {};
    };
}


export unsafeSetResponseType = function (obj, rt) {
    return function () {
	obj.responseType = rt;
	return {};
    };
}


export unsafeResponseType = function (obj) {
    return function () {
	return obj.responseType;
    };
}


export unsafeResponse = function (obj) {
    return function () {
	return obj.response;
    };
}


export unsafeGetResponseHeader = function (obj, key) {
    return function () {
	return obj.getResponseHeader(key);
    };
}
