var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');

gulp.task('lint-src', function () {
    gulp.src('./src/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter())
});


gulp.task('lint-test', function () {
    gulp.src('./test/unit/*.coffee')
        .pipe(coffeelint())
        .pipe(coffeelint.reporter())
});

