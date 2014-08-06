var Browser = require("zombie");
var assert = require("assert");

Browser.visit("file://" + __dirname + "/../tests/test.html", function (e, browser, status) {
  window = browser.document.window;
  require("Main").main();
});
