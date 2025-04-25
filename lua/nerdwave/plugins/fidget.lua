return {
  'j-hui/fidget.nvim',
  lazy = false,
  tag = 'v1.6.1', -- Make sure to update this to something recent!
  config = function()
    require('fidget').setup({})
    vim.notify = require('fidget').notify
  end,
}
