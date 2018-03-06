/* eslint-env node */

module.exports = {
  env: {
    browser: true,
    jquery: true
  },
  extends: [
    'airbnb',
    './rules/best-practices',
    './rules/possible-errors',
    './rules/strict-mode',
    './rules/stylistic-issues',
    './rules/variables'
  ].map(require.resolve),
  parser: 'espree',
  parserOptions: {
    ecmaVersion: 5,
    sourceType: 'script',
    ecmaFeatures: {
      impliedStrict: true
    }
  }
};
