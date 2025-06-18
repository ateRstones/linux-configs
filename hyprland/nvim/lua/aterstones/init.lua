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

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })

-- Make system clipboard the default for most operations (except 'd')
vim.opt.clipboard:append('unnamedplus')

-- Optional: If you want to ensure 'd' (delete) does NOT use the clipboard by default,
-- you can remap 'd' to explicitly use the default register.
-- These mappings are only needed if you find that 'd' is copying to the clipboard.

-- Normal mode: 'd' uses the default register
vim.keymap.set('n', 'd', '"zd', { noremap = true })
vim.keymap.set('n', 'dd', '"zdd', { noremap = true })
vim.keymap.set('n', 'D', '"zD', { noremap = true })

-- Visual mode: 'd' uses the default register
vim.keymap.set('v', 'd', '"zd', { noremap = true })
vim.keymap.set('v', 'D', '"zD', { noremap = true })
