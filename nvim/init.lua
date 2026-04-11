-- INIT.LUA for neo vim installed via dnf tree (cli), requires the colors directory

-- Turn off the little things at the end of command line
vim.opt.ruler = false

-- Slightly darker command line
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg or 0x1e1c1a
    local r = math.max(0, bit.rshift(bit.band(bg, 0xff0000), 16) - 10)
    local g = math.max(0, bit.rshift(bit.band(bg, 0x00ff00), 8) - 10)
    local b = math.max(0, bit.band(bg, 0x0000ff) - 40)
    vim.api.nvim_set_hl(0, 'MsgArea', { bg = r * 65536 + g * 256 + b })
  end,
})

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

-- Custom Dashboard
{
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      "                                                            ",
      " ▒▒ ▒█ ▓█▒▒░▓▒▒▒▒▒▒▒▒▒▓▒▒ ▒█▒ ░█░▒██▒  ░░▒░   ▒█  ▓  ▒░░░▓▓ ",
      " ░  ▒█ ██▓░ ▓▒▒▒▒▒▒▒▒▒▒▒▒ ▒▓▓  ▓ ░████   ▒░  ▓████░░░░░░░▓▒ ",
      " ▒ █▓▓ ███▒ ▒▒▒▒▒▒▒▒▒▒▒▒▓ ░▒█░ ▒ ░▓███▒  ▒▒░  ▒█▓░ ██ ░░░▒▓ ",
      " ░ █▒░ ▒▒░  ▒▒▒▒▒▒▒▒▒▒▒▓▓ ░▒█▒░▒ ░▒█████ ▒▒▒   █▒░▒██    ▒▓ ",
      "   █▒ █████▒ ░▒▒▓▒▒▒▒▒▒▒▒░░ ▒░ ▓   ██████▒▒▓█████████ ▒▒█▓▓ ",
      " ▓██▒ ▓████▓  ░░▒▒░░░░░▒▒░ ░▒  █  ▓█▓░      ░       ░ ░▒███ ",
      " ▓██▒▓██████▓   ▒▒░░░░░░▒▒░░░  █░▒█         ░          ░█   ",
      "   ██████████   ░░░▒▒▒▒▒▒▒▒▒░  ▒█▓░▒▒▒████████████▒███▓▒█▒█ ",
      "   ████▓▒▒▓███▒ ▒░              ░▒ ▓███▒ ░     ▒▒▓ ███▒░▓▒▓ ",
      " ▒  ██████▓▓███ ░██  ▓█▒  ▓█████▓██████▓ ░████████ ▓▒▒▒▓░▒▒ ",
      "  ░ ▓████████████████████████████████████ ▓███▓▓   ▒███▒░▒▓ ",
      "░█▒░▒    ░▓███████████████████████████████▓ ░░░░▒█████▓▒░▒▓ ",
      "               ████████████████████████▓▓██████████▓▒█▒▒ ▓▓ ",
      "  ░████████▓▒   ░█████████▓▓▓██████████████▓███▓▓▓▓███▓▒ ▓▓ ",
      "████████████████████████████▓████████████████████████▓▓▒ █▓ ",
      "▒█████▓█▓▓█▓█████████████████████████████████████████▒▓▒ ██ ",
      " ▒███▓▓▓▓█▓▓▓▓▓▓█████████████████████████████████████▓▓▒ ██ ",
      " ▒░██████████████████████████████████████████████████▓   ██ ",
      "    █████████████████████████████████████████████████▓░ ░█▓ ",
      " ▒▒  ▓█████████████████████████████▒▒███████████████▒█  ▒█▓ ",
      " ▒▒▒  ░███████████████▓▒▒████████  ▒██████████████░  █  ▒█▓ ",
      " ▒▒░▒   ████████████████▒   ▓██░ ▒██████████████▒   ▒█  ██▓ ",
      " ▒▒▒▒▒░  ▓█████████████████████▓██████████████▓   ░▒▓█  ██▓ ",
      " ▒▒▒▒▒▒▒    ████████████████████████████████░  ▓░ ░▓▓█ ░██▓ ",
      " ▒▒▒▒▒▒▒▒▒░     ██████████████████████████   ▒▓█░  ▓▓▒ ░███ ",
      " ▒▒▒▒▒░▒▒▒▒▒▓▒░    ░███████████████████▓   ▒▓▓▓█   ██▒  ██▓ ",
      " ▒▒▒▒▒░▒▒░░░▒▒▒▓▒▒      ▓▒██████████▓    ▒▓▒▓▓██▒  ██░ ░█▓▓ ",
      "      __   __ _                   _                    ",
      "      \\ \\ / /(_) _ __  _  _  ___ | | ___ _  _  ___ ___ ",
      "       \\ V / | || '  \\| || |/ -_)| |(_-<| || |(_-</ -_)",
      "        \\_/  |_||_|_|_|\\_,_|\\___||_|/__/ \\_, |/__/\\___|",
      "                                         |__/          ",

    
    }
    dashboard.section.header.opts = {
      hl = '',
      position = 'center',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  Filetree',     ':E<CR>'),
      dashboard.button('r', '  Recent',  ':Telescope oldfiles<CR>'),
      dashboard.button('c', '  Config',   ':e ~/.config/nvim/init.lua<CR>'), 
      dashboard.button('q', '  Quit',          ':qa<CR>'),
    }

    alpha.setup(dashboard.config)
  end,
},

-- Markdown renderer
{
  "brianhuster/live-preview.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- optional
  ft = { "markdown" },
  config = function()
    require("livepreview").setup({
      commands = {
        start = "LivePreview",
        stop = "StopPreview",
      },
      port = 5500,
    })
  end,
},

-- Cute files to netrw
{
  'echasnovski/mini.statusline',
  version = '*',
  config = function()
    local statusline = require('mini.statusline')

    local function set_highlights()
      local function lighten(hex, amount)
        local r = math.min(255, tonumber(hex:sub(2,3), 16) + amount)
        local g = math.min(255, tonumber(hex:sub(4,5), 16) + amount)
        local b = math.min(255, tonumber(hex:sub(6,7), 16) + amount)
        return string.format('#%02x%02x%02x', r, g, b)
      end

      local normal_bg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = 'Normal' }).bg or 0x1e1c1a)
      local normal_fg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = 'Normal' }).fg or 0xc5b9a8)
      local mid_bg    = lighten(normal_bg, 25)

      vim.api.nvim_set_hl(0, 'BarMode',    { fg = normal_fg, bg = lighten(normal_bg, 40) })
      vim.api.nvim_set_hl(0, 'BarDir',     { fg = normal_fg, bg = mid_bg })
      vim.api.nvim_set_hl(0, 'BarFile',    { fg = normal_fg, bg = lighten(normal_bg, 10) })
      vim.api.nvim_set_hl(0, 'BarType',    { fg = normal_fg, bg = mid_bg })
      vim.api.nvim_set_hl(0, 'BarSaved',   { fg = '#a6e3a1', bg = mid_bg })
      vim.api.nvim_set_hl(0, 'BarUnsaved', { fg = '#fab387', bg = mid_bg })
      vim.api.nvim_set_hl(0, 'BarExtra',   { fg = normal_fg, bg = lighten(normal_bg, 40) })
    end

    set_highlights()
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = set_highlights,
    })

    statusline.setup({
      content = {
        active = function()
          local mode_map = {
            n      = 'NORMAL',
            i      = 'INSERT',
            v      = 'VISUAL',
            V      = 'V-LINE',
            [''] = 'V-BLOCK',
            s      = 'SELECT',
            r      = 'REPLACE',
            c      = 'COMMAND',
          }
          local mode       = mode_map[vim.fn.mode()] or vim.fn.mode()
          local filename   = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
          local dir        = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
          local filetype   = vim.bo.filetype ~= '' and vim.bo.filetype or 'plain'
          local modified   = vim.bo.modified and '● unsaved' or '✔ saved'
          local mod_hl     = vim.bo.modified and 'BarUnsaved' or 'BarSaved'
          local ftime      = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
          local file_age   = ftime > 0 and os.date('%b %d %I:%M %p', ftime) or 'new file'

          return statusline.combine_groups({
            { hl = 'BarMode',  strings = { mode } },
            { hl = 'BarDir',   strings = { dir } },
            { hl = 'BarFile',  strings = { filename } },
            '%=',
            { hl = 'BarType',  strings = { filetype } },
            { hl = mod_hl,     strings = { modified } },
            { hl = 'BarExtra', strings = { file_age } },
          })
        end,
        inactive = function()
          return '%t'
        end,
      },
      use_icons = false,
      set_vim_settings = false,
    })

    vim.opt.laststatus = 0
    vim.opt.statusline = ''
    vim.opt.winbar = '%!v:lua.MiniStatusline.active()'
  end,
},

-- Multiple cursors
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

-- Override shift behavior so it can't do to different lines



-- Set Birds of Paradise as the colorscheme
vim.cmd("colorscheme birds-of-paradise")

-- System clipboard with Ctrl+C and Ctrl+V
vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Hide hidden files/directories in netrw
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'
vim.g.netrw_hide = 1

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
