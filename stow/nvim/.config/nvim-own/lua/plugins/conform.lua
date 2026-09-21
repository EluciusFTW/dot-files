return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fb',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true, cs = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        -- csharpier and roslyn regularly need more than conform's 500ms
        -- default on large files, and a timed-out format fails silently.
        return {
          timeout_ms = 3000,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters = {
      prettier = {
        prepend_args = { '--single-quote' },
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- cs = { 'csharpier' },
      typescript = { 'prettier' },
      javascript = { 'prettier' },
      html = { 'prettier' },
      htmlangular = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      markdown = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      yaml = { 'prettier' },
    },
  },
}
