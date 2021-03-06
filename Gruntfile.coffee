module.exports = (grunt) ->
  grunt.initConfig
    ts:
        options:
            compile: true
            removeComments: false
            target: 'es5'
            module: 'amd'
            noImplicitAny: true
            suppressImplicitAnyIndexErrors: true
            sourceMap: false
            htmlModuleTemplate: 'static.<%= filename %>'
            htmlVarTemplate: 'data'
        default:
            src: ['nova/**/*.ts', 'tests/**/*.ts']
            html: ['nova/**/*.html', 'tests/**/*.html', 'nova/**/*.css', 'tests/**/*.css']
    typedoc:
        default:
            options:
                module: 'amd'
                out: './gh-pages/docs'
                name: 'nova-toolkit'
                mode: 'modules'
                target: 'es6'
            src: ['nova/**/*.ts']
    express:
        watch:
            options:
                script: './tests/test-server.js'
                background: true
        nowatch:
            options:
                script: './tests/test-server.js'
                background: false
    watch:
         default:
             files: ['nova/**/*.ts', 'nova/**/*.html', 'nova/**/*.css', 'tests/**/*.ts', 'tests/**/*.html', 'tests/**/*.css']
             tasks: ['ts']
             options:
                  spawn: false
    open:
        watch:
            path: 'http://localhost:3000/node_modules/intern/client.html?config=tests/intern'
        nowatch:
            path: 'http://localhost:3000/node_modules/intern/client.html?config=tests/intern'
            options:
                delay: 500
    clean: ['nova/**/*.js', 'tests/**/*.js', 'nova/**/*.html.ts', 'tests/**/*.html.ts', 'nova/**/*.css.ts', 'tests/**/*.css.ts']
    requirejs:
        default:
            options:
                appDir: "/nova"
                baseUrl: ".."
                dir: "release/"
                modules: [
                    {
                        name: "release/nova/nova",
                        create: true,
                        include: do () ->
                            releaseIncludes = []
                            tsConfig = grunt.file.readJSON('tsconfig.json')
                            for filepath in tsConfig.files
                                if filepath.indexOf(".ts") isnt -1 && filepath.indexOf(".d.ts") is -1 && filepath.indexOf("nova/") isnt -1
                                    releaseIncludes.push filepath.replace /(\.\/)|(\.ts)/g, ""
                            return releaseIncludes
                    }
                ]
    tslint:
        options:
                configuration: grunt.file.readJSON('tslint.json')
        default:
                src: ['nova/**/*.ts', 'tests/**/*.ts']

  ends = (string, literal, back) ->
     len = literal.length
     literal is string.substr string.length - len - (back or 0), len

  grunt.event.on 'watch', (action, filepath) ->
    if ends(filepath, ".html") || ends(filepath, ".css")
        grunt.config.set('ts.default.src', [])
        grunt.config.set('ts.default.html', filepath)
    else
        grunt.config.set('ts.default.src', filepath)

  grunt.loadNpmTasks 'grunt-tslint'
  grunt.loadNpmTasks 'grunt-ts'
  grunt.loadNpmTasks 'grunt-typedoc'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  grunt.registerTask 'default', ['clean', 'tslint', 'typedoc', 'ts']
  grunt.registerTask 'doc', ['typedoc']
  grunt.registerTask 'lint', ['tslint']
  grunt.registerTask 'transpile', ['clean', 'tslint', 'ts']
  grunt.registerTask 'dev', ['clean', 'ts', 'express:watch', 'open:watch', 'watch']
  grunt.registerTask 'dev:nowatch', ['clean', 'ts', 'open:nowatch', 'express:nowatch']
  grunt.registerTask 'release', ['clean', 'tslint', 'ts', 'requirejs']
