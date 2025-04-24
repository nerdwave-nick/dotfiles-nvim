return {
  'nvim-treesitter/nvim-treesitter',
  -- lazy = true, event = "BufReadPost",
  config = function()
    require('nvim-treesitter.configs').setup({
      ignore_install = {},
      sync_install = false,
      modules = {},
      ensure_installed = {
        'html',
        'css',
        'make',
        'c',
        'cpp',
        'go',
        'lua',
        'rust',
        'tsx',
        'javascript',
        'typescript',
        'vue',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  build = ':TSUpdate',
}
