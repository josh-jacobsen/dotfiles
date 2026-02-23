return {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  ft = { 'go', 'gomod', 'gowork', 'gotmpl' },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require('go').setup {
      -- Use gopls from Mason rather than go.nvim managing its own
      lsp_cfg = false,
      -- Formatting handled by conform (goimports + gofumpt)
      lsp_gofumpt = false,
      lsp_on_attach = false,
    }

    local go = require 'go'
    local gotest = require 'go.test'

    -- Struct tags
    vim.keymap.set('n', '<leader>gta', '<cmd>GoAddTag<cr>', { desc = '[G]o [T]ag [A]dd' })
    vim.keymap.set('n', '<leader>gtr', '<cmd>GoRmTag<cr>', { desc = '[G]o [T]ag [R]emove' })

    -- Interface stubs
    vim.keymap.set('n', '<leader>gi', '<cmd>GoImpl<cr>', { desc = '[G]o [I]mplement interface' })

    -- Fill struct
    vim.keymap.set('n', '<leader>gfs', '<cmd>GoFillStruct<cr>', { desc = '[G]o [F]ill [S]truct' })

    -- Code generation
    vim.keymap.set('n', '<leader>gg', '<cmd>GoGenerate<cr>', { desc = '[G]o [G]enerate' })

    -- Run / build
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<cr>', { desc = '[G]o [R]un' })
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<cr>', { desc = '[G]o [B]uild' })
  end,
}
