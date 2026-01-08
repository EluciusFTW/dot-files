return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    files = {
      formatter = 'path.filename_first', -- places file name first
    },
  },
  config = function()
    require('fzf-lua').setup {
      defaults = {
        formatter = 'path.filename_first', -- places file name first
      },
      winopts = {
        preview = {
          layout = 'vertical',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>fG',
      function()
        require('fzf-lua').global()
      end,
      desc = '[F]ind [G]lobally',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[F]ind [Old] files',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[F]ind last picker and [R]esume',
    },
    {
      '<leader>fR',
      function()
        require('fzf-lua').registers()
      end,
      desc = '[F]ind [R]egisters',
    },
    {
      '<leader>fp',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind [B]uilt-in pickers',
    },
    {
      '<leader>fcg',
      function()
        require('fzf-lua').live_grep { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind in nvim [C]onfiguration by [G]rep',
    },
    {
      '<leader>fcf',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind in nvim [C]onfiguration the [F]ile',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Open Buffers',
    },
    {
      '<leader>fq',
      function()
        require('fzf-lua').quickfix()
      end,
      desc = '[F]ind [Q]uickfix',
    },
    {
      '<leader>fl',
      function()
        require('fzf-lua').loclist()
      end,
      desc = '[F]ind [L]ocation',
    },
    {
      '<leader>\\',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[F]ind in global by [G]rep',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fj',
      function()
        require('fzf-lua').jumps()
      end,
      desc = '[F]ind [J]umps',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = 'Fuzzy-find in curent buffer',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = '[F]ind [D]iagnostics in File',
    },
    {
      '<leader>fD',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = '[F]ind [D]iagnostics in Workspace',
    },
    {
      '<leader>uc',
      function()
        require('fzf-lua').colorschemes()
      end,
      desc = 'Pick colorscheme',
    },
    {
      '<leader>gh',
      function()
        require('fzf-lua').git_hunks()
      end,
      desc = '[G]it [H]unks',
    },
    {
      '<leader>gs',
      function()
        require('fzf-lua').git_status()
      end,
      desc = '[G]it [S]tatus',
    },
  },
}
