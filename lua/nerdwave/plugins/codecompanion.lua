return {
  'olimorris/codecompanion.nvim',
  opts = {
    display = {
      chat = {
        window = {
          opts = {
            cursorline = true,
            cursorcolumn = true,
          },
        },
        intro_message = '🎉 CodeCompanion activated! Let\'s build something awesome together! (Press ? for sidekick options)',
        show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
        auto_scroll = true,
      },
      diff = {
        provider = 'mini_diff',
      },
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
        opts = {
          prompt_decorator = function(message, _, _) return string.format([[<prompt>%s</prompt>]], message) end,
        },
      },
      inline = {
        adapter = 'anthropic',
      },
    },
    extensions = {
      vectorcode = {
        enabled = true,
        opts = {
          add_tool = true,
        },
      },
      history = {
        enabled = true,
        opts = {
          -- Keymap to open history from chat buffer (default: gh)
          keymap = 'gh',
          -- Automatically generate titles for new chats
          auto_generate_title = true,
          ---On exiting and entering neovim, loads the last chat on opening chat
          continue_last_chat = false,
          ---When chat is cleared with `gx` delete the chat from history
          delete_on_clearing_chat = true,
          -- Picker interface ("telescope" or "snacks" or "default")
          picker = 'telescope',
          ---Enable detailed logging for history extension
          enable_logging = false,
          ---Directory path to save the chats
          dir_to_save = vim.fn.stdpath('data') .. '/codecompanion-history',
          -- Save all chats by default
          auto_save = true,
          -- Keymap to save the current chat manually
          save_chat_keymap = 'sc',
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'Davidyz/VectorCode',
    'echasnovski/mini.diff',
    'ravitemer/codecompanion-history.nvim',
  },
  init = function() require('nerdwave.lib.codecompanion.fidget-spinner'):init() end,
}
