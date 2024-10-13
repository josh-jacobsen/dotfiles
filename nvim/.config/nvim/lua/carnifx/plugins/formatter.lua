return {
  'mhartington/formatter.nvim',
  config = function()
    -- print 'setting up formatter'
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
    }
  end,
}
