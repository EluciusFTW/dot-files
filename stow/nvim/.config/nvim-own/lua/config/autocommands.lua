-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local function qf_remove_current()
  local qf = vim.fn.getqflist()
  local idx = vim.fn.line '.' - 1

  if idx < 0 or idx >= #qf then
    return
  end

  table.remove(qf, idx + 1)
  vim.fn.setqflist(qf, 'r')
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', 'dd', qf_remove_current, {
      buffer = true,
      desc = 'Delete quickfix entry',
    })
  end,
})
