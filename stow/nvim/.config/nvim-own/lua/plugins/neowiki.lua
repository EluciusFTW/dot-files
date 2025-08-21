return {
  'echaya/neowiki.nvim',
  opts = {
    wiki_dirs = {
      { name = 'Work', path = '~/sources/my-synchronization-context/vaults/dev' },
      { name = 'Personal', path = '~/sources/my-synchronization-context/vaults/personal' },
    },
  },
  keys = {
    { '<leader>ww', "<cmd>lua require('neowiki').open_wiki_floating('Work')<cr>", desc = 'Open Work Wiki in Floating Window' },
    { '<leader>wp', "<cmd>lua require('neowiki').open_wiki_floating('Personal')<cr>", desc = 'Open Personal Wiki in Floating Window' },
  },
}
