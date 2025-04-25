vim.lsp.config('bashls', require('nerdwave.lsp.bashls'))
vim.lsp.config('eslint', require('nerdwave.lsp.eslint'))
vim.lsp.config('golang_ci_lint', require('nerdwave.lsp.golang_ci_lint'))
vim.lsp.config('gopls', require('nerdwave.lsp.gopls'))
vim.lsp.config('lua_ls', require('nerdwave.lsp.lua_ls'))
vim.lsp.config('tsserver', require('nerdwave.lsp.tsserver'))
vim.lsp.config('volar', require('nerdwave.lsp.volar'))

local function conditional_enable(lsps)
  for _, value in ipairs(lsps) do
    if require('neoconf').get('lspconfig.' .. value .. '.disabled') then
      print('skipping ' .. value .. ' lsp setup due to neoconf...')
      vim.lsp.enable(value, false)
    else
      vim.lsp.enable(value, true)
    end
  end
end

conditional_enable({
  'bashls',
  'golang_ci_lint',
  'gopls',
  'eslint',
  'lua_ls',
  'tsserver',
  'volar',
})

local on_attach_keymap = function(bufnr)
  local map = function(mode, key, fn, desc)
    vim.keymap.set(mode, key, fn, { noremap = true, buffer = bufnr, desc = 'LSP: ' .. desc })
  end
  local telescopeBuiltin = require('telescope.builtin')

  map(
    'n',
    'K',
    function() vim.lsp.buf.hover({ silent = true, border = 'rounded' }) end,
    'Show little hover window, o[k]ay?'
  )
  map('n', 'gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
  map('n', 'gi', telescopeBuiltin.lsp_implementations, '[g]o to [i]mplementation')
  map('n', 'gr', telescopeBuiltin.lsp_references, '[g]o to [r]eferences')
  map('n', '[d', function() vim.diagnostic.jump({ count = 1 }) end, 'next [[d]ialogue')
  map('n', ']d', function() vim.diagnostic.jump({ count = -1 }) end, 'previous []d]ialogue')
  map('n', '<leader>df', vim.diagnostic.open_float, '[d]iagnostics [f]loat')
  map('n', 'gd', telescopeBuiltin.lsp_definitions, '[g]o to [d]efinitions')
  map('n', '<leader>ds', telescopeBuiltin.lsp_document_symbols, 'find [d]ocument [s]ymbols')
  map('n', '<leader>fd', telescopeBuiltin.diagnostics, '[f]ind [d]iagnostics')
  map('n', '<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ctions')
  map('n', '<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  map('i', '<C-h>', vim.lsp.buf.signature_help, 'Signature Help')
end

local lsp_group = vim.api.nvim_create_augroup('CustomLspAutoGroup', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(args)
    vim.diagnostic.config({ virtual_text = true })
    on_attach_keymap(args.buf)
  end,
})
