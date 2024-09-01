-- Rust snippets [Loops]
-- Docs: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

-- SHORTHANDS -- {{{
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

-- FUNCTIONS -- {{{
-- Same
local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end
-- }}}

-- SNIPPETS -- {{{
ls.add_snippets("rust", {
  s( "for",
    fmt("for {} in {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "item"),
        i(2, "iterator"),
        i(3, "// ..."),
        i(4),
      }
    )
  ),

  s( "loop",
    fmt("{}\n" ..
      "{}",
      {
        c(1, {
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "'" }),
              i(2, "label"),
              t({ " loop {", "\t" }),
              i(3, "// ..."),
              t({ "", "\tbreak '" }),
              same(2),
              t({ ";", "}" }),
            })
          end),
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "loop {", "\t" }),
              i(2, "// ..."),
              t({ "", "}" }),
            })
          end),
        }),
        i(2),
      }
    )
  ),

  s( "while",
    fmt("while {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "bool_condition"),
        i(2, "// ..."),
        i(3),
      }
    )
  ),
})
--}}}
