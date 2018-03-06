/* eslint-env node */

/* Best Practices: http://eslint.org/docs/rules/#best-practices */
module.exports = {
  rules: {
    // enforces return statements in callbacks of array’s methods
    'array-callback-return': 'error',

    // limit cyclomatic complexity
    complexity: ['warn', 20],

    // require following curly brace conventions
    curly: 'error',

    // require default case in switch statements
    'default-case': ['error', { commentPattern: '^skip\\sdefault' }],

    // require === and !==
    eqeqeq: 'error',

    // disallow empty functions
    'no-empty-function': 'error',

    // disallow null comparisons
    'no-eq-null': 'error',

    // disallow variable and function declarations in the global scope
    'no-implicit-globals': 'error',

    // disallow this keywords outside of classes or class-like objects
    'no-invalid-this': 'error',

    // disallow magic numbers
    'no-magic-numbers': ['error', {
      ignore: [1],
      ignoreArrayIndexes: true,
      enforceConst: true
    }],

    // disallow multiple spaces
    'no-multi-spaces': 'error',

    // disallow reassignment of function parameters
    'no-param-reassign': ['error', { props: true }],

    // disallow variable redeclaration
    'no-redeclare': ['error', { builtinGlobals: true }],

    // disallow certain object properties
    'no-restricted-properties': ['error', {
      object: 'arguments',
      message: 'Any arguments props are deprecated, use ES6 syntax instead'
    }, {
      property: 'extend',
      message: 'Use Object.assign instead.'
    }, {
      property: '__defineGetter__',
      message: 'Use Object.defineProperty instead.'
    }, {
      property: '__defineSetter__',
      message: 'Use Object.defineProperty instead.'
    }, {
      object: 'Math',
      property: 'pow',
      message: 'Use the exponentiation operator (**) instead.'
    }],

    // disallow self assignment
    'no-self-assign': ['error', { props: true }],

    // disallow unnecessary .call() and .apply()
    'no-useless-call': 'error',

    // disallow warning comments
    'no-warning-comments': 'warn',

    // require using error objects as promise rejection reasons
    'prefer-promise-reject-errors': 'error'
  }
};
