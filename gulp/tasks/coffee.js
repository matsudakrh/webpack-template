const gulp = require( 'gulp' );
const coffee = require( 'gulp-coffee' );

gulp.task( 'config', function () {
  gulp.src( './config/webpack.config.coffee' )
     .pipe( coffee() )
     .pipe( gulp.dest( './' ) )
} );