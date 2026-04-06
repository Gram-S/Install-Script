-- INIT.LUA for neo vim installed via dnf tree (cli), requires the colors directory

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { 

-- Super epic Markdown Render, run with :LivePreview start
{
  "brianhuster/live-preview.nvim",
  opts = {},
},

-- Cute files to netrw
{
  "prichrd/netrw.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
},

{
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",  -- Use the latest tagged version
  opts = {},  -- This causes the plugin setup function to be called
  keys = {
    {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
    {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

    {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
    {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},
  },
},

    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Line numbers
vim.opt.number = true          -- absolute line numbers

-- Enable true colors in terminal
vim.opt.termguicolors = true

-- Set Birds of Paradise as the colorscheme
vim.cmd("colorscheme birds-of-paradise")

-- System clipboard with Ctrl+C and Ctrl+V
vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Hide hidden files/directories in netrw
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'
vim.g.netrw_hide = 1

-- Change Shift + Right to end of word
vim.keymap.set('i', '<S-Right>', '<C-o>e<Right>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', 'el', { noremap = true, silent = true })

-- R to redo 
vim.keymap.set('n', 'r', '<C-r>', {})

-- Disable mouse movement
vim.opt.mouse = ""

-- Remove the scroll down with shift + down`
vim.keymap.set('n', '<S-Down>', '10j', {})
vim.keymap.set('n', '<S-Up>', '10k', {})
vim.keymap.set('i', '<S-Up>', '<C-o>9k<Up>', {})
vim.keymap.set('i', '<S-Down>', '<C-o>9j<Down>', {})

-- Netwr directory exit at file
vim.g.netrw_keepdir = 0

-- Let d clear a line
vim.keymap.set('n', 'd', function()
  vim.api.nvim_set_current_line('')
end, { noremap = true, silent = true })

-- Use E to open netwr
vim.api.nvim_create_user_command('E', function()
  vim.cmd('Explore ' .. vim.fn.expand('%:p:h'))
end, {})
