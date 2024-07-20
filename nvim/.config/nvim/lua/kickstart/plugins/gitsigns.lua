return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end)
          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset Buffer' })
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end)
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end)
          map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Unstage Hunk' })
          map('n', '<leader>hv', gitsigns.preview_hunk_inline, { desc = 'Hunk Preview' })
          map('n', '<leader>hl', function()
            gitsigns.blame_line { full = true }
          end, { desc = 'Blame Line' })
          map('n', '<leader>hb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Blame' }) -- ghost text
          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff' })
          map('n', '<leader>hD', function()
            gitsigns.diffthis '~'
          end, { desc = 'Diff All' })
          map('n', '<leader>he', gitsigns.toggle_deleted, { desc = 'Toggle Deleted Lines' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
