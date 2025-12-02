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
      hidden = true,
      ignored = true,
      auto_close = true,
      layout = {
        preset = "sidebar",
        preview = "main",
      },
    },

    dashboard = {
      preset = {
        -- https://patorjk.com/software/taag/#p=display&f=DOS+Rebel&t=ProxyVIM&x=none&v=4&h=4&w=80&we=false
        -- https://www.asciiart.eu/text-to-ascii-art
        header = [[
 _____                                                                                         _____
( ___ )                                                                                       ( ___ )
 |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   |
 |   |  .______   .______     ______   ___   ___ ____    ____    ____    ____  __  .___  ___.  |   |
 |   |  |   _  \  |   _  \   /  __  \  \  \ /  / \   \  /   /    \   \  /   / |  | |   \/   |  |   |
 |   |  |  |_)  | |  |_)  | |  |  |  |  \  V  /   \   \/   /      \   \/   /  |  | |  \  /  |  |   |
 |   |  |   ___/  |      /  |  |  |  |   >   <     \_    _/        \      /   |  | |  |\/|  |  |   |
 |   |  |  |      |  |\  \  |  `--'  |  /  .  \      |  |           \    /    |  | |  |  |  |  |   |
 |   |  |__|      |__| \__|  \______/  /__/ \__\     |__|            \__/     |__| |__|  |__|  |   |
 |   |                                                                                         |   |
 |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___|
(_____)                                                                                       (_____)
 ]],
      },
    },
  },
}
