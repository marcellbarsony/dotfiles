-- Python snippets [Control]
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
ls.add_snippets("python", {
  s( "elif",
    fmt("elif {}:\n" ..
      "\t{}{}",
      {
        i(1, "expression"),
        i(2, "pass"),
        i(0),
      }
    )
  ),

  s( "else",
    fmt("else:\n" ..
      "\t{}{}",
      {
        i(1, "pass"),
        i(0),
      }
    )
  ),

  s( "for",
    fmt("for {} in {}:\n" ..
      "\t{}\n" ..
      "{}{}",
      {
        i(1, "value"),
        i(2, "iterable"),
        i(3, "pass"),
        c(4, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),

  s( "if", -- if-else
    fmt('if {}:\n' ..
      '\t{}\n' ..
      '{}{}', {
        i(1, "condition"),
        i(2, "pass"),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),

  s( "while", -- while-else
    fmt("while {}:\n" ..
      "\t{}\n" ..
      "{}{}",
      {
        i(1, "condition"),
        i(2, "pass"),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),
})
-- }}}
