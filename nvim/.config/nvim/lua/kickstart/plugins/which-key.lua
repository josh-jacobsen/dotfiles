return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').add {
        { '<leader>s', group = 'search', icon = { icon = '', color = 'green' } },
        { '<leader>c', group = 'code', icon = { icon = '', color = 'yellow' } },
        { '<leader>d', group = 'document', icon = { icon = '', color = 'blue' } },
        { '<leader>h', group = 'harpoon', icon = { icon = '', color = 'purple' } },
        { '<leader>m', group = 'misc', icon = { icon = '', color = 'red' } },
        { '<leader>r', group = 'rename', icon = { icon = '', color = 'yellow' } },
        { '<leader>t', group = 'test', icon = { icon = '', color = 'blue' } },
        { '<leader>w', group = 'workspace', icon = { icon = '', color = 'purple' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
