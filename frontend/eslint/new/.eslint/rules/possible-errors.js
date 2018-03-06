/* eslint-env node */

/* Possible Errors: http://eslint.org/docs/rules/#possible-errors */
module.exports = {
  rules: {
    // enforce return statements in getters
    'getter-return': 'error',

    // disallow constant expressions in conditions
    'no-constant-condition': 'error',

    // disallow unnecessary parentheses
    'no-extra-parens': 'error',

    // disallow variable or function declarations in nested blocks
    'no-inner-declarations': ['error', 'both'],

    // disallow irregular whitespace
    // TODO: check and delete default options
    'no-irregular-whitespace': ['error', {
      skipStrings: false,
      skipComments: false,
      skipRegExps: false,
      skipTemplates: false
    }],

    // enforce valid JSDoc comments
    'valid-jsdoc': ['warn', { "requireReturn": false }]
  }
};
