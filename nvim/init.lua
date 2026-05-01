-- INIT.LUA for neo vim installed via dnf tree (cli), requires the colors directory

-- Turn off the little things at the end of command line
vim.opt.ruler = false

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

-- Treesitter syntax highlighting
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      highlight = { enable = true },
      ensure_installed = { 'lua', 'python', 'bash' },
    }
  end,
},

-- ICONS TO NETRW
{
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {}
  end,
},
{
  'prichrd/netrw.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('netrw').setup {}
  end,
},


-- Rainbow Brackets 
{
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup {}
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

-- New status line
{
  'echasnovski/mini.statusline',
  version = '*',
  config = function()
    local statusline = require('mini.statusline')

    vim.api.nvim_set_hl(0, 'BarMode',    { ctermfg = 2, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarDir',     { ctermfg = 7, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarFile',    { ctermfg = 7, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarType',    { ctermfg = 7, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarSaved',   { ctermfg = 2, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarUnsaved', { ctermfg = 1, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'BarExtra',   { ctermfg = 7, ctermbg = 0  })
    vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 8 })
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
          local mode     = mode_map[vim.fn.mode()] or vim.fn.mode()
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
          local bufpath  = vim.api.nvim_buf_get_name(0)
          local dir
          if bufpath ~= '' then
            dir = vim.fn.fnamemodify(bufpath, ':h:t') .. ' /'
          else
            dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' /'
          end
          local filetype = vim.bo.filetype ~= '' and vim.bo.filetype or 'plain'
          local modified = vim.bo.modified and '● unsaved' or '✔ saved'
          local mod_hl   = vim.bo.modified and 'BarUnsaved' or 'BarSaved'
          local ftime    = vim.fn.getftime(bufpath)
          local file_age = ftime > 0 and os.date('%b %d %I:%M %p', ftime) or '-'

          return statusline.combine_groups({
            { hl = 'BarMode',  strings = { mode } },
            { hl = 'BarDir',   strings = { dir } },
            { hl = 'BarFile',  strings = { filename } },
            '%=',
            { hl = 'BarType',  strings = { filetype } },
            { hl = mod_hl,     strings = { modified } },
            { hl = 'BarExtra', strings = { 'Opened:', file_age } },
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
vim.opt.termguicolors = false
vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 8, italic = true })

-- Override shift behavior so it can't do to different lines
vim.keymap.set('i', '<S-Right>', function()
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.')
  local line_len = #line
  if col > line_len then return end
  local rest = line:sub(col + 1)
  local space = rest:find('%s')
  if space then
    vim.fn.cursor(vim.fn.line('.'), col + space)
  else
    vim.fn.cursor(vim.fn.line('.'), line_len + 1)
  end
end, { noremap = true, silent = true })

vim.keymap.set('i', '<S-Left>', function()
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.')
  if col == 1 then return end
  local before = line:sub(1, col - 2)
  local space = before:reverse():find('%s')
  if space then
    vim.fn.cursor(vim.fn.line('.'), col - space)
  else
    vim.fn.cursor(vim.fn.line('.'), 1)
  end
end, { noremap = true, silent = true })

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

-- Multine cursor editing
vim.keymap.set('n', '<C-Up>', '<C-v>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', '<C-v>j', { noremap = true, silent = true })

-- Let d clear a line
vim.keymap.set('n', 'd', function()
  vim.api.nvim_set_current_line('')
end, { noremap = true, silent = true })

-- Use E to open netwr
vim.api.nvim_create_user_command('E', function()
  vim.cmd('Explore ' .. vim.fn.expand('%:p:h'))
end, {})
