-- Global snippets
-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

-- SHORTHANDS --{{{
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
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
--}}}

-- FUNCTIONS --{{{
-- Time
local function time()
  local current_time = os.date("%H:%M")
  return current_time
end
--}}}

-- SNIPPETS --{{{
ls.add_snippets("all", {
	s({ -- Date
    trig="date",
    name="Date",
    dscr="Current date" }, {
		f(function()
      return os.date("%D - %d-%m-%Y")
    end)
	}),
	s({ -- Lorem sentence
    trig="lorem-sentence",
    name="Lorem",
    dscr="Lorem sentence",
    }, {
		t("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
	}),
	s({ -- pwd
    trig="pwd",
    name="pwd",
    dscr="Current working directory"
    }, {
		f(function()
      return os.getenv("PWD")
    end)
	}),
	s({ -- Time
    trig="time",
    name="Time",
    dscr="Current time" }, {
		f(time),
	}),
})
--}}}
