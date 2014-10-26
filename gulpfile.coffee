gulp = require 'gulp'
gutil = require 'gulp-util'
connect = require 'gulp-connect'
clean = require 'gulp-clean'
sass = require 'gulp-sass'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'

sassOptions =
  sourceComments: 'normal'
  errLogToConsole: true

connectOptions =
  root: 'dist'
  livereload: true

gulp.task 'clean', ->
  gulp.src 'dist', read: false
    .pipe clean(force: true)

gulp.task 'styles', ->
  gulp.src './src/sass/*.sass'
    .pipe sass(sassOptions)
    .pipe gulp.dest('./dist/css')
    .pipe connect.reload()

gulp.task 'js', ->
  gulp.src ['./src/coffee/services/**/*.coffee',
            './src/coffee/controllers/**/*.coffee',
            './src/coffee/main.coffee']
    .pipe coffee(bare: true).on('error', gutil.log)
    .pipe concat('app.js')
    .pipe gulp.dest('./dist/js')
    .pipe connect.reload()

gulp.task 'html', ->
  gulp.src './src/index.jade'
    .pipe jade()
    .pipe gulp.dest('./dist')

gulp.task 'static', ->
  gulp.src './src/static/*'
    .pipe gulp.dest('./dist/static')
    .pipe connect.reload()

gulp.task 'vendor', ->
  gulp.src './third-party/*'
    .pipe gulp.dest('./dist/third-party')

gulp.task 'connect', -> connect.server connectOptions

gulp.task 'watch', ->
  gulp.watch ['./src/**'], ['default']

gulp.task 'default', ['styles', 'js', 'html', 'static', 'vendor']
