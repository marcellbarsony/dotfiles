-- Luasnip
-- https://github.com/L3MON4D3/LuaSnip

-- Variables
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- Config
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI", -- Update more often, :h events for more info.
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300, -- treesitter-hl has 100, use something higher (default is 200).
	ext_prio_increase = 1, -- minimal increase in priority.
	enable_autosnippets = true,
})

-- Snippets (custom)
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "~/.local/share/nvim/site/pack/packer/start/snippets/" }
})

-- Snippets (friendly-snippets)
--require("luasnip.loaders.from_vscode").lazy_load({
--  paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" }
--})

