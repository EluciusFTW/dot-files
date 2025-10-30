local ls = require 'luasnip'
local s, i, f = ls.snippet, ls.insert_node, ls.function_node

ls.add_snippets('oil', {
  s('ngcomp', {
    i(1, 'component-name'),
    f(function(args)
      local name = args[1][1] or 'component'

      -- return a table: each element is one line
      return {
        '.component.ts',
        name .. '.component.html',
        name .. '.component.scss',
      }
    end, { 1 }),
  }),
})
