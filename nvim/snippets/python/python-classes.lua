-- Python snippets
-- Docs: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

-- SHORTHANDS {{{
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
-- }}}

-- FUNCTIONS {{{
-- Same
local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end
-- }}}

-- SNIPPETS {{{
ls.add_snippets("python", {
  s( "class",
    fmt("class {}({}):\n\n" ..
      '\t"""Docstring for {}"""\n\n'..
      '\tdef __init__(self, {}):\n'..
      '\t\t{}({}, self).__init__()\n' ..
      '\t\tself.arg = {}{}\n',
      {
        i(1, "ClassName"),
        i(2, "object"),
        same(1),
        i(3, "arg"),
        i(4, "super"),
        same(1),
        same(3),
        i(0),
      }
    )
  ),
})
-- }}}
