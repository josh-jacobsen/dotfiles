return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
  },
  ft = 'python',
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' },
    { ',c', '<cmd>VenvSelectCached<cr>' },
  },
  opts = {
    search = {},
    options = {},
  },
}
