-- [[ Configure and install plugins ]]

-- At some point, move to automatically configuring plugins based on the directory
-- supplied to the "setup" argument
-- require('lazy').setup("carnifx.plugins", {})
-- for more info see: https://github.com/garcia5/dotfiles/blob/master/files/nvim/init.lua#L26-L32
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- Core Improvements
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-surround', -- Surround text objects
  'tpope/vim-repeat', -- Enable repeating supported plugin maps

  -- UI Improvements
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('auto-session').setup {
        auto_session_create_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        auto_restore_enabled = true,
        auto_save_enabled = true,
        pre_save_cmds = {
          function()
            -- Close file trees before saving session
            vim.cmd 'Neotree close'
            -- Close any floating windows
            vim.cmd [[silent! close]]
          end,
        },
        bypass_session_save_file_types = {
          'neo-tree',
          'NvimTree',
          'neo-tree filesystem',
          'qf', -- quickfix windows
          'help',
          'telescope',
        },
        session_lens = {
          -- Configure Telescope session-lens
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }
    end,
  },
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
  },

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  -- Custom LuaSnip configuration
  require 'carnifx/plugins/luasnip',

  require 'kickstart/plugins/lspconfig',
  -- Testing and Development
  'joaohkfaria/vim-jest-snippets',
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     cmdline = {
  --       view = 'cmdline', -- Traditional command line view
  --     },
  --     messages = {
  --       view = 'notify',
  --       view_error = 'notify',
  --       view_warn = 'notify',
  --     },
  --     routes = {
  --       -- Skip "recording" messages in command line
  --       {
  --         filter = {
  --           event = 'msg_showmode',
  --           find = 'recording',
  --         },
  --         opts = { skip = true },
  --       },
  --       -- Also skip "recording" messages with msg_show event type
  --       {
  --         filter = {
  --           event = 'msg_show',
  --           find = 'recording',
  --         },
  --         opts = { skip = true },
  --       },
  --       -- Skip recorded message too
  --       {
  --         filter = {
  --           event = 'msg_showmode',
  --           find = 'recorded',
  --         },
  --         opts = { skip = true },
  --       },
  --     },
  --     -- Ensure status is visible
  --     views = {
  --       cmdline_popup = {
  --         position = {
  --           row = 5,
  --           col = "50%",
  --         },
  --         size = {
  --           width = 60,
  --           height = "auto",
  --         },
  --       },
  --       popupmenu = {
  --         relative = "editor",
  --         position = {
  --           row = 8,
  --           col = "50%",
  --         },
  --         size = {
  --           width = 60,
  --           height = 10,
  --         },
  --         border = {
  --           style = "rounded",
  --           padding = { 0, 1 },
  --         },
  --         win_options = {
  --           winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
  --         },
  --       },
  --     },
  --   },
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   },
  -- },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  require 'kickstart/plugins/tokyonight',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',

  'joaohkfaria/vim-jest-snippets',

  require 'carnifx/plugins/neo-tree',

  require 'carnifx/plugins/telescope',

  require 'carnifx/plugins/typescript-tools',

  require 'carnifx/plugins/formatter',
  require 'carnifx/plugins/toggleterm',
  require 'carnifx/plugins/autopairs',
  require 'carnifx/plugins/vim-tmux-navigator',
  require 'carnifx/plugins/harpoon',
  require 'carnifx/plugins/neotest',

  -- Debugging
  require 'carnifx/plugins/dap',
  require 'carnifx/plugins/neogit',

  -- AI (Claude, etc)
  require 'carnifx/plugins/avante',

  -- Python env switching
  require 'venv-selector-config',

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
