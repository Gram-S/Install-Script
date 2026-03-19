-- INIT.LUA for neo vim installed via dnf tree (cli), requires the colors directory

-- Start insert mode for every file
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end
})

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

-- Ctrl+Z undo, Ctrl+R redo
vim.keymap.set('n', '<C-u>', 'u', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<C-r>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-u>', '<Esc>ui', { noremap = true, silent = true })
vim.keymap.set('i', '<C-r>', '<Esc><C-r>i', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert"
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert"
})

vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true, silent = true })

vim.opt.number = true
