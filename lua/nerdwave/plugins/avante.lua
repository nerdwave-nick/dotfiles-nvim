return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    instructions_file = 'AGENTS.md',
    provider = 'claude-code',
    providers = {
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-haiku-4-5',
        timeout = 30000, -- Timeout in milliseconds
        disabled_tools = { 'fetch' },
        extra_request_body = {
          temperature = 0.30,
        },
      },
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
