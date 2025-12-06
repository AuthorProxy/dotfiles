const vscode = require('vscode');
const { spawn } = require('child_process');
const fs = require('fs').promises;
const path = require('path');

// Output channel for debug logging (initialized in activate)
let outputChannel = null;

const PRETTIER_BIN_CANDIDATES = [
  'prettier/bin-prettier.cjs',
  'prettier/bin-prettier.js',
  'prettier/bin-prettier.mjs',
];

async function findLocalPrettier(workspaceFolder) {
  for (const c of PRETTIER_BIN_CANDIDATES) {
    try {
      const resolved = require.resolve(c, { paths: [workspaceFolder] });
      return { cmd: process.execPath, args: [resolved] };
    } catch (e) {
      // ignore
    }
  }
  return null;
}

function runPrettierProcess(command, args, input) {
  return new Promise((resolve, reject) => {
    const proc = spawn(command, args);
    let stdout = '';
    let stderr = '';
    proc.stdout.on('data', b => {
      const s = b.toString();
      if (outputChannel) outputChannel.append(s);
      stdout += s;
    });
    proc.stderr.on('data', b => {
      const s = b.toString();
      if (outputChannel) outputChannel.append(s);
      stderr += s;
    });
    proc.on('error', err => reject(err));
    proc.on('close', code => resolve({ code, stdout, stderr }));
    if (input) {
      proc.stdin.write(input);
    }
    proc.stdin.end();
  });
}

async function formatTextWithPrettier(document, preferLocal = true) {
  const filePath = document.uri.fsPath;
  let resolvedPath = filePath;
  try {
    resolvedPath = await fs.realpath(filePath);
  } catch (e) {
    // fallback to original path
  }

  if (outputChannel) {
    outputChannel.appendLine(`Formatting request for: ${filePath}`);
    if (resolvedPath !== filePath) {
      outputChannel.appendLine(`Resolved symlink to: ${resolvedPath}`);
    }
  }

  const workspaceFolder =
    (vscode.workspace.getWorkspaceFolder(document.uri) || {}).uri?.fsPath || process.cwd();

  let local = null;
  if (preferLocal) {
    try {
      local = await findLocalPrettier(workspaceFolder);
    } catch (e) {
      local = null;
    }
  }

  const args = ['--stdin-filepath', resolvedPath];

  if (local) {
    // local resolved is a file path to the CLI script; run with node
    const { cmd, args: localArgs } = local;
    const runArgs = [...localArgs, ...args];
    if (outputChannel)
      outputChannel.appendLine(`Using local Prettier: ${cmd} ${runArgs.join(' ')}`);
    return runPrettierProcess(cmd, runArgs, document.getText());
  }

  // fallback to npx prettier --stdin-filepath <path>
  if (outputChannel)
    outputChannel.appendLine(`Falling back to global 'npx prettier' with args: ${args.join(' ')}`);
  return runPrettierProcess('npx', ['prettier', ...args], document.getText());
}

/**
 * Replace full document content with formatted output
 */
function makeFullRange(document) {
  const lastLine = document.lineCount - 1;
  const lastLineLength = document.lineAt(lastLine).text.length;
  return new vscode.Range(0, 0, lastLine, lastLineLength);
}

async function provideFormattingEdits(document) {
  const result = await formatTextWithPrettier(document);
  if (result.code !== 0) {
    const msg = result.stderr || 'Prettier failed with exit code ' + result.code;
    vscode.window.showErrorMessage('Prettier unwrap: ' + msg);
    return [];
  }
  const formatted = result.stdout;
  if (!formatted) return [];
  return [vscode.TextEdit.replace(makeFullRange(document), formatted)];
}

/** Activate */
function activate(context) {
  try {
    outputChannel = vscode.window.createOutputChannel('Prettier Unwrap');
    context.subscriptions.push(outputChannel);
    outputChannel.appendLine('Activating Prettier Unwrap extension');
  } catch (e) {
    // ignore if output channel cannot be created
  }

  // Register command for manual invocation
  const cmd = vscode.commands.registerCommand('prettierUnwrap.format', async () => {
    if (outputChannel) outputChannel.appendLine('Command prettierUnwrap.format invoked');
    const editor = vscode.window.activeTextEditor;
    if (!editor) {
      vscode.window.showInformationMessage('No active editor');
      if (outputChannel) outputChannel.appendLine('No active editor; aborting format');
      return;
    }
    let edits;
    try {
      edits = await provideFormattingEdits(editor.document);
    } catch (err) {
      if (outputChannel)
        outputChannel.appendLine(
          'Error in provideFormattingEdits: ' + (err && err.stack ? err.stack : String(err)),
        );
      throw err;
    }
    if (edits && edits.length) {
      const workEdit = new vscode.WorkspaceEdit();
      workEdit.set(editor.document.uri, edits);
      await vscode.workspace.applyEdit(workEdit);
      await editor.document.save();
      if (outputChannel) outputChannel.appendLine('Applied edits and saved document');
    }
  });

  context.subscriptions.push(cmd);

  // Register formatting provider for common languages
  const selector = [
    { language: 'javascript', scheme: 'file' },
    { language: 'typescript', scheme: 'file' },
    { language: 'json', scheme: 'file' },
    { language: 'jsonc', scheme: 'file' },
    { language: 'markdown', scheme: 'file' },
    { language: 'css', scheme: 'file' },
    { language: 'scss', scheme: 'file' },
    { language: 'html', scheme: 'file' },
    { language: 'vue', scheme: 'file' },
    { language: 'yaml', scheme: 'file' },
  ];

  const provider = {
    provideDocumentFormattingEdits: async document => {
      try {
        if (outputChannel)
          outputChannel.appendLine(
            `provideDocumentFormattingEdits called for ${document.uri.fsPath}`,
          );
        const res = await provideFormattingEdits(document);
        if (outputChannel)
          outputChannel.appendLine(
            `provideDocumentFormattingEdits completed; edits: ${res ? res.length : 0}`,
          );
        return res;
      } catch (e) {
        vscode.window.showErrorMessage(
          'Prettier unwrap error: ' + (e && e.message ? e.message : String(e)),
        );
        if (outputChannel)
          outputChannel.appendLine(
            'Exception in formatting provider: ' + (e && e.stack ? e.stack : String(e)),
          );
        return [];
      }
    },
  };

  for (const s of selector) {
    context.subscriptions.push(
      vscode.languages.registerDocumentFormattingEditProvider(s, provider),
    );
  }
}

function deactivate() {}

module.exports = { activate, deactivate };
