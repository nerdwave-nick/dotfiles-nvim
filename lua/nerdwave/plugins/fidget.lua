return {
  'j-hui/fidget.nvim',
  tag = 'v1.6.1', -- Make sure to update this to something recent!
  opts = {
    -- options
  },
  init = function() vim.notify = require('fidget').notify end,
}
