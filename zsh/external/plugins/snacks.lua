return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          auto_close = true,
          layout = {
            preset = "sidebar",
            preview = "main",
          },
        },
      },
    },

    explorer = {
      hidden = false,
      ignored = true,
      auto_close = true,
      layout = {
        preset = "sidebar",
        preview = "main",
      },
    },
  },
}
