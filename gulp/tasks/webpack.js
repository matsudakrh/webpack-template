const gulp = require( 'gulp' );
const exec = require( 'gulp-exec' );

gulp.task( 'webpack', function () {
  gulp.src('./**/*')
     .pipe( exec('webpack'));
});