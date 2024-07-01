return {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'mxsdev/nvim-dap-vscode-js',
    -- build debugger from source
    {
      'microsoft/vscode-js-debug',
      version = '1.x',
      build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
    },
  },
  keys = {
    -- normal mode is default
    -- vim.keymap.set('n', '<leader>tu', require('dapui').toggle, { desc = '[T]est [U]I' }) {
    {
      '<leader>tu',
      function()
        require('dapui').toggle()
      end,
    },
    {
      '<leader>td',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = { 'Toggle breakpoint' },
    },
    {
      '<leader>tc',
      function()
        require('dap').continue()
      end,
    },
    {
      "<C-'>",
      function()
        require('dap').step_over()
      end,
    },
    {
      '<C-;>',
      function()
        require('dap').step_into()
      end,
    },
    {
      '<C-:>',
      function()
        require('dap').step_out()
      end,
    },
  },
  config = function()
    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
      require('dap').configurations[language] = {

        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end
    for _, language in ipairs { 'typescriptreact', 'javascriptreact' } do
      require('dap').configurations[language] = {
        {
          type = 'pwa-chrome',
          name = 'Attach - Remote Debugging',
          request = 'attach',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          port = 9222,
          webRoot = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome',
          request = 'launch',
          url = 'http://localhost:3000',
        },
      }
    end
    require('dapui').setup()
    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
    -- dap.listeners.after.event_initialized['dapui_config'] = function()
    --   dapui.open { reset = true }
    -- end
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
