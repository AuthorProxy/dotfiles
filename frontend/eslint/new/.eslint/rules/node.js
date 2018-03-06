/* eslint-env node */

/* Node.js and CommonJS: http://eslint.org/docs/rules/#nodejs-and-commonjs */
module.exports = {
  env: {
    node: true
  },
  rules: {
    // enforce return after a callback
    'callback-return': 'warn',

    // enforce callback error handling
    'handle-callback-err': ['warn', '^(err|error)$'],

    // disallow require calls to be mixed with regular variable declarations
    'no-mixed-requires': 'error',

    // disallow process.env
    'no-process-env': 'error',

    // disallow process.exit()
    'no-process-exit': 'error',

    // disallow synchronous methods
    'no-sync': 'error'
  }
};
