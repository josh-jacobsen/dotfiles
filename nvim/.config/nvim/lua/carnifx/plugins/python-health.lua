-- Python formatting health check
return {
  {
    'nvim-lua/plenary.nvim',
    config = function()
      -- Create a command to check Python formatting setup
      vim.api.nvim_create_user_command('CheckPythonFormat', function()
        local conform = require 'conform'
        local formatters = conform.list_formatters(0)

        print 'Python Formatting Health Check:'
        print '================================'

        -- Check if buffer is Python
        if vim.bo.filetype == 'python' then
          print '✓ Current buffer is Python'
        else
          print('✗ Current buffer is not Python (filetype: ' .. vim.bo.filetype .. ')')
        end

        -- Check formatters
        print '\nConfigured formatters for this buffer:'
        for _, formatter in ipairs(formatters) do
          local info = conform.get_formatter_info(formatter.name)
          if info.available then
            print('  ✓ ' .. formatter.name .. ' (available at: ' .. info.command .. ')')
          else
            print('  ✗ ' .. formatter.name .. ' (not available)')
            if info.available_msg then
              print('    Reason: ' .. info.available_msg)
            end
          end
        end

        -- Check if format on save is enabled
        if vim.g.disable_autoformat then
          print '\n✗ Format on save is globally disabled'
        elseif vim.b.disable_autoformat then
          print '\n✗ Format on save is disabled for this buffer'
        else
          print '\n✓ Format on save is enabled'
        end

        -- Test formatting
        print '\nTo test formatting, run :ConformInfo'
      end, {
        desc = 'Check Python formatting setup',
      })
    end,
  },
}
