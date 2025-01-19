-- [[ Configure and install plugins ]]

-- At some point, move to automatically configuring plugins based on the directory
-- supplied to the "setup" argument
-- require('lazy').setup("carnifx.plugins", {})
-- for more info see: https://github.com/garcia5/dotfiles/blob/master/files/nvim/init.lua#L26-L32
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup {
        auto_session_create_enabled = true,
        -- auto_restore_enabled = false, -- Disable automatic restore
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        bypass_session_save_file_types = {
          'neo-tree', -- Add this line
        },
      }
    end,
  },
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
  },
  require 'carnifx/plugins/parrot',

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/lspconfig',

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

  -- AI (Claude, Copilot, etc)
  -- require 'carnifx/plugins/copilot',
  -- require 'carnifx/plugins/copilot-chat',
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },
  -- {
  --   'pasky/claude.vim',
  --   config = function()
  --     vim.g.claude_api_key = os.getenv 'ANTHROPIC_API_KEY'
  --   end,
  -- },

  -- Python env switching
  {

    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp', -- This is the regexp branch, use this for the new version
    config = function()
      require('venv-selector').setup()
    end,
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' },
    },
  },

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
