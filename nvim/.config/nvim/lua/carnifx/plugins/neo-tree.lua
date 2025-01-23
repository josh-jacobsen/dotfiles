return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      window = {
        position = 'right',
        width = 40,
      },
      filesystem = {
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,

        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        buffers = {
          follow_current_file = true,
          group_empty_dirs = true,
        },
      },
    }
  end,
}
