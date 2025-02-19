-- Lazy.nvim
-- https://lazy.folke.io/
-- https://github.com/folke/lazy.nvim

-- Core options {{{
require("custom.core")
-- }}}

-- Bootstrap lazy.nvim {{{
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
    { import = "custom.theme" }
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true }, -- check for plugin updates
})
-- }}}

vim.cmd [[colorscheme tokyonight]]
