-- Python snippets
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
  s( -- try/except
    "try",
    fmt("try:\n"..
      "\t{}\n"..
      "except {} as {}:\n"..
      "\t{} {}", {
      i(1, "pass"),
      i(2, "Exception"),
      i(3, "e"),
      i(4, "raise"),
      same(3),
    })
  ),
  s( -- try/except/else
    "try-e",
    fmt("try:\n"..
      "\t{}\n"..
      "except {} as {}:\n"..
      "\t{} {}\n"..
      "else:\n"..
      "\t{}", {
      i(1, "pass"),
      i(2, "Exception"),
      i(3, "e"),
      i(4, "raise"),
      same(3),
      i(5, "pass"),
    })
  ),
  s( -- try/except/finally
    "try-f",
    fmt("try:\n"..
      "\t{}\n"..
      "except {} as {}:\n"..
      "\t{} {}\n"..
      "finally:\n"..
      "\t{}", {
      i(1, "pass"),
      i(2, "Exception"),
      i(3, "e"),
      i(4, "raise"),
      same(3),
      i(5, "pass"),
    })
  ),
  s( -- try/except/else/finally
    "try-ef",
    fmt("try:\n"..
      "\t{}\n"..
      "except {} as {}:\n"..
      "\t{} {}\n"..
      "else:\n"..
      "\t{}\n"..
      "finally:\n"..
      "\t{}", {
      i(1, "pass"),
      i(2, "Exception"),
      i(3, "e"),
      i(4, "raise"),
      same(3),
      i(5, "pass"),
      i(6, "pass"),
    })
  ),
})
--}}}
