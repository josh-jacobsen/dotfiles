-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- exit insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Shoutcut to save file (inbuilt Keybinds are ZZ to save and exit, ZQ to exit without saving)
vim.keymap.set('n', '<leader><leader>q', ':wqa<CR>', { desc = 'Save all and quit' })

vim.keymap.set('n', 'Q', '@q', { desc = 'Apply macro' })

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

vim.keymap.set('n', '=', [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set('n', '-', [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set('n', '+', [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set('n', '_', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Neo-tree keymaps
vim.keymap.set('n', '<leader>mc', ':Neotree close right<CR>', { desc = '[M]isc [C]lose Neotree' })
vim.keymap.set('n', '<leader>mf', ':Neotree reveal=true<CR>', { desc = '[Misc] [F]ind file in Neotree' })

-- Neogit keymaps
vim.keymap.set('n', '<leader>mg', ':Neogit<CR>')

-- Neogit keymaps
vim.keymap.set('n', '<leader>mo', ':Oil<CR>')

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
