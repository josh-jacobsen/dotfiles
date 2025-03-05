return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    -- Load friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Add custom snippets with jump points
    ls.add_snippets('all', {
      s('foobar', {
        t 'const ',
        i(1, 'functionName'), -- First node: function name
        t ' = ({ ',
        i(2, 'name'), -- Second node: property name
        t ' }: { ',
        i(3, 'name'),
        t ': ',
        i(4, 'type'), -- Third node: type annotation
        t ' }) => {',
        t { '', '  ' },
        i(5, 'return name'), -- Fourth node: function body
        t { '', '}' },
      }),
    })

    -- Add JavaScript/TypeScript specific snippets
    ls.add_snippets('javascript', {
      s('foobar', {
        t 'const ',
        i(1, 'functionName'), -- First node: function name
        t ' = ({ ',
        i(2, 'name'), -- Second node: property name
        t ' }: { ',
        i(3, 'name'),
        t ': ',
        i(4, 'type'), -- Third node: type annotation
        t ' }) => {',
        t { '', '  ' },
        i(5, 'return name'), -- Fourth node: function body
        t { '', '}' },
      }),
    })

    ls.add_snippets('typescript', {
      s('foobar', {
        t 'const ',
        i(1, 'functionName'), -- First node: function name
        t ' = ({ ',
        i(2, 'name'), -- Second node: property name
        t ' }: { ',
        i(3, 'name'),
        t ': ',
        i(4, 'type'), -- Third node: type annotation
        t ' }) => {',
        t { '', '  ' },
        i(5, 'return name'), -- Fourth node: function body
        t { '', '}' },
      }),
    })
  end,
}
