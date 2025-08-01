return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = 'claude',
    providers = {
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-opus-4-20250514',
        timeout = 30000, -- Timeout in milliseconds
        disabled_tools = { 'fetch' },
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
    web_search_engine = {
      provider = 'searxng',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  },
}
