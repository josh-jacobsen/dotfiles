return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').add {
        { '<leader>s', group = 'Search', icon = { icon = '', color = 'green' } },
        { '<leader>c', group = 'Code', icon = { icon = '', color = 'yellow' } },
        { '<leader>d', group = 'Document', icon = { icon = '', color = 'blue' } },
        { '<leader>h', group = 'Hunks/Harpoon', icon = { icon = '', color = 'purple' } },
        { '<leader>m', group = 'Misc', icon = { icon = '', color = 'red' } },
        { '<leader>mo', desc = 'Oil', icon = { icon = '', color = 'red' } },
        { '<leader>mg', desc = 'Neogit', icon = { icon = '', color = 'red' } },
        { '<leader>r', group = 'Rename', icon = { icon = '', color = 'yellow' } },
        { '<leader>t', group = 'Test', icon = { icon = '', color = 'blue' } },
        { '<leader>w', group = 'Workspace', icon = { icon = '', color = 'purple' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
