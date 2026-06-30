return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- the rewritten branch; required for Neovim 0.12+
    lazy = false, -- main branch does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Parsers to keep installed (replaces the old `ensure_installed`).
      -- install() is async and idempotent, so this is cheap on every start.
      require('nvim-treesitter').install {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      }

      -- The module system (highlight/indent) is gone in the main branch; enable
      -- them per-buffer via a FileType autocmd instead.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-enable', { clear = true }),
        callback = function(args)
          -- highlight (no-op + silent if no parser is available)
          if not pcall(vim.treesitter.start, args.buf) then
            return
          end
          -- indent (experimental in the main branch, but matches the old behaviour)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Incremental selection was also dropped from core; reimplement the old
      -- <Enter>/<BackSpace> mappings on top of the treesitter API.
      local sel_stack = {}

      local function visual_select(node)
        local srow, scol, erow, ecol = node:range()
        -- range end is exclusive; if it lands on column 0, step back a line
        if ecol == 0 and erow > srow then
          erow = erow - 1
          ecol = #vim.fn.getline(erow + 1)
        end
        vim.api.nvim_win_set_cursor(0, { srow + 1, scol })
        vim.cmd 'normal! v'
        vim.api.nvim_win_set_cursor(0, { erow + 1, math.max(ecol - 1, 0) })
      end

      local function same_range(a, b)
        local a1, a2, a3, a4 = a:range()
        local b1, b2, b3, b4 = b:range()
        return a1 == b1 and a2 == b2 and a3 == b3 and a4 == b4
      end

      local function init_or_expand()
        local mode = vim.fn.mode()
        if mode ~= 'v' and mode ~= 'V' and mode ~= '\22' then
          sel_stack = {}
        end

        local node
        if #sel_stack == 0 then
          node = vim.treesitter.get_node()
        else
          node = sel_stack[#sel_stack]:parent()
          -- skip parents that cover the exact same range
          while node and node:parent() and same_range(node, node:parent()) do
            node = node:parent()
          end
        end

        if not node then
          return
        end
        sel_stack[#sel_stack + 1] = node
        visual_select(node)
      end

      local function shrink()
        if #sel_stack > 1 then
          sel_stack[#sel_stack] = nil
          visual_select(sel_stack[#sel_stack])
        end
      end

      vim.keymap.set('n', '<Enter>', init_or_expand, { desc = 'TS: init selection' })
      vim.keymap.set('x', '<Enter>', init_or_expand, { desc = 'TS: expand selection' })
      vim.keymap.set('x', '<BackSpace>', shrink, { desc = 'TS: shrink selection' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
        },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      vim.keymap.set({ 'x', 'o' }, 'af', function()
        select.select_textobject('@function.outer', 'textobjects')
      end, { desc = 'Select outer function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        select.select_textobject('@function.inner', 'textobjects')
      end, { desc = 'Select inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function()
        select.select_textobject('@class.outer', 'textobjects')
      end, { desc = 'Select outer class' })

      local swap = require 'nvim-treesitter-textobjects.swap'
      vim.keymap.set('n', '<leader>a', function()
        swap.swap_next '@parameter.inner'
      end, { desc = 'Swap next parameter' })
      vim.keymap.set('n', '<leader>A', function()
        swap.swap_previous '@parameter.inner'
      end, { desc = 'Swap previous parameter' })
    end,
  },
}
