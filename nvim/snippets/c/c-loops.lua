-- C snippets [Loops]
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
  s("for", -- for
    fmt("for ({}; {}; {}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "init"),
        i(2, "cond"),
        i(3, "step"),
        i(4, "// code"),
        i(5)
      }
    )
  ),

  s("while", -- while
    fmt("while ({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "condition"),
        i(2, "// code"),
        i(3)
      }
    )
  ),

  s("do-while", -- do-while
    fmt("do {{\n" ..
      "\t{}\n" ..
      "}} while ({});\n" ..
      "{}",
      {
        i(1, "// code"),
        i(2, "condition"),
        i(3)
      }
    )
  ),

  s("switch", -- switch
    fmt("switch ({}) {{\n" ..
      "\tcase {}:\n" ..
      "\t\t{}\n" ..
      "\t\t{}{}\n" ..
      "\tdefault:\n" ..
      "\t\t{}\n" ..
      "\t\tbreak;\n" ..
      "}}{}",
      {
        i(1, "condition"),
        i(2, "1"),
        i(3, "// code"),
        i(4, "break;"),
        i(5, ""),
        i(6, "// code"),
        i(7)
      }
    )
  ),

})
-- }}}
