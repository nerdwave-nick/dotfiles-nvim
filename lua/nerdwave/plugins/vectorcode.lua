return {
  'Davidyz/VectorCode',
  enabled = false,
  version = '*', -- optional, depending on whether you're on nightly or release
  build = 'pipx upgrade vectorcode', -- optional but recommended. This keeps your CLI up-to-date.
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    return {
      async_backend = 'lsp',
    }
  end,
}
