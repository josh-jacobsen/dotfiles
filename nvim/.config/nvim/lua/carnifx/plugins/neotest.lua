return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-jest',
    'nvim-neotest/neotest-go',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('neotest').setup {
      summary = {
        open = 'botright vsplit | vertical resize 60',
        mappings = {
          attach = 'a',
          clear_marked = 'M',
          clear_target = 'T',
          debug = 'd',
          debug_marked = 'D',
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          jumpto = 'i',
          mark = 'm',
          next_failed = 'J',
          output = 'o',
          prev_failed = 'K',
          run = 'r',
          run_marked = 'R',
          short = 'O',
          stop = 'u',
          target = 't',
          watch = 'w',
        },
      },
      highlights = {
        adapter_name = 'NeotestAdapterName',
        border = 'NeotestBorder',
        dir = 'NeotestDir',
        expand_marker = 'NeotestExpandMarker',
        failed = 'NeotestFailed',
        file = 'NeotestFile',
        focused = 'NeotestFocused',
        indent = 'NeotestIndent',
        marked = 'NeotestMarked',
        namespace = 'NeotestNamespace',
        passed = 'NeotestPassed',
        running = 'NeotestRunning',
        select_win = 'NeotestWinSelect',
        skipped = 'NeotestSkipped',
        target = 'NeotestTarget',
        test = 'NeotestTest',
        unknown = 'NeotestUnknown',
      },
      adapters = {
        require 'neotest-go' {},
        require 'neotest-jest' {
          dap = { justMyCode = false },
          jestCommand = function()
            return 'npx jest'
          end,
          isTestFile = function(file_path)
            if file_path:match '/dist/' or file_path:match '%.d%.ts$' then
              return false
            end
            return file_path:match '%.[jt]sx?$'
              and (file_path:match '%.spec%.' or file_path:match '%.test%.' or file_path:match '__tests__')
          end,
          jestConfigFile = function(file)
            local path = vim.fn.fnamemodify(file, ':h')
            while path ~= '/' do
              for _, config in ipairs { 'jest.config.ts', 'jest.config.js', 'jest.config.mjs' } do
                local candidate = path .. '/' .. config
                if vim.fn.filereadable(candidate) == 1 then
                  return candidate
                end
              end
              path = vim.fn.fnamemodify(path, ':h')
            end
          end,
          env = { CI = true },
          cwd = function(path)
            local dir = vim.fn.fnamemodify(path, ':h')
            while dir ~= '/' do
              for _, config in ipairs { 'jest.config.ts', 'jest.config.js', 'jest.config.mjs', 'package.json' } do
                if vim.fn.filereadable(dir .. '/' .. config) == 1 then
                  return dir
                end
              end
              dir = vim.fn.fnamemodify(dir, ':h')
            end
            return vim.fn.getcwd()
          end,
        },
      },
    }
    local neotest = require 'neotest'
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { noremap = true, silent = true, nowait = true, desc = '[T]est [F]ile' })

    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { noremap = true, silent = true, nowait = true, desc = '[T]est [S]ummary Toggle' })

    vim.keymap.set('n', '<leader>tp', function()
      neotest.output_panel.toggle()
    end, { noremap = true, silent = true, nowait = true, desc = '[T]est [P]anel Toggle' })
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open { enter = true }
    end, { noremap = true, silent = true, nowait = true, desc = '[T]est [O]utput Open' })

    vim.keymap.set('n', '<leader>tn', function()
      neotest.run.run()
    end, { desc = '[T]est [N]earest' })

    -- Nvim DAP isn't set up yet, so this will fail if called
    vim.keymap.set('n', '<leader>td', function()
      require('neotest').run.run { strategy = 'dap' }
    end, { desc = '[T]est [D]ebug' })

    vim.keymap.set('n', '<leader>tl', function()
      neotest.run.run_last { enter = true }
      neotest.output.open { last_run = true, enter = true }
    end, { noremap = true, silent = true, nowait = true, desc = '[T]est [L]ast Run' })
  end,
}
