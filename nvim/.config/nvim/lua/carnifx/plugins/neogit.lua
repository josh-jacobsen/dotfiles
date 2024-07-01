return {
  'NeogitOrg/neogit',
  tag = 'v0.0.1',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
  -- config = true,
  config = function()
    require('neogit').setup {}
  end,
}
