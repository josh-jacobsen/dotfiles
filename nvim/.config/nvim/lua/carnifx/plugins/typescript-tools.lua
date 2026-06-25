return {

  -- typescript-tools requires tsserver to be installed somewhere. Using Mason to handle this install wasn't working because both tsserver and typescript-tools would
  -- attach to the buffer, leading to errors with type resolution, etc. One option is to install typescript language service globally, however I think a better way is to
  -- make sure that typescript is defined in any projects (via package.json) and that npm install has been run. This does mean that spontaneous TS projects won't work,
  -- but that isn't part of my normal workflow anyway.

  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    settings = {
      expose_as_code_action = { 'add_missing_imports', 'fix_all', 'remove_unused', 'remove_unused_imports' },
    },
    on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gd', function()
        local ft = vim.bo[bufnr].filetype
        if ft == 'javascript' or ft == 'javascriptreact' then
          require('telescope.builtin').lsp_definitions()
          return
        end
        -- Try source definition first (follows through to .ts source in node_modules).
        -- Falls back to regular definition (e.g. .d.ts) for builtins like Node's crypto.
        local params = vim.lsp.util.make_position_params()
        vim.lsp.buf_request(0, 'workspace/executeCommand', {
          command = '_typescript.goToSourceDefinition',
          arguments = { params.textDocument.uri, params.position },
        }, function(err, result)
          if err or not result or #result == 0 then
            require('telescope.builtin').lsp_definitions()
          else
            vim.lsp.util.jump_to_location(result[1], 'utf-8')
          end
        end)
      end, vim.tbl_extend('force', opts, { desc = 'LSP: [G]oto [D]efinition (source)' }))
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = '[C]ode [A]ction' })
      vim.keymap.set('n', '<leader>ci', ':TSToolsAddMissingImports<CR>', { desc = '[C]ode: Add Missing [I]mports' })
      vim.keymap.set('n', '<leader>cr', ':TSToolsRemoveUnused<CR>', { desc = '[C]ode: [R]emove Unused Statements' })
      vim.keymap.set('n', '<leader>cu', ':TSToolsRemoveUnusedImports<CR>', { desc = '[C]ode: Remove [U]nused Imports' })
      vim.keymap.set('n', '<leader>ce', ':TSToolsFixAll<CR>', { desc = '[C]ode: Fix [E]verything' })
      -- TSToolsOrganizeImports - sorts and removes unused imports
      -- TSToolsSortImports - sorts imports
      -- TSToolsRemoveUnusedImports - removes unused imports
      -- TSToolsRemoveUnused - removes all unused statements
      -- TSToolsAddMissingImports - adds imports for all statements that lack one and can be imported
      -- TSToolsFixAll - fixes all fixable errors
      -- TSToolsGoToSourceDefinition - goes to source definition (available since TS v4.7)
      -- TSToolsRenameFile - allow to rename current file and apply changes to connected files
      -- TSToolsFileReferences - find files that reference the current file (available since TS v4.2)
    end,
  },
}
