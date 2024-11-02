-- Core options
require("core")

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Lazy `runtimepath`
vim.opt.rtp:prepend(lazypath)

-- Lazy setup
require("lazy").setup({
  spec = {
    { import = "custom" }, -- ~/.config/nvim/lua/custom/
  },
  checker = { enabled = false },
})

-- Colorscheme
vim.cmd [[colorscheme tokyonight]]



-- OLD Config {{{
-- -- Lazy
-- require("lazy-nvim")

-- -- Options
-- require("core")
--
-- -- Colors
-- -- vim.cmd [[colorscheme theme]]
-- -- require("theme.catppucin")
-- require("theme.tokyonight")
--
-- -- DAP
-- require("dap.nvim-dap")
-- require("dap.nvim-dap-ui")
-- require("dap.nvim-dap-python")
-- require("dap.nvim-dap-vtxt")
--
-- -- CMP & Snipppet
-- require("plugins.nvim-cmp")
-- require("plugins.luasnip")
--
-- -- GIT
-- require("plugins.gitsigns")
--
-- -- LSP
-- require("lsp.rustaceanvim")
-- require("lsp.tsserver")
-- require("plugins.trouble")
--
-- -- Mason
-- require("mason.mason")
-- require("mason.mason-lspconfig")
-- require("mason.mason-nvim-dap")
--
-- -- Navigation
-- require("plugins.alpha-nvim")
-- require("plugins.harpoon")
-- require("plugins.oil")
-- require("plugins.which-key")
--
-- -- Plugins
-- require("plugins.autopairs")
-- require("plugins.colorizer")
-- require("plugins.hex")
-- require("plugins.indent-blankline")
-- require("plugins.lualine")
-- require("plugins.markdown")
-- require("plugins.toggleterm")
--
-- -- Telescope
-- require("plugins.telescope")
--
-- -- Treesitter
-- require("treesitter.treesitter")
-- require("treesitter.treesitter-context")
-- }}}
