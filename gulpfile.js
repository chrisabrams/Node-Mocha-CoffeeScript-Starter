var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');
var markdox = require("gulp-markdox");
var mocha = require("gulp-mocha");
var ext_replace = require("gulp-ext-replace");
var rm = require( 'gulp-rm' );
var watch = require('gulp-watch');

var taskListing = require('gulp-task-listing');

// Add a task to render the output
gulp.task('help', taskListing);

// coffee lint over the source
gulp.task('lint-src', function () {
    gulp.src('./src/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter());
});

// coffee lint over the test code
gulp.task('lint-test', function () {
    gulp.src('./test/unit/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter());
});
// write the api docs
gulp.task('doc', function(){
  gulp.src("./src/*.coffee")
    .pipe(markdox())
    .pipe(ext_replace('.md'))
    .pipe(gulp.dest("./doc/"));
});
// run tests
gulp.task('test', function () {
    return gulp.src('test/unit/*.coffee', {read: false})
        .pipe(mocha({reporter: 'nyan', require: 'coffee-script'}));
});
// clean all build data
gulp.task('clean', function() {
  return gulp.src( './doc', { read: false })
    .pipe( rm() );
});
// watch coffee script files changing
gulp.task('watch', function() {
  gulp.watch(['./src/*.coffee', './test/unit/*.coffee'], ['default']);
});

gulp.task('default', ['lint-src', 'lint-test', 'test', 'doc']);
gulp.task('documentation', ['clean', 'lint-src', 'lint-test', 'doc']);
