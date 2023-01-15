-- Luasnip
-- https://github.com/L3MON4D3/LuaSnip

-- Shorthands --{{{
local ls = require("luasnip")
local types = require("luasnip.util.types")
--}}}

-- Config --{{{
-- virtual text
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI", -- Update more often, (:h events)
  ext_opts = {
    [types.choiceNode] = {
      active = {
        --virt_text = { { "choiceNode", "Comment" } },
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
  },
  ext_base_prio = 300, -- treesitter-hl has 100, use something higher (default is 200).
  ext_prio_increase = 1, -- minimal increase in priority.
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})
--}}}

-- Keymaps --{{{

-- Reload snippets <Ctrl-u>
vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>source ~/.config/nvim/lua/user/plugins/luasnip.lua<CR>')

-- Jump forward (expand) <Ctrl-k>
vim.keymap.set({ "i", "s" }, "<c-b>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Jump backwards <Ctrl-j>
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable() then
    ls.jump(-1)
  end
end, { silent = true })

--vim.keymap.set({ "i", "s" }, "<a-p>", function()
--  if ls.expand_or_jumpable() then
--    ls.expand()
--  end
--end, { silent = true })

vim.keymap.set( "i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

--vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

-- }}}

-- Snippets --{{{

-- Lua
require("luasnip.loaders.from_lua").load({
  paths = "~/.config/nvim/snippets/"
})

-- VS Code & Friendly snippets
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" }
})

--}}}

