-- Helper file for macOS image clipboard support
local M = {}

-- Function to check if pngpaste is installed
function M.check_pngpaste()
  local result = vim.fn.system 'which pngpaste'
  return vim.v.shell_error == 0
end

-- Function to install pngpaste
function M.install_pngpaste()
  vim.notify('Installing pngpaste for better macOS screenshot support...', vim.log.levels.INFO)
  local result = vim.fn.system 'brew install pngpaste'
  if vim.v.shell_error == 0 then
    vim.notify('Successfully installed pngpaste!', vim.log.levels.INFO)
    return true
  else
    vim.notify('Failed to install pngpaste. Please install manually: brew install pngpaste', vim.log.levels.ERROR)
    return false
  end
end

-- Setup function to ensure macOS has proper clipboard support
function M.setup()
  if vim.fn.has 'mac' == 1 then
    if not M.check_pngpaste() then
      vim.notify('For better macOS screenshot support, pngpaste is recommended.', vim.log.levels.WARN)
      vim.ui.select({ 'Yes', 'No' }, {
        prompt = 'Would you like to install pngpaste now?',
      }, function(choice)
        if choice == 'Yes' then
          M.install_pngpaste()
        else
          vim.notify('You can install it later with: brew install pngpaste', vim.log.levels.INFO)
        end
      end)
    end
  end
end

-- Auto-run setup when this file is loaded
vim.schedule(function()
  M.setup()
end)

return M
