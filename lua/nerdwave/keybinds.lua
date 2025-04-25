-- ###########################################################################################
-- KEYMAP ####################################################################################

----------
-- General

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

-- take care of the devil
vim.keymap.set('n', 'Q', '<nop>')

----------
-- Plugins

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- formatting
local formatting = require('nerdwave.lib.formatting')
vim.keymap.set('n', '<leader>ff', formatting.format_with_notif, { noremap = true })

-- nvim-comment
vim.keymap.set('n', '<leader>/', vim.cmd.CommentToggle)
vim.keymap.set('v', '<leader>/', ':\'<,\'>CommentToggle<CR>vgv', { silent = true, noremap = true })

-- gitsigns
vim.keymap.set('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end)

-- oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>')

-- telescope
local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, { noremap = true, desc = 'Find files' })
vim.keymap.set(
  'n',
  '<leader>pp',
  function() telescopeBuiltin.find_files({ hidden = true }) end,
  { noremap = true, desc = 'Find files, including hidden files' }
)
vim.keymap.set('n', '<leader>ps', telescopeBuiltin.live_grep, {
  noremap = true,
  desc = 'Search in files',
})
vim.keymap.set('n', '<leader>pb', telescopeBuiltin.buffers, {
  noremap = true,
  desc = 'Find buffers',
})
vim.keymap.set(
  'n',
  '<leader>pc',
  telescopeBuiltin.current_buffer_fuzzy_find,
  { noremap = true, desc = 'Find in current buffer' }
)
vim.keymap.set(
  'n',
  '<leader>pn',
  require('telescope').extensions.fidget.fidget,
  { noremap = true, desc = 'Show notifications in telescope' }
)
vim.keymap.set(
  'n',
  '<leader>ss',
  function() telescopeBuiltin.builtin(require('telescope.themes').get_dropdown({ previewer = true })) end,
  { noremap = true, desc = 'Show telescope builtin' }
)

-- codecompanion
local codecompanion = require('codecompanion')
vim.keymap.set('n', '<leader>ct', codecompanion.toggle, { noremap = true, desc = 'Toggle code companion buffer' })
-- cc as shortcut for code companion
vim.cmd([[cab cc CodeCompanion]])
vim.keymap.set('n', '<leader>cc', codecompanion.actions, { noremap = true, desc = 'Show code companion actions' })
