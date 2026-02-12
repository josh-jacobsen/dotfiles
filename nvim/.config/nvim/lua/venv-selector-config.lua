-- Python virtual environment configuration
return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  lazy = false,
  cond = function()
    -- Only load if fd is available
    return vim.fn.executable('fd') == 1 or vim.fn.executable('fdfind') == 1
  end,
  config = function()
    local fd_name = vim.fn.executable('fd') == 1 and 'fd' or 'fdfind'
    require('venv-selector').setup({
      -- Look for both .venv and venv directories
      name = {".venv", "venv", "env", ".env"},
      -- Increase parent directory search to improve detection
      parents = 3,
      -- Enable auto-refresh to detect newly created environments
      auto_refresh = true,
      -- Show notification when environment is activated
      notify_user_on_activate = true,
      -- Debug options
      fd_binary_name = fd_name,
      -- Ensure search is enabled
      search = true,
      search_workspace = true,
      search_venv_managers = true,
    })
  end,
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' },
    { ',c', '<cmd>VenvSelectCached<cr>' },
  },
}
