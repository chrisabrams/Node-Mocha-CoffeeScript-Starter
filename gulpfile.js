var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');
var markdox = require("gulp-markdox");
var mocha = require("gulp-mocha");

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

gulp.task('coverage', function () {
    return gulp.src('test/unit/*.coffee', {read: false})
        .pipe(mocha({reporter: 'html-cov', require: 'foo'}));
});
