var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');
var markdox = require("gulp-markdox");
var mocha = require("gulp-mocha");
var ext_replace = require("gulp-ext-replace");
var rm = require( 'gulp-rm' );
var watch = require('gulp-watch');

gulp.task('lint-src', function () {
    gulp.src('./src/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter());
});

gulp.task('lint-test', function () {
    gulp.src('./test/unit/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter());
});

gulp.task('doc', function(){
  gulp.src("./src/*.coffee")
    .pipe(markdox())
    .pipe(gulp.dest("./doc/"));

});

gulp.task('doc', function(){
  gulp.src("./src/*.coffee")
    .pipe(markdox())
    .pipe(ext_replace('.md'))
    .pipe(gulp.dest("./doc/"));
});

gulp.task('rename', function(){
  gulp.src('./doc/*.coffee')
      .pipe(ext_replace('.md'))
      .pipe(gulp.dest('./doc'));
});

gulp.task('test', function () {
    return gulp.src('test/unit/*.coffee', {read: false})
        .pipe(mocha({reporter: 'nyan', require: 'coffee-script'}));
});

gulp.task('clean', function() {
  return gulp.src( './doc', { read: false })
    .pipe( rm() );
});

gulp.task('watch', function() {
  gulp.watch('./src/*.coffee', ['default']);
});



gulp.task('default', ['lint-src', 'lint-test', 'test']);
gulp.task('documentation', ['clean', 'lint-src', 'lint-test', 'doc']);
