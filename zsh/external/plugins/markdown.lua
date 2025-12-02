return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      local presets = require("markview.presets")
      require("markview").setup({
        preview = {
          enable = true,
        },
        markdown = {
          headings = presets.headings.glow_center,
        },
      })
    end,
  },
}
