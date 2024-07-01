return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- config = function()
  -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  config = function()
    local harpoon = require 'harpoon'
    -- REQUIRED
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add file' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    --
    -- vim.keymap.set('n', '<leader>ha>', function()
    --   harpoon:list():select(1)
    -- end)
    -- vim.keymap.set('n', '<leader>hs>', function()
    --   harpoon:list():select(2)
    -- end)
    -- vim.keymap.set('n', '<leader>hd>', function()
    --   harpoon:list():select(3)
    -- end)
    -- vim.keymap.set('n', '<leader>hf>', function()
    --   harpoon:list():select(4)
    -- end)
    --
    -- -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set('n', '<leader>hk>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set('n', '<leader>hj>', function()
    --   harpoon:list():next()
    -- end)

    -- vim.keymap.set('n', '<C-t>', function()
    --   harpoon:list():prev()
    -- end)
    --
    -- vim.keymap.set('n', '<C-i>', function()
    --   harpoon:list():next()
    -- end)

    -- vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Harpoon: Mark File' })
  end,
  -- local harpoon = require 'harpoon'
  -- harpoon.setup {}
  --
  -- vim.keymap.set('n', '<leader>ha', function()
  --   harpoon:list():add()
  -- end)
  -- vim.keymap.set('n', '<C-e>', function()
  --   harpoon.ui:toggle_quick_menu(harpoon:list())
  -- end)
  --
  -- vim.keymap.set('n', '<C-h>', function()
  --   harpoon:list():select(1)
  -- end)
  -- vim.keymap.set('n', '<C-t>', function()
  --   harpoon:list():select(2)
  -- end)
  -- vim.keymap.set('n', '<C-n>', function()
  --   harpoon:list():select(3)
  -- end)
  -- vim.keymap.set('n', '<C-s>', function()
  --   harpoon:list():select(4)
  -- end)
  -- Toggle previous & next buffers stored within Harpoon list
  --   vim.keymap.set('n', '<C-S-P>', function()
  --     harpoon:list():prev()
  --   end)
  -- vim.keymap.set('n', '<C-S-N>', function()
  --   harpoon:list():next()
  -- end)
  -- end,
}
