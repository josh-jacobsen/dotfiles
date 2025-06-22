return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = 'claude',
    claude = {
      endpoint = 'https://api.anthropic.com',
      -- model = 'claude-3-5-sonnet-20241022',
      model = 'claude-3-7-sonnet-20250219',
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      config = function()
        require('img-clip').setup {
          default = {
            -- Basic settings
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            use_absolute_path = true,

            -- Directory settings
            dir_path = vim.fn.expand '~/.local/state/nvim/avante/pasted_images',
            file_name = '%Y-%m-%d-%H-%M-%S',

            -- Drag and drop settings
            drag_and_drop = {
              insert_mode = true,
            },

            -- Clipboard settings for macOS
            clipboard_command = function(file_path)
              -- Try pngpaste first
              local pngpaste_cmd = string.format('pngpaste "%s"', file_path)
              local pngpaste_result = vim.fn.system(pngpaste_cmd)

              if vim.v.shell_error == 0 then
                return true
              end

              -- If pngpaste fails, try AppleScript
              local applescript_cmd =
                string.format('osascript -e \'tell application "System Events" to write (the clipboard as «class PNGf») to (POSIX file "%s")\'', file_path)
              local applescript_result = vim.fn.system(applescript_cmd)

              if vim.v.shell_error == 0 then
                return true
              end

              -- If both methods fail, notify the user
              vim.notify('Failed to paste image from clipboard', vim.log.levels.ERROR)
              return false
            end,

            -- Debug mode
            debug = true,
          },
        }

        -- Create a command to test clipboard content
        vim.api.nvim_create_user_command('TestImgClip', function()
          vim.fn.system 'pngpaste /tmp/test_clipboard.png'
          local result = vim.v.shell_error
          if result == 0 then
            vim.notify('Image found in clipboard!', vim.log.levels.INFO)
          else
            vim.notify('No image in clipboard or pngpaste not installed', vim.log.levels.ERROR)
          end
        end, {})

        -- Create a command to manually paste an image
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

        -- Add keybinding for manual paste
        vim.keymap.set({ 'n', 'i' }, '<C-S-v>', function()
          if vim.fn.mode() == 'i' then
            vim.cmd 'stopinsert'
            vim.cmd 'PasteScreenshot'
            vim.cmd 'startinsert'
          else
            vim.cmd 'PasteScreenshot'
          end
        end, { noremap = true, silent = true, desc = 'Paste screenshot' })
      end,
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
