var errorHandler = function(e) {
  gutil.log('Some errors were occured!', e);
  console.error(e);
};

gulp.task('lint-jshint', function() {
  return gulp.src(paths.scripts)
    .pipe($.jshint())
    .pipe($.jshint.reporter('jshint-stylish', { verbose: true }))
    .pipe($.jshint.reporter('fail'))
    .on('error', errorHandler);
});

gulp.task('lint-jscs', function() {
  return gulp.src(paths.scripts)
    .pipe($.jscs())
    .pipe($.jscs.reporter())
    .pipe($.jscs.reporter('fail'))
    .on('error', errorHandler);
});

gulp.task('lint-jscs-fix', function() {
  return gulp.src(paths.scripts, { base: './' })
    .pipe($.jscs({ fix: true }))
    .pipe($.jscs.reporter())
    .pipe(gulp.dest('.'))
    .on('error', errorHandler);
});

gulp.task('assets:js', function() {
  return gulp.src(paths.scripts, { base: './' })
    .pipe($.sourcemaps.init({ loadMaps: true, debug: true }))
    .pipe($.rename({ suffix: '.min' }))
    .pipe($.uglify())
    .on('error', errorHandler)
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('.'));
});
