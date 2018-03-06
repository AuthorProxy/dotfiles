/* eslint-env node */

/* Variables: http://eslint.org/docs/rules/#variables */
module.exports = {
  rules: {
    // disallow shadowing of variables inside of catch
    'no-catch-shadow': 'warn',

    // disallow declaration of variables already declared in the outer scope
    'no-shadow': ['error', { builtinGlobals: true }],

    // disallow unused variables
    // TODO: check if any problens with ignoreRestSiblings
   'no-unused-vars': ['error', {
      vars: 'all',
      args: 'after-used',
      ignoreRestSiblings: false
    }]
  }
};
