-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- exit insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Shoutcut to save file (ZZ saves and exits, ZQ exists without saving, so ZW makes sense to save without exiting)
vim.keymap.set('n', 'ZW', ':w<CR>', { desc = 'Save file' })

-- When code is selected, use J and K to move the blocks up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit ToggleTerm using the keymap <C-d>. This will close any currently open terminal

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Oil keymaps
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Neo-tree keymaps
vim.keymap.set('n', '<leader>mc', ':Neotree close right<CR>', { desc = '[M]isc [C]lose Neotree' })
vim.keymap.set('n', '<leader>mf', ':Neotree reveal=true<CR>', { desc = '[Misc] [F]ind file in Neotree' })

-- Neogit keymaps
vim.keymap.set('n', '<leader>mg', ':Neogit<CR>', { desc = '[M]isc [G]it' })

-- Gitsigns keymaps
vim.keymap.set('n', '<leader>mn', ':Gitsigns next_hunk<CR>', { desc = '[M]isc [N]ext Hunk' })
vim.keymap.set('n', '<leader>mp', ':Gitsigns prev_hunk<CR>', { desc = '[M]isc [P]rev Hunk' })
vim.keymap.set('n', '<leader>mv', ':Gitsigns preview_hunk_inline<CR>', { desc = '[M]isc Pre[V]iew Inline' })
vim.keymap.set('n', '<leader>mb', ':Gitsigns blame_line<CR>', { desc = '[M]isc [B]lame Line' })
vim.keymap.set('n', '<leader>ms', ':Gitsigns stage_hunk<CR>', { desc = '[M]isc [S]tage' })
vim.keymap.set('n', '<leader>mu', ':Gitsigns undo_stage_hunk<CR>', { desc = '[M]isc [U]nstage' })
-- ESLint keymaps
vim.keymap.set('n', '<leader>cl', ':EslintFixAll<CR>', { desc = '[C]ode [L]int' })

-- ToggleTerm keymaps
vim.keymap.set('n', '<leader>md', ':ToggleTerm size=15<CR>', { desc = '[Misc] Open Terminal [D]own' })
vim.keymap.set('n', '<leader>ml', ':ToggleTerm direction=float<CR>', { desc = '[M]isc Open Terminal [L]evitating' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
