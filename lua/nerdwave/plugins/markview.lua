return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- For blink.cmp's completion
  -- source
  dependencies = {
    'saghen/blink.cmp',
  },
  ft = { 'markdown', 'codecompanion' },
  opts = {
    preview = {
      filetypes = { 'markdown', 'codecompanion' },
      ignore_buftypes = {},
    },
  },
}
