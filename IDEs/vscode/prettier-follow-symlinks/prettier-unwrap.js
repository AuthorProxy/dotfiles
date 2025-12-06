#!/usr/bin/env node
'use strict';
const fs = require('fs').promises;
const { spawn } = require('child_process');

async function findLocalPrettier() {
  const candidates = [
    'prettier/bin-prettier.cjs',
    'prettier/bin-prettier.js',
    'prettier/bin-prettier.mjs',
  ];
  for (const c of candidates) {
    try {
      const resolved = require.resolve(c, { paths: [process.cwd()] });
      return { cmd: process.execPath, args: [resolved] };
    } catch (e) {
      // continue
    }
  }
  return null;
}

function runCommand(cmd, args) {
  const p = spawn(cmd, args, { stdio: 'inherit' });
  p.on('close', code => process.exit(code));
  p.on('error', err => {
    console.error('Failed to spawn:', err);
    process.exit(1);
  });
}

async function main() {
  const file = process.argv[2];
  if (!file) {
    console.error('Usage: prettier-unwrap.js <file-path>');
    process.exit(2);
  }

  try {
    const resolved = await fs.realpath(file);
    // prefer local prettier in workspace
    const local = await findLocalPrettier();
    console.log($`Resolve ${file} to ${resolved}`);
    if (local) {
      runCommand(local.cmd, [...local.args, '--write', resolved]);
      return;
    }

    // fallback to npx
    console.log($`Command to run "$prettier --write ${resolved}"`);
    runCommand('npx', ['prettier', '--write', resolved]);
  } catch (err) {
    console.error('Error resolving or formatting file:', err.message || err);
    process.exit(1);
  }
}

/*
  cd IDEs/vscode/prettier-follow-symlinks && \
  npx @vscode/vsce package -o prettier-unwrap-command-0.0.2.vsix && \
  code --install-extension prettier-unwrap-command-0.0.2.vsix --force
*/
main();
