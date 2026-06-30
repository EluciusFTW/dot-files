return {
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {
          registries = {
            'github:mason-org/mason-registry',
            'github:Crashdummyy/mason-registry',
          },
          ensure_installed = {
            'lua-language-server',
            'xmlformatter',
            'csharpier',
            'prettier',
            'stylua',
            'html-lsp',
            'css-lsp',
            'eslint-lsp',
            'json-lsp',
            'roslyn',
          },
        },
      },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', require('fzf-lua').lsp_code_actions, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
          map('gri', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
          map('gO', require('fzf-lua').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('fzf-lua').lsp_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('fzf-lua').lsp_typedefs, '[G]oto [T]ype Definition')
          map('grD', require('fzf-lua').lsp_declarations, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            client.server_capabilities.codeLensProvider = nil
            client.server_capabilities.foldingRangeProvider = nil
          end
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
      }
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        angularls = {},
        vtsls = {},
        fsautocomplete = {
          cmd = { 'fsautocomplete' },
          filetypes = { 'fsharp' },
          init_options = {
            AutomaticWorkspaceInit = true,
            UnusedOpensAnalyzer = false, -- <-- moved here
            UnusedDeclarationsAnalyzer = false, -- <-- move
            SimplifyNameAnalyzer = false,
          },
          settings = {
            FSharp = {
              keywordsAutocomplete = true,
              Linter = true,
              UnionCaseStubGeneration = true,
              RecordStubGeneration = true,
              InterfaceStubGeneration = true,
              UnusedOpensAnalyzer = false, -- <-- moved here
              UnusedDeclarationsAnalyzer = false, -- <-- move
              SimplifyNameAnalyzer = false,
            },
          },
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            if fname:match '%.fsx$' then
              on_dir(vim.fn.fnamemodify(fname, ':h'))
            else
              on_dir(vim.fs.root(bufnr, { '*.sln', '*.fsproj', '.git' }))
            end
          end,
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
              },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server_name, server_config in pairs(servers) do
        server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
        vim.lsp.enable(server_name)
        if server_config then
          vim.lsp.config(server_name, server_config)
        end
      end

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
        'tree-sitter-cli', -- required by nvim-treesitter (main branch) to build parsers
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    end,
  },
}
