return {
  "mickael-menu/zk-nvim",
  ft = { "markdown" }, -- load only for markdown
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zk").setup({
      picker = "telescope",

      -- Where your notes live
      -- Use "." if your git repo IS the zettelkasten
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })

    local opts = { noremap = true, silent = true }

    -- Core ZK actions
    vim.keymap.set("n", "<leader>zn", "<cmd>ZkNew<CR>", opts)
    vim.keymap.set("n", "<leader>zo", "<cmd>ZkNotes<CR>", opts)
    vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<CR>", opts)
    vim.keymap.set("n", "<leader>zb", "<cmd>ZkBacklinks<CR>", opts)
    vim.keymap.set("n", "<leader>zl", "<cmd>ZkLinks<CR>", opts)

    -- Create note from selection (great for refactoring inbox)
    vim.keymap.set("v", "<leader>zn", ":'<,'>ZkNewFromTitleSelection<CR>", opts)

    -- Optional: follow wiki links with <CR>
    vim.keymap.set("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  end,
}
