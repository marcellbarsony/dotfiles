-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {

  ensure_installed = { "lua", "markdown", "python" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },

  -- Modules
  highlight = {
    enable = true,
    -- Disable languages
    disable = { "" },
    -- Disable limit
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    -- VIM Regex highlighting
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters (e.g. html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --colors = {
      -- Colors
    --},
    
    --termcolors = {
    --}
  }

}
