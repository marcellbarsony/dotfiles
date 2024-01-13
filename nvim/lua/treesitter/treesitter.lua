-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://tree-sitter.github.io/tree-sitter/

require"nvim-treesitter.configs".setup {
  -- Modules
  -- https://github.com/nvim-treesitter/nvim-treesitter#modules
  ensure_installed = {
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust"
  },
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },

  -- Highlight
  -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },

  -- Available modules
  -- https://github.com/nvim-treesitter/nvim-treesitter#available-modules

  -- Incremental selection
  -- https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  -- Indentation
  -- https://github.com/nvim-treesitter/nvim-treesitter#indentation
  indent = {
    enable = true
  },
}

-- Overwrite highlights
-- https://github.com/nvim-treesitter/nvim-treesitter#highlight
-- ~/.local/share/nvim/lazy/tokyonight.nvim/lua/tokyonight/theme.lua
vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", { link = "operator" })
vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { link = "operator" })
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "operator" })
vim.api.nvim_set_hl(0, "@namespace.builtin", { link = "operator" })
