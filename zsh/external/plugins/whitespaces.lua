return {
  "mcauley-penney/visual-whitespace.nvim",
  event = "ModeChanged *:[vV\\22]", -- optionally, lazy load on entering visual mode
  match_types = {
    space = true,
    tab = true,
    nbsp = true,
    lead = false,
    trail = false,
  },
}
