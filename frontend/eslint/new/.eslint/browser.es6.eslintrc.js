/* eslint-env node */

module.exports = {
  extends: [
    './browser.es5.eslintrc',
    './rules/es6'
  ].map(require.resolve),
  parser: 'babel-eslint',
  parserOptions: {
    ecmaFeatures: {
      impliedStrict: true
    }
  }
};
