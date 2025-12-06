# Prettier Unwrap Command

Small VS Code extension and helper that add the command "Prettier: Format (unwrap symlink)" to the Command Palette and a helper script to resolve symlinks before running Prettier.

What it does

- When invoked it runs the helper script `prettier-unwrap.js` which resolves the passed file path and then runs Prettier (prefers a local workspace Prettier when available).
- The extension contributes a command to the Command Palette which invokes the workspace task. The workspace task calls the helper script.

How to run it

1. Open this workspace in VS Code.
2. Press F5 (Run Extension) to open an Extension Development Host.
3. In the Extension Development Host, open a file and run the command:
   - Command Palette (Cmd/Ctrl+Shift+P) → `Prettier: Format (unwrap symlink)`

CLI usage

- Run the helper directly from shell:

  ```bash
  node IDEs/vscode/prettier-follow-symlinks/prettier-unwrap.js "/path/to/file"
  ```

Notes

- The included `tasks.json` is a convenience task file which points to the helper script. To use the task as a workspace task, copy it into `.vscode/tasks.json` or run it via the extension command from an Extension Development Host.
