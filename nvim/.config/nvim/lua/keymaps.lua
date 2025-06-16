-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- exit insert mode
vim.keymap.set('i', 'jk', '<ESC>')

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- delete single character without copying into register
vim.keymap.set('n', '<leader>mn', '<cmd>ScratchWithName<cr>', { desc = '[M]isc Scratch [N]ew' })
vim.keymap.set('n', '<leader>ms', '<cmd>ScratchOpen<cr>', { desc = '[M]isc [S]cratch Open' })

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

-- Nvim-dap keymaps
-- vim.keymap.set('n', '<leader>tu', function()
--   require('dapui').toggle()
-- end, { desc = '[T]est [UI]' })

-- Neogit keymaps
vim.keymap.set('n', '<leader>mg', ':Neogit<CR>')

-- Neogit keymaps
vim.keymap.set('n', '<leader>mo', ':Oil<CR>')

-- ESLint keymaps
vim.keymap.set('n', '<leader>cl', ':EslintFixAll<CR>', { desc = '[C]ode [L]int' })

-- ToggleTerm keymaps
vim.keymap.set('n', '<leader>md', ':ToggleTerm direction=horizontal size=15<CR>', { desc = '[Misc] Open Terminal [D]own' })
vim.keymap.set('n', '<leader>ml', ':ToggleTerm direction=float<CR>', { desc = '[M]isc Open Terminal [L]evitating' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

-- Terminal mode mappings to navigate out of terminal
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true })
  end,
})

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

-- Keeps track of which buffers have been touched, and deletes those that have not been touched
-- Also creates a keymap to delete all buffers except the current one
local id = vim.api.nvim_create_augroup('startup', {
  clear = false,
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, 'bufpersist', 1)
end

vim.api.nvim_create_autocmd({ 'BufRead' }, {
  group = id,
  pattern = { '*' },
  callback = function()
    vim.api.nvim_create_autocmd({ 'InsertEnter', 'BufModifiedSet' }, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end,
    })
  end,
})

vim.keymap.set('n', '<Leader>mb', function()
  local curbufnr = vim.api.nvim_get_current_buf()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
    if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
      vim.cmd('bd ' .. tostring(bufnr))
    end
  end
end, { silent = true, desc = '[M]isc [B]uffers Close All' })

-- vim: ts=2 sts=2 sw=2 et
