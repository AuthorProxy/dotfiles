/* eslint-env node */

/* ECMAScript 6: http://eslint.org/docs/rules/#ecmascript-6 */
module.exports = {
  env: {
    es6: true
  },
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module'
  },
  rules: {
    // disallow duplicate imports
    'no-duplicate-imports': 'error',

    // suggest using const
    'prefer-const': 'error'
  }
};
