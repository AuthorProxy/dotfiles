/// <binding AfterBuild='default' Clean='clean' />

var fs = require('fs');
var del = require('del');
var gulp = require('gulp');
var chalk = require('chalk');
var bs = require('browser-sync');
var merge = require('merge-stream');
var es6Promise = require('es6-promise');
es6Promise.polyfill();

var $ = require('gulp-load-plugins')();
var argv = require('yargs').argv;
var project = JSON.parse(fs.readFileSync('../package.json'));

var config = {
  name: project.name,
  version: project.version,
  environment: 'development',
  commit: process.env.BUILD_SOURCEVERSION || '0',
  branchName: process.env.BUILD_SOURCEBRANCHNAME || '',
  buildNumber: process.env.BUILD_BUILDNUMBER || ''
};

// Nodejs arguments
if (process.env.NODE_ENV && (process.env.NODE_ENV.toLowerCase() === 'production' || process.env.NODE_ENV.toLowerCase() === 'release')) {
  config.environment = 'production';
}

// Gulp arguments
if (argv.env && (argv.env.toLowerCase() === 'production' || argv.env.toLowerCase() === 'release')) {
  config.environment = 'production';
}

var AUTOPREFIXER_BROWSERS = [
  'ie >= 8',
  '> 3%',
  'last 3 version'
];

var destPaths = {
  scripts: 'Scripts/build',
  styles: 'Content/build',
  images: 'Content/build'
  //images: 'Content/build/images'
};

var paths = {
  scripts1: [
    'Scripts/**/*.js',
  ],
  scripts2: [
    'Content/codemirror/lib/codemirror.js',
    'Content/codemirror/mode/clike/clike.js',
    'Content/codemirror/mode/sql/sql.js',
    'Content/codemirror/mode/xml/xml.js',
    'Content/codemirror/mode/css/css.js',
    'Content/codemirror/mode/vb/vb.js',
    'Content/codemirror/mode/javascript/javascript.js',
    'Content/codemirror/mode/htmlmixed/htmlmixed.js',
    'Content/codemirror/mode/htmlembedded/htmlembedded.js',
    'Content/codemirror/addon/mode/multiplex.js',
    '!Scripts/build/**/*.js'
  ],
  styles: [
    'Content/**/.{sass, css}',
    '!Content/build/**/*.css'
  ],
  images: [
    'Content/**/*.{jpg,jpeg,png,gif}',
    '!Content/build/**/*.{jpg,jpeg,png,gif}'
  ],
  clean: [
    'Scripts/**/*.{min.js, map}',
    'Content/**/*.{min.css, map}',
    destPaths.styles,
    destPaths.scripts
  ]
};

var reportError = function(error) {
  $.notify({
    title: 'Task Failed [' + error.plugin  + ']',
    message: error.lineNumber ? 'Line: ' + error.lineNumber + ' -- ' : 'See console.',
    sound: 'Sosumi'
  }).write(error);

  var report = '';
  report += chalk.underline.bgRed('Task:') + ' [' + chalk.underline.bgCyan(error.plugin) + ']\n';
  if (error.fileName) {
    report += chalk.underline.bgRed('FileName:') + ' ' + chalk.underline.bgCyan(error.fileName) + '\n';
  }

  if (error.lineNumber) {
    report += chalk.underline.bgRed('LineNumber:') + ' ' + chalk.underline.bgCyan(error.lineNumber) + '\n';
  }

  report += chalk.underline.bgRed('Message:') + ' ' + error.message.replace('Error:', chalk.underline.bgRed('Error:')) + '\n';
  console.error(report);
  this.emit('end');
};

gulp.task('lint-jshint', function() {
  return gulp.src(paths.scripts)
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.jshint())
    .pipe($.jshint.reporter('jshint-stylish', { verbose: true }))
    .pipe($.jshint.reporter('fail'));
});

gulp.task('lint-jscs', function() {
  return gulp.src(paths.scripts)
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.jscs())
    .pipe($.jscs.reporter())
    .pipe($.jscs.reporter('fail'));
});

gulp.task('lint-jscs-fix', function() {
  return gulp.src(paths.scripts, { base: './' })
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.jscs({ fix: true }))
    .pipe($.jscs.reporter())
    .pipe(gulp.dest('.'))
    .pipe($.notify({ message: 'assets:js task complete' }));
});


gulp.task('assets:revisions', function() {
  var views = gulp.src('Views/Home/Index.base.cshtml')
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.replaceTask({
      patterns: [{
        match: 'version',
        replacement: config.version
      }]
    }))
    .pipe($.rename('Index.cshtml'))
    .pipe(gulp.dest('Views/Home/'));

    var assemblyFileVersion = config.version + '.' + 0;
    var assemblyDescription = 'Local builded at ' + new Date().toLocaleDateString();
    if (config.commit && config.buildNumber) {
      var splitted = config.buildNumber.split('.');
      assemblyFileVersion = config.version + '.' + splitted[splitted.length - 1];
      assemblyDescription = 'Server builded at ' +  config.buildNumber + ', Sha: ' + config.commit;
    }

    // TODO: Add local build tag from gulp-git
    var assemblyInfo = assemblyFileVersion + '+' + config.branchName + '.Sha.' + config.commit;

    var assemblies = gulp.src('Properties/AssemblyInfo.cs')
      .pipe($.plumber({ errorHandler: reportError }))
      .pipe($.dotnetAssemblyInfo({
        version: config.version,
        fileVersion: assemblyFileVersion,
        informationalVersion: assemblyInfo,
        description: assemblyDescription
      }))
      .pipe(gulp.dest('Properties/'));

  return merge(views, assemblies);
});

gulp.task('assets:js', ['assets:js1', 'assets:js2']);

gulp.task('assets:js1', ['assets:revisions'], function() {
  return gulp.src(paths.scripts1, { base: './' })
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.sourcemaps.init({ loadMaps: true, debug: true }))
    .pipe($.rename({ suffix: '.min' }))
    .pipe($.uglify())
    .pipe($.concat('app1.min.js'))
    .pipe($.sourcemaps.write('maps'))
    .pipe(gulp.dest(destPaths.scripts))
    .pipe($.size({ title: 'assets:js', showFiles: true }))
    .pipe($.notify({ title: 'Task was completed', message: 'assets:js1 task complete', onLast: true }));
});

gulp.task('assets:js2', ['assets:revisions'], function() {
  return gulp.src(paths.scripts2, { base: './' })
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.sourcemaps.init({ loadMaps: true, debug: true }))
    //.pipe($.rename({ suffix: '.min' }))
    .pipe($.uglify())
    .pipe($.concat('app2.min.js'))
    .pipe($.sourcemaps.write('maps'))
    .pipe(gulp.dest(destPaths.scripts))
    .pipe($.size({ title: 'assets:js', showFiles: true }))
    .pipe($.notify({ title: 'Task was completed', message: 'assets:js2 task complete', onLast: true }));
});

gulp.task('assets:img', function() {
  return gulp.src(paths.images)
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.newer(destPaths.images))
    .pipe($.imagemin({ optimizationLevel: 3, progessive: true, interlaced: true }))
    .pipe(gulp.dest(destPaths.images))
    .pipe($.notify({ title: 'Task was completed', message: 'assets:img task complete', onLast: true }));
});

gulp.task('assets:css', ['assets:revisions'], function() {
  return gulp.src(paths.styles)
    .pipe($.plumber({ errorHandler: reportError }))
    .pipe($.sourcemaps.init({ loadMaps: true, debug: true }))
    .pipe($.sass().on('error', bs.notify))
    .pipe($.replace(/url\(\'/g, 'url(\'images/'))
    .pipe($.autoprefixer({ browsers: AUTOPREFIXER_BROWSERS }))
    .pipe($.cssnano())
    .pipe($.concat('app.min.css'))
    .pipe($.sourcemaps.write('maps'))
    .pipe(gulp.dest(destPaths.styles))
    .pipe(bs.stream({ match: '**/*.css' }))
    .pipe($.size({ title: 'assets:css', showFiles: true }))
    .pipe($.notify({ title: 'Task was completed', message: 'assets:css task complete', onLast: true }));
});





gulp.task('clean', function() {
  return del(paths.clean);
});

gulp.task('browserSync', function() {
  bs.init([paths.styles], {
    proxy: 'http://localhost:90/Backend'
  });
});

gulp.task('watch', function() {
  var reportOnChage = function(event) {
    console.log('File ' + event.path + ' was ' + event.type + ', ' + chalk.underline.bgCyan('running tasks...'));
  };

  gulp.watch(paths.styles, ['assets:css']).on('change', reportOnChage);
});

gulp.task('serve', ['watch', 'browserSync']);


gulp.task('default', ['clean'], function() {
  var welcomeMsg = '\nGulp tasks were started in ' + chalk.blue.underline.yellow(config.environment) + ' mode. Version: ' + config.version + '.';
  console.log(welcomeMsg);
  $.notify({ title: welcomeMsg, message: 'gulp is running' }); // TODO: ne pashet

  gulp.start('assets:js', 'assets:css', 'assets:img');
});

// Install Steps:
// 1. Install external node js and npm from official site
// 2. Install global packages for npm runner: gulp, cross-env
// 3. Set priority for VS: https://blogs.msdn.microsoft.com/webdev/2015/03/19/customize-external-web-tools-in-visual-studio-2015/
