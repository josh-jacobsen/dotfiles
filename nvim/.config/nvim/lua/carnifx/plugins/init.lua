-- Initialize plugins that need setup
local M = {}

function M.setup()
  -- Load and run the img-clip setup
  local ok, img_clip_setup = pcall(require, 'carnifx.plugins.img-clip-setup')
  if ok then
    img_clip_setup.setup()
  end

  -- Create the PasteScreenshot command if it doesn't exist
  if vim.fn.exists ':PasteScreenshot' == 0 then
    vim.api.nvim_create_user_command('PasteScreenshot', function()
      local timestamp = os.date '%Y-%m-%d-%H-%M-%S'
      local file_path = vim.fn.expand('~/.local/state/nvim/avante/pasted_images/' .. timestamp .. '.png')

      -- Ensure directory exists
      vim.fn.system('mkdir -p ' .. vim.fn.shellescape(vim.fn.expand '~/.local/state/nvim/avante/pasted_images'))

      -- Try pngpaste
      local cmd = 'pngpaste ' .. vim.fn.shellescape(file_path)
      vim.fn.system(cmd)

      if vim.v.shell_error == 0 then
        -- Insert markdown image link at cursor
        local image_link = '![image](' .. file_path .. ')'
        vim.api.nvim_put({ image_link }, 'c', true, true)
        vim.notify('Image pasted successfully!', vim.log.levels.INFO)
      else
        vim.notify('Failed to paste image from clipboard', vim.log.levels.ERROR)
      end
    end, {})
  end

  -- Add keybinding for PasteScreenshot command
  vim.keymap.set({ 'n', 'i' }, '<leader>p', function()
    if vim.fn.mode() == 'i' then
      vim.cmd 'stopinsert'
      vim.cmd 'PasteScreenshot'
      vim.cmd 'startinsert'
    else
      vim.cmd 'PasteScreenshot'
    end
  end, { noremap = true, silent = true, desc = 'Paste screenshot' })
end

-- Run setup on plugin load
vim.schedule(function()
  M.setup()
end)

-- Also set up an autocmd to ensure the keybinding works after plugins load
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Delay the setup slightly to ensure all plugins are loaded
    vim.defer_fn(function()
      M.setup()
    end, 100)
  end,
})

return M
