module.exports = function(grunt) {

  "use strict";

  grunt.initConfig({

    libFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs"
    ],

    ffiFiles: [
      "src/**/*.js"
    ],

    clean: ["tmp", "output"],

    pscMake: {
      lib: {
        src: ["<%=libFiles%>"]
      },
      tests: {
        src: ["tests/Tests.purs", "<%=libFiles%>"]
      }
    },

    dotPsci: ["<%=libFiles%>"],

    pscDocs: {
      readme: {
        src: ["src/**/*.purs"],
        dest: "API.md"
      }
    },

    copy: [
      {
        expand: true,
        cwd: "output",
        src: ["**"],
        dest: "tmp/node_modules/"
      }, {
        src: ["js/index.js"],
        dest: "tmp/index.js"
      }
    ],

    execute: {
      tests: {
        src: "tmp/index.js"
      }
    }
  });

  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-execute");
  grunt.loadNpmTasks("grunt-purescript");

  grunt.registerTask("test", ["pscMake:tests", "copy", "execute:tests"]);
  grunt.registerTask("make", ["pscMake:lib", "pscDocs", "dotPsci"]);
  grunt.registerTask("default", ["clean", "make", "test"]);
};
