return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre', 'BufNewFile' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').setup {
            format_after_save = {
              lsp_format = 'fallback',
            },
          }
        end,
        mode = '',
        desc = '[C]ode [F]ormat',
      },
    },

    opts = {
      format_after_save = {
        lsp_format = 'fallback',
      },

      formatters_by_ft = {

        lua = { 'stylua' },
        javascript = { 'prettier', 'prettierd' },
        typescript = { 'prettier', 'prettierd' },
        javascriptreact = { 'prettier', 'prettierd' },
        typescriptreact = { 'prettier', 'prettierd' },
        python = { 'isort', 'black' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
