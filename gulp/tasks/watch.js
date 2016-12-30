const gulp = require( 'gulp' );

gulp.task( 'watch', ['config'], function () {
  gulp.watch(['source/**/*', 'my_component/**/*'], ['webpack'] )
});