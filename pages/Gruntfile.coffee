module.exports = (grunt) ->
  "use strict"

  require("jit-grunt") grunt,
    haml: "grunt-haml-php"

  require("time-grunt") grunt

  grunt.initConfig
  
    clean:
      dist:
        src: ["build"]
  
    haml:
      dist:
        files:
          "templates/layout.html": "templates/src/layout.haml"
        options:
          bare: yes
          language: "coffee"
            
    compass:
      dist:
        options:
          cssDir: "templates"
          sassDir: "templates/src"
          outputStyle: "compressed"
          require: []
    
    watch:
      gruntfile:
        files: [
          "Gruntfile.coffee"
          "Gruntfile.js"
        ]
        tasks: ["default"]

      template:
        files: [
          "templates/src/**/*.haml"
        ]
        tasks: ["template"]
        options:
          livereload: yes

      style:
        files: [
          "templates/src/**/*.sass"
        ]
        tasks: ["style"]
        options:
          livereload: yes
    
  grunt.registerTask "default",  ["build", "watch"]
  grunt.registerTask "build",    ["clean", "template", "style"]
  grunt.registerTask "template", ["haml"]
  grunt.registerTask "style",    ["compass"]