-- ###########################################################################################
-- KEYMAP ####################################################################################

----------
-- General

-- move through wrapped lines
vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })
vim.keymap.set('n', '<Up>', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
vim.keymap.set('n', '<Down>', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- move line up/down
vim.keymap.set('n', '<M-Up>', ':m-2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-Down>', ':m+1<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-k>', ':m-2<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<M-j>', ':m+1<CR>', { silent = true, noremap = true })

-- move selection up/down
vim.keymap.set('v', '<M-Up>', ':m \'<-2<CR>vgv=vgv', { silent = true, noremap = false })
vim.keymap.set('v', '<M-Down>', ':m \'>+1<CR>vgv=vgv', { silent = true, noremap = true })
vim.keymap.set('v', '<M-k>', ':m \'<-2<CR>vgv=vgv', { silent = true, noremap = true })
vim.keymap.set('n', '<M-j>', ':m \'>+1<CR>vgv=vgv', { silent = true, noremap = true })
-- formatting
vim.keymap.set('n', '<leader>ff', require('nerdwave.formatting').format_with_notif, { noremap = true })

-- pane navigation, spllitting, etc
vim.keymap.set('n', '<C-M-;>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-M-6>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<C-M-5>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-M-4>', '<C-w>j', { noremap = true })

-- resizing
vim.keymap.set('n', '<C-M-`>', '<C-w><', { noremap = true })
vim.keymap.set('n', '<C-M-3>', '<C-w>>', { noremap = true })
vim.keymap.set('n', '<C-M-2>', '<C-w>+', { noremap = true })
vim.keymap.set('n', '<C-M-1>', '<C-w>-', { noremap = true })

-- creating and closing splits
vim.keymap.set('n', '<C-M-s>', '<C-w>v<C-w>l', { noremap = true })
vim.keymap.set('n', '<C-M-c>', '<C-w>s<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-M-w>', '<C-w>q', { noremap = true })
vim.keymap.set('n', '<C-M-9>', '<C-w>_', { noremap = true })
vim.keymap.set('n', '<C-M-8>', '<C-w>|', { noremap = true })
vim.keymap.set('n', '<C-M-7>', '<C-w>=', { noremap = true })

-- terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- yoinks
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- the name is the 'these are pretty neat'-agen
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- take care of te devil
vim.keymap.set('n', 'Q', '<nop>')

----------
-- Plugins

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- -- harpoon
-- local harpoon = require('harpoon')
-- vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
-- vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
-- vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end)
-- vim.keymap.set('n', '<C-n>', function() harpoon:list():select(3) end)
-- vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end)

-- graple
vim.keymap.set('n', '<leader>a', '<cmd>Grapple toggle<cr>', { desc = 'Tag a file', noremap = true })
vim.keymap.set('n', '<c-e>', '<cmd>Grapple toggle_tags<cr>', { desc = 'Toggle tags menu', noremap = true })
vim.keymap.set('n', '<C-S-e>', '<cmd>Grapple toggle_scopes<cr>', { desc = 'Toggle tags menu', noremap = true })

vim.keymap.set('n', '<c-h>', '<cmd>Grapple select index=1<cr>', { desc = 'Select first tag', noremap = true })
vim.keymap.set('n', '<c-t>', '<cmd>Grapple select index=2<cr>', { desc = 'Select second tag', noremap = true })
vim.keymap.set('n', '<c-n>', '<cmd>Grapple select index=3<cr>', { desc = 'Select third tag', noremap = true })
vim.keymap.set('n', '<c-s>', '<cmd>Grapple select index=4<cr>', { desc = 'Select fourth tag', noremap = true })

-- nvim-comment
vim.keymap.set('n', '<leader>/', vim.cmd.CommentToggle)
vim.keymap.set('v', '<leader>/', ':\'<,\'>CommentToggle<CR>vgv', { silent = true, noremap = true })

-- zen-mode
vim.keymap.set('n', '<leader>zm', function() require('zen-mode').toggle() end)

-- gitsigns
vim.keymap.set('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end)

-- telescope
local telescope = require('telescope')
local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, { noremap = true, desc = 'Find files' })
vim.keymap.set(
  'n',
  '<leader>pp',
  function() telescopeBuiltin.find_files({ hidden = true }) end,
  { noremap = true, desc = 'Find files, including hidden files' }
)
vim.keymap.set('n', '<leader>ps', telescopeBuiltin.live_grep, { noremap = true, desc = 'Search in files' })
vim.keymap.set('n', '<leader>ph', telescopeBuiltin.help_tags, { noremap = true, desc = 'Find help tags' })
vim.keymap.set('n', '<leader>pb', telescopeBuiltin.buffers, { noremap = true, desc = 'Find buffers' })
vim.keymap.set('n', '<leader>pr', telescopeBuiltin.grep_string, { noremap = true, desc = 'Find in current buffer' })
vim.keymap.set(
  'n',
  '<leader>pc',
  telescopeBuiltin.current_buffer_fuzzy_find,
  { noremap = true, desc = 'Find in current buffer' }
)
vim.keymap.set(
  'n',
  '<leader>sk',
  function()
    telescopeBuiltin.keymaps(
      require('telescope.themes').get_dropdown({ previewer = true, layout_config = { width = 0.6 } })
    )
  end,
  { noremap = true, desc = 'Show keymaps' }
)
vim.keymap.set(
  'n',
  '<leader>ss',
  function() telescopeBuiltin.builtin(require('telescope.themes').get_dropdown({ previewer = true })) end,
  { noremap = true, desc = 'Show telescope builtin' }
)
vim.keymap.set(
  'n',
  '<leader>pg',
  ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
  { noremap = true, desc = 'Open file browser at current path' }
)
vim.keymap.set('n', '<leader>pn', ':Telescope noice<CR>', { noremap = true, desc = 'Open noice in telescope' })
vim.keymap.set(
  'n',
  '<leader>pt',
  ':TodoTelescope<CR>',
  { noremap = true, silent = true, desc = 'Open todos in telescope' }
)

-- oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>')
