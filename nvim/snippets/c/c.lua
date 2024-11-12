-- C snippets
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
ls.add_snippets("c", {
  s("fn",  -- function
    fmt("{} {}({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        c(1, {
          sn(nil, {i(1), i(2, "") }),
          sn(nil, {i(1), t"void" }),
          sn(nil, {i(1), t"char*" }),
          sn(nil, {i(1), t"double" }),
          sn(nil, {i(1), t"float" }),
          sn(nil, {i(1), t"int" }),
          sn(nil, {i(1), t"int*" }),
        }),
        i(2, "name"),
        c(3, {
          sn(nil, {i(1), i(2, "args") }),
          sn(nil, {i(1), i(2, "") }),
        }),
        i(4, "// code"),
        i(5),
      }
    )
  ),

  s("printf",  -- printf
    fmt('printf("{}", {});\n' ..
      "{}",
      {
        i(1, ""),
        i(2, ""),
        i(3),
      }
    )
  ),
})
-- }}}
