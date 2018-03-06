/* eslint-env node */

/* Stylistic Issues: http://eslint.org/docs/rules/#stylistic-issues */
module.exports = {
  rules: {
    // require brace style
    'brace-style': 'error',

    // require camelcase
    camelcase: 'error',

    // enforce or disallow capitalization of the first letter of a comment
    'capitalized-comments': ['error', 'never'],

    // require or disallow trailing commas
    'comma-dangle': 'error',

    // require consistent this
    'consistent-this': 'error',

    // require function names to match the name of the variable or property to which they are assigned
    'func-name-matching': ['warn', { includeCommonJSModuleExports: true }],

    // require or disallow named function expressions
    'func-names': ['warn', 'as-needed'],

    // enforce the consistent use of either function declarations or expressions
    'func-style': ['warn', 'expression', { allowArrowFunctions: true }],

    // disallow specified identifiers
    'id-blacklist': ['error', 'xxx', 'yyy', 'zzz', 'ttt', 'temp'],

    // enforce minimum and maximum identifier lengths
    'id-length': ['warn', { exceptions: ['e', 'i', 'j'] }],

    // enforce consistent indentation
    indent: ['error', 2, {
      SwitchCase: 1,
      VariableDeclarator: 1,
      outerIIFEBody: 1,
      MemberExpression: 1,
      FunctionDeclaration: {
        parameters: 1,
        body: 1
      },
      FunctionExpression: {
        parameters: 1,
        body: 1
      },
      CallExpression: {
        arguments: 1
      },
      ArrayExpression: 1,
      ObjectExpression: 1,
      ImportDeclaration: 1,
      flatTernaryExpressions: false,
      ignoredNodes: [
        'JSXElement',
        'JSXElement > *',
        'JSXAttribute',
        'JSXIdentifier',
        'JSXNamespacedName',
        'JSXMemberExpression',
        'JSXSpreadAttribute',
        'JSXExpressionContainer',
        'JSXOpeningElement',
        'JSXClosingElement',
        'JSXText',
        'JSXEmptyExpression',
        'JSXSpreadChild'
      ],
      ignoreComments: false
    }],

    // enforce the consistent use of either double or single quotes in jsx attributes
    'jsx-quotes': 'error',

    // enforce position of line comments
    'line-comment-position': 'error',

    // enforce consistent linebreak style
    'linebreak-style': ['off', 'windows'], // TODO: airbnb unix investigate later

    // require empty lines around comments
    'lines-around-comment': ['error', {
      beforeBlockComment: true,
      beforeLineComment: true,
      allowBlockStart: true,
      allowObjectStart: true,
      allowArrayStart: true
    }],

    // enforce a maximum depth that blocks can be nested
    'max-depth': ['warn', 5],

    // enforce a maximum line length
    'max-len': ['error', 120, 2, {
      ignoreUrls: true,
      ignoreComments: false,
      ignoreStrings: false,
      ignoreTemplateLiterals: false,
      ignoreRegExpLiterals: true
    }],

    // enforce a maximum file length
    'max-lines': ['warn', {
      max: 500,
      skipBlankLines: true,
      skipComments: true
    }],

    // enforce a maximum depth that callbacks can be nested
    'max-nested-callbacks': ['warn', 15],

    // enforce a maximum number of parameters in function definitions
    'max-params': ['warn', 5],

    // enforce a maximum number of statements allowed per line
    'max-statements-per-line': 'error',

    // enforce a maximum number of statements allowed in function blocks
    'max-statements': ['error', 15, { 'ignoreTopLevelFunctions': true }],

    // enforce a particular style for multiline comments
    'multiline-comment-style': 'error',

    // enforce or disallow newlines between operands of ternary expressions
    'multiline-ternary': : ['error', 'always-multiline'],

    // require constructor names to begin with a capital letter
    'new-cap': ['error', {
      newIsCapExceptions: ['$.telerik.stringBuilder', 'CKEDITOR.dialogCommand'],
      capIsNewExceptions: [
        'window.CollectGarbage',
        'Immutable.Map',
        'Immutable.Set',
        'Immutable.List'
      ]
    }],

    // require or disallow an empty line after variable declarations
    // REMARK: should be added 'ignore' option for some cases,
    // such as single line var
    'newline-after-var': 'off',

    // disallow mixes of different operators
    // TODO: check why airbnb disable 'allowSamePrecedence' option. Specially check for '+-' and '&&||' pairs.
    'no-mixed-operators': 'error',

    // disallow multiple empty lines
    // TODO: check for default options 'maxEOF' and 'maxBOF'
    'no-multiple-empty-lines': ['error', {
      max: 2,
      maxEOF: 1,
      maxBOF: 0
    }],

    // disallow negated conditions
    'no-negated-condition': 'error',

    // enforce consistent line breaks inside braces
    'object-curly-newline': ['error', {
      ObjectExpression: { minProperties: 2, multiline: true, 'consistent': true },
      ObjectPattern: { minProperties: 2, multiline: true, 'consistent': true }
    }],

    // require or disallow newlines around variable declarations
    'one-var-declaration-per-line': 'error',

    // enforce variables to be declared either together or separately in functions
    'one-var': ['error', { initialized: 'never', uninitialized: 'always' }],

    // require or disallow padding lines between statements
    'padding-line-between-statements': [
      'error',
      { blankLine: 'always', prev: ['const', 'let', 'var'], next: '*'},
      { blankLine: 'any', prev: ['const', 'let', 'var'], next: ['const', 'let', 'var']}
      { blankLine: 'never', prev: ['const', 'let', 'var'], next: 'return' },
      { blankLine: 'always', prev: ['import', 'directive', 'cjs-import'], next: '*' },
      { blankLine: 'any', prev: ['import', 'directive', 'cjs-import'], next: ['import', 'directive', 'cjs-import'] },
      { blankLine: 'always', prev: '*', next: 'debugger' },
      { blankLine: 'always', prev: 'debugger', next: '*' }
    ],

    // require quotes around object literal property names
    'quote-props': ['error', 'as-needed', { 'keywords': true, 'numbers': true }],

    // enforce the consistent use of either backticks, double, or single quotes
    // TODO: check airbnb style guide for ignoring 'allowTemplateLiterals'
    quotes: ['error', 'single', { avoidEscape: true, allowTemplateLiterals: true }]
  }
};
