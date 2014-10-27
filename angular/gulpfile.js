'use strict';

var gulp       = require('gulp'),
    gutil      = require('gulp-util'),
    uglify     = require('gulp-uglify'),
    sass       = require('gulp-ruby-sass'),
    coffee     = require('gulp-coffee'),
    concat     = require('gulp-concat'),
    livereload = require('gulp-livereload'),
    lr         = require('tiny-lr'),
    server     = lr();

gulp.task('sass', function () {
  gulp.src('app/assets/scss/*.scss')
    .pipe(sass())
    .pipe(concat('application.css'))
    .pipe(gulp.dest('src'));
});

gulp.task('coffee', function () {
  gulp.src('app/**/*.coffee')
  .pipe(coffee({ bare: true })
    .on('error', gutil.log))
  .pipe(concat('application.js'))
  .pipe(gulp.dest('src'));
});

gulp.task('watch', function () {
  var server = livereload();
  gulp.watch('app/assets/scss/*.scss', ['sass']);
  gulp.watch('app/**/*.coffee', ['coffee']);
  gulp.watch(['application.css', 'application.js', 'src/*.html'], function (e) {
    server.changed(e.path);
  });
});

gulp.task('default', [ 'sass', 'coffee', 'watch']);
