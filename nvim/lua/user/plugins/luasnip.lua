-- Luasnip
-- https://github.com/L3MON4D3/LuaSnip

-- Variables
local ls = require("luasnip")
local types = require("luasnip.util.types")

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

-- Snippets (Custom)
--require("luasnip.loaders.from_vscode").lazy_load({
--  paths = { "~/.local/share/nvim/site/pack/packer/start/snippets/" }
--  --paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets/" } -- FriendlySnippets
--})

ls.setup({
	snip_env = {
		s = function(...)
			local snip = ls.s(...)
			-- we can't just access the global `ls_file_snippets`, since it will be
			-- resolved in the environment of the scope in which it was defined.
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
		parse = function(...)
			local snip = ls.parser.parse_snippet(...)
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
		-- remaining definitions.
		...
	},
	...
})

-- Snippets (Lua)
require("luasnip.loaders.from_lua").load({
  paths = "~/.local/share/nvim/site/pack/packer/start/snippets/lua"
})
