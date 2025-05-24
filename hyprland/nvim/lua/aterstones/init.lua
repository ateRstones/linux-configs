-- Disable compatibility with old-time vi
vim.opt.compatible = false

-- Syntax highlighting and filetype detection
--vim.cmd('syntax on')
--vim.cmd('filetype on')
--vim.cmd('filetype plugin on')
--vim.cmd('filetype indent on')

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor line/column (commented out to match your original config)
-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Scrolling and wrapping
vim.opt.scrolloff = 10
vim.opt.wrap = false

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- UI settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true

-- History
vim.opt.history = 1000

-- Wildmenu and completion
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list', 'longest' }
vim.opt.wildignore = { '*.docx', '*.jpg', '*.png', '*.gif', '*.pdf', '*.pyc', '*.exe', '*.flv', '*.img', '*.xlsx' }

-- Backups
vim.opt.backup = false

vim.g.mapleader = " " -- Leader before lazy

require("aterstones.lazy_init")

-- Theme
vim.cmd("colorscheme kanagawa")

