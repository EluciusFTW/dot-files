return {
  'GustavEikaas/easy-dotnet.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('easy-dotnet').setup()

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or (client.name ~= 'easy_dotnet' and client.name ~= 'fsautocomplete') then
          return
        end

        vim.keymap.set('n', '<leader>Da', '<cmd>Dotnet<cr>', { buffer = args.buf, desc = 'Open Dotnet command menu' })
        vim.keymap.set('n', '<leader>Db', '<cmd>Dotnet build<cr>', { buffer = args.buf, desc = 'Dotnet build' })
        vim.keymap.set('n', '<leader>Dr', '<cmd>Dotnet run<cr>', { buffer = args.buf, desc = 'Dotnet run' })
      end,
    })
  end,
}
