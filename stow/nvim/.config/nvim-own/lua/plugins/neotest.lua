return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup {
      -- jest_test_discovery runs jest per file, so don't let neotest scan the whole project on startup
      discovery = { enabled = false },
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npx jest',
          -- needed to map it.each/describe.each results back to their source position
          jest_test_discovery = true,
          -- run jest from the project root (where package.json lives) of the test file
          cwd = function(path)
            return vim.fs.root(path, 'package.json') or vim.fn.getcwd()
          end,
        },
      },
    }
  end,
  keys = {
    { '<leader>Tt', function() require('neotest').run.run() end, desc = '[T]est nearest' },
    { '<leader>Tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est [F]ile' },
    { '<leader>Ta', function() require('neotest').run.run(vim.fn.getcwd()) end, desc = '[T]est [A]ll' },
    { '<leader>Tl', function() require('neotest').run.run_last() end, desc = '[T]est [L]ast' },
    { '<leader>Tw', function() require('neotest').watch.toggle(vim.fn.expand '%') end, desc = '[T]est [W]atch file' },
    { '<leader>Ts', function() require('neotest').summary.toggle() end, desc = '[T]est [S]ummary' },
    { '<leader>To', function() require('neotest').output.open { enter = true } end, desc = '[T]est [O]utput' },
    { '<leader>Tp', function() require('neotest').output_panel.toggle() end, desc = '[T]est output [P]anel' },
  },
}
