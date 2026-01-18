return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 30,
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      require("keymaps.explorer").setup()
    end,
  },
}
