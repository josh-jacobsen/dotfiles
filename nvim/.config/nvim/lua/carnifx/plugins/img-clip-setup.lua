local M = {}

function M.setup()
  -- Check if pngpaste is installed
  local has_pngpaste = (vim.fn.system('which pngpaste'):find 'not found' == nil)

  if not has_pngpaste then
    vim.notify('pngpaste is not installed. Installing it for better screenshot support...', vim.log.levels.WARN)

    -- Try to install pngpaste using Homebrew
    local install_result = vim.fn.system 'brew install pngpaste'

    if vim.v.shell_error == 0 then
      vim.notify('Successfully installed pngpaste!', vim.log.levels.INFO)
    else
      vim.notify('Failed to install pngpaste. Please install it manually: brew install pngpaste', vim.log.levels.ERROR)
    end
  end

  -- Create the pasted_images directory if it doesn't exist
  local images_dir = vim.fn.expand '~/.local/state/nvim/avante/pasted_images'
  if vim.fn.isdirectory(images_dir) == 0 then
    vim.fn.mkdir(images_dir, 'p')
    vim.notify('Created directory for pasted images: ' .. images_dir, vim.log.levels.INFO)
  end
end

return M
