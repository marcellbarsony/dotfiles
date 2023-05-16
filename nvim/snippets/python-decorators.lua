-- Python snippets [Decorators]
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
  s( -- decorator
    "@decorator",
    fmt("def {}({}):\n"..
      "\tdef {}({})\n"..
      "\t\t{}\n"..
      "{}{}\n"..
      "\n"..
      "\n"..
      "@{}", {
      same(1),
      i(2, "func"),
      i(3, "wrapper"),
      c(4, {
        t{""},
        t{"*args"},
        t{"*args, **kwargs"},
        }),
      i(5, "pass"),
      c(6, {
        sn(nil, {i(1), t""}),
        sn(nil, {i(1), t"\t", t"return ", i(2, "")})
        }),
      i(0),
      i(1, "decorator"),
    })
  ),
  s( -- timer
    "@timer",
    fmt("def {}({}):\n"..
      "\tdef {}({})\n"..
      "\t\t{} = time.time()\n"..
      "\t\t{}()\n"..
      '\t\tprint("{}", time.time() - {}, "{}")\n'..
      "\t\t{}\n"..
      "{}{}\n"..
      "\n"..
      "\n"..
      "@{}", {
      same(1),
      i(2, "func"),
      i(3, "wrapper"),
      c(4, {
        t{""},
        t{"*args"},
        t{"*args, **kwargs"},
        }),
      i(5, "before"),
      same(2),
      i(6, "Function took"),
      same(5),
      i(7, "seconds"),
      i(8, "pass"),
      c(9, {
        sn(nil, {i(1), t""}),
        sn(nil, {i(1), t"\t", t"return ", i(2, "")})
        }),
      i(0),
      i(1, "timer"),
    })
  ),

})
--}}}
