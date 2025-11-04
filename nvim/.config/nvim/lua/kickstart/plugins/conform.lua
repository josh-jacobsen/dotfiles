return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre', 'BufNewFile' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format {
            async = false,
            lsp_fallback = true,
            timeout_ms = 1000,
          }
        end,
        mode = { 'n', 'v' },
        desc = '[C]ode [F]ormat',
      },
    },
    config = function()
      local conform = require 'conform'

      conform.setup {
        -- Define formatters
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          python = { 'isort', 'black' },
          terraform = { 'terraform_fmt' },
          tf = { 'terraform_fmt' },
          hcl = { 'terraform_fmt' },
        },

        -- Format on save configuration
        format_on_save = function(bufnr)
          -- Disable format on save for certain filetypes
          local disable_filetypes = { c = true, cpp = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return
          end

          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          return {
            timeout_ms = 500,
            lsp_fallback = true,
          }
        end,

        -- Customize formatters
        -- formatters = {
        --   black = {
        --     prepend_args = { '--line-length', '120', '--fast' },
        --   },
        --   isort = {
        --     prepend_args = { '--profile', 'black', '--line-length', '120' },
        --   },
        -- },

        -- Notify on format errors
        notify_on_error = true,
      }

      -- Create commands to toggle format on save
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
