pr-checkout() {
  local pr_number
  pr_number=$(gh pr list --limit 50 --state open --json number,title --template '{{range .}}{{.number}}: {{.title}}{{"\n"}}{{end}}' | fzf --ansi --preview "gh pr view {1}" --preview-window=down:3:wrap | cut -d':' -f1)
  if [ -n "$pr_number" ]; then
    gh pr checkout "$pr_number"
  fi
}
