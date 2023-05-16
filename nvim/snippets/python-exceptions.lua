-- Python snippets [Exceptions]
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
-- Same
local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end
--}}}

-- SNIPPETS --{{{
ls.add_snippets("python", {
  s( -- try/except/else/finally
    "try",
    fmt("try:\n"..
      "\t{}\n"..
      "except {}{}\n"..
      "\t{}\n"..
      "{}{}", {
      i(1, "pass"),
      c(2, { -- Errors
        t{"Exception"},
        t{"NameError"},
        t{"TypeError"},
        t{"ValueError"},
        }),
      c(3, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({':'}),
          })
        end),
        d(1, function() -- as err:
          return sn(nil, {
            i(1),
            t({" as "}),
            i(2, "err"),
            t({":"}),
            })
        end),
      }),
      i(4, "continue"),
      c(5, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({''}),
          })
        end),
        d(1, function() -- else
          return sn(nil, {
            i(1),
            t({"else:", "\t"}),
            i(2, "pass"),
            })
        end),
        d(1, function() -- finally
          return sn(nil, {
            i(1),
            t({"else:", "\t"}),
            i(2, "pass"),
            t({"", "finally:", "\t"}),
            i(3, "pass"),
            })
        end),
      }),
      i(0),
    })
  ),
  s( -- Except
    "except",
    fmt("except {}{}\n"..
      "\t{}", {
      c(1, { -- Errors
        t{"Exception"},
        t{"NameError"},
        t{"TypeError"},
        t{"ValueError"},
      }),
      c(2, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({':'}),
          })
        end),
        d(1, function() -- as err:
          return sn(nil, {
            i(1),
            t({" as "}),
            i(2, "err"),
            t({":"}),
            })
        end),
      }),
      i(3, "Continue")
    })
  ),
  s( -- Finally
    "finally",
    fmt("finally:\n"..
      "\t{}{}", {
      i(1, "Continue"),
      i(0)
    })
  ),
})
--}}}
