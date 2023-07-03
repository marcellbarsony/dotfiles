-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://tree-sitter.github.io/tree-sitter/

require'nvim-treesitter.configs'.setup {

  -- Modules
  -- https://github.com/nvim-treesitter/nvim-treesitter#modules
  ensure_installed = { "lua", "markdown", "python", "rust" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },

  -- Highlight
  -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
  highlight = {
    enable = true,
    disable = { "" },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    -- VIM Regex
    additional_vim_regex_highlighting = false,
  },

  -- Available modules
  -- https://github.com/nvim-treesitter/nvim-treesitter#available-modules

  -- Incremental selection
  -- https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
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
