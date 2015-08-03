/* jshint node: true */
"use strict";

var gulp = require("gulp");
var jshint = require("gulp-jshint");
var jscs = require("gulp-jscs");
var plumber = require("gulp-plumber");
var purescript = require("gulp-purescript");
var run = require("gulp-run");
var rimraf = require("rimraf");

var sources = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs",
  "tests/Tests.purs"
];

var foreigns = [
  "src/**/*.js",
  "bower_components/purescript-*/src/**/*.js",
  "tests/Tests.js"
];

gulp.task("clean-docs", function (cb) {
  rimraf("docs", cb);
});

gulp.task("clean-output", function (cb) {
  rimraf("output", cb);
});

gulp.task("make", ["clean-output", "lint"], function() {
  return purescript.psc({ src: sources, ffi: foreigns });
});

gulp.task("test", ["test-copy-modules", "test-copy-runner"], function() {
  require("./tmp/index");
});

gulp.task("test-copy-modules", ["make"], function() {
  return gulp.src("output/**/*.js")
    .pipe(gulp.dest("tmp/node_modules/"));
});

gulp.task("test-copy-runner", function() {
  return gulp.src("js/index.js")
    .pipe(gulp.dest("tmp/"));
});

gulp.task("docs", ["clean-docs"], function () {
  return purescript.pscDocs({
      src: sources,
      docgen: {
        "Data.DOM.Simple.Ajax" :              "docs/Data/DOM/Simple/Ajax.md",
        "Data.DOM.Simple.Document" :          "docs/Data/DOM/Simple/Document.md",
        "Data.DOM.Simple.Element" :           "docs/Data/DOM/Simple/Element.md",
        "Data.DOM.Simple.Encode" :            "docs/Data/DOM/Simple/Encode.md",
        "Data.DOM.Simple.Events" :            "docs/Data/DOM/Simple/Events.md",
        "Data.DOM.Simple.Navigator" :         "docs/Data/DOM/Simple/Navigator.md",
        "Data.DOM.Simple.NodeList" :          "docs/Data/DOM/Simple/NodeList.md",
        "Data.DOM.Simple.Sugar" :             "docs/Data/DOM/Simple/Sugar.md",
        "Data.DOM.Simple.Types" :             "docs/Data/DOM/Simple/Types.md",
        "Data.DOM.Simple.Window" :            "docs/Data/DOM/Simple/Window.md",
        "Data.DOM.Simple.Unsafe.Ajax" :       "docs/Data/DOM/Simple/Unsafe/Ajax.md",
        "Data.DOM.Simple.Unsafe.Document" :   "docs/Data/DOM/Simple/Unsafe/Document.md",
        "Data.DOM.Simple.Unsafe.Element" :    "docs/Data/DOM/Simple/Unsafe/Element.md",
        "Data.DOM.Simple.Unsafe.Events" :     "docs/Data/DOM/Simple/Unsafe/Events.md",
        "Data.DOM.Simple.Unsafe.Navigator" :  "docs/Data/DOM/Simple/Unsafe/Navigator.md",
        "Data.DOM.Simple.Unsafe.NodeList" :   "docs/Data/DOM/Simple/Unsafe/NodeList.md",
        "Data.DOM.Simple.Unsafe.Sugar" :      "docs/Data/DOM/Simple/Unsafe/Sugar.md",
        "Data.DOM.Simple.Unsafe.Window" :     "docs/Data/DOM/Simple/Unsafe/Window.md"
      }
    });
});

gulp.task("lint", function() {
  return gulp.src("src/**/*.js")
    .pipe(jshint())
    .pipe(jshint.reporter())
    .pipe(jscs());
});

gulp.task("default", ["make", "test", "docs"]);
