-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://tree-sitter.github.io/tree-sitter/

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
      "BufReadPre",
      "BufNewFile"
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts_extend = { "ensure_installed" },
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      -- Modules {{{
      -- https://github.com/nvim-treesitter/nvim-treesitter#modules
      -- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      -- }}}

      -- Highlights {{{
      -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
      },
      -- }}}

      -- Incremental selection {{{
      -- https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      -- }}}

      -- Indentation {{{
      -- https://github.com/nvim-treesitter/nvim-treesitter#indentation
      indent = {
        enable = true
      },
      -- }}}

      -- Textobjects {{{
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
      -- }}}
    },
    config = function ()
      -- Overwrite highlights {{{
      -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
      -- ~/.local/share/nvim/lazy/tokyonight.nvim/lua/tokyonight/theme.lua
      vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", { link = "operator" })
      vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { link = "operator" })
      vim.api.nvim_set_hl(0, "@variable.builtin", { link = "operator" })
      vim.api.nvim_set_hl(0, "@namespace.builtin", { link = "operator" })
      -- }}}
    end
  },
}
