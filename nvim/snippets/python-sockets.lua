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
  s({ -- Socket creation
    trig="socket",
    name="Socket",
    dscr="Socket initialization",
    }, {
    i(1, "s"),
    t{" = socket.socket(socket.AF_INET, socket.SOCK_STREAM)", ""},
  }),
  s({ -- Connect
    trig="socket-connect",
    name="Socket",
    dscr="Socket initialization",
    }, {
    i(1, "s"),
    t{".connect(("},
    i(2, "host_ip"),
    t{", "},
    i(3, "port"),
    t{"))", ""},
    i(0),
  }),
})
--}}}
