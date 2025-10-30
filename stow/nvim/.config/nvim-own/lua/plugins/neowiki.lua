return {
  'echaya/neowiki.nvim',
  opts = {
    wiki_dirs = {
      { name = 'Work', path = '~/wiki/work' },
      { name = 'Personal', path = '~/sources/my-synchronization-context/vaults/personal' },
      { name = 'Quizzical', path = '~/sources/my-synchronization-context/vaults/dev' },
    },
  },
  keys = {
    { '<leader>ww', "<cmd>lua require('neowiki').open_wiki_floating('Work')<cr>", desc = 'Open Work Wiki' },
    { '<leader>wp', "<cmd>lua require('neowiki').open_wiki_floating('Personal')<cr>", desc = 'Open Personal Wiki' },
    { '<leader>wq', "<cmd>lua require('neowiki').open_wiki_floating('Quizzical')<cr>", desc = 'Open Quizzical Wiki' },
  },
}
