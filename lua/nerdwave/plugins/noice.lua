return {

  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- 'rcarriga/nvim-notify',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('noice').setup({
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = 'cmdline', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
      },
      notify = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          silent = true,
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          -- override the lsp markdown formatter with Noice
          ['vim.lsp.util.stylize_markdown'] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ['cmp.entry.get_documentation'] = true,
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = 'notify',
          opts = {},
        },
      },
      health = {
        checker = true, -- Disable if you don't want health checks to run
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
    require('telescope').load_extension('noice')
  end,
}
