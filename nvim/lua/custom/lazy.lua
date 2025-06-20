-- Lazy.nvim
-- https://lazy.folke.io/
-- https://github.com/folke/lazy.nvim

-- Core config {{{
require("custom.core")
-- }}}

-- Bootstrap Lazy.nvim {{{
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
-- }}}

-- Lazy `runtimepath` {{{
vim.opt.rtp:prepend(lazypath)
-- }}}

-- Leader {{{
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- }}}

-- Setup {{{
require("lazy").setup({
  spec = {
    { import = "custom.dap" },
    { import = "custom.lang" },
    { import = "custom.mason" },
    { import = "custom.plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = false,
    border = "none",
    -- Icons {{{
    icons = {
      cmd = " ",
      config = "",
      debug = "● ",
      event = " ",
      favorite = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒"
      }
    }
    -- }}}
  },
  profiling = {
    loader = false,
    require = false
  }
})
-- }}}

-- Colorscheme {{{
vim.cmd [[colorscheme theme]]
-- }}}
