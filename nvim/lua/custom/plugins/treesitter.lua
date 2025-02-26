-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://tree-sitter.github.io/tree-sitter/
-- `:h treesitter.txt`

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts_extend = { "ensure_installed" },
    ---@diagnostic disable-next-line: missing-fields
    opts = function ()
      require("nvim-treesitter.configs").setup {
        -- Modules {{{
        -- https://github.com/nvim-treesitter/nvim-treesitter#modules
        -- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "html",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "python",
          "printf",
          "query",
          "regex",
          "ron",
          "rust",
          "toml",
          "xml",
          "yaml"
        },
        -- }}}

        -- Highlights {{{
        highlight = {
          enable = true,
          disable = { "" },
          additional_vim_regex_highlighting = false
        },
        -- }}}

        -- Incremental selection {{{
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>"
          }
        },
        -- }}}

        -- Indentation {{{
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
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" }
          }
        },
        -- }}}

        -- Overwrite highlights {{{
        -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
        vim.api.nvim_set_hl(0, "@lsp.type.selfTypeKeyword", { link = "operator" }),
        vim.api.nvim_set_hl(0, "@variable.builtin", { link = "operator" }),
        vim.api.nvim_set_hl(0, "@lsp.type.selfKeyword", { link = "operator" }),
        vim.api.nvim_set_hl(0, "@namespace.builtin", { link = "operator" })
        -- }}}
      }
    end
  }
}
