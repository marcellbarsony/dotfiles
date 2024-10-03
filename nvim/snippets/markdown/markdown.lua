-- Markdown snippets
-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

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
ls.add_snippets("markdown", {
  -- Table {{{
  s({ trig = "table(%d+)x(%d+)", regTrig = true }, {
    d(1, function(args, snip)
      local nodes = {}
      local i_counter = 0
      local hlines = ""
      for _ = 1, snip.captures[2] do
        i_counter = i_counter + 1
        table.insert(nodes, t("| "))
        table.insert(nodes, i(i_counter, "Column" .. i_counter))
        table.insert(nodes, t(" "))
        hlines = hlines .. "|---"
      end
      table.insert(nodes, t { "|", "" })
      hlines = hlines .. "|"
      table.insert(nodes, t { hlines, "" })

      for _ = 1, snip.captures[1] do
        for _ = 1, snip.captures[2] do
          i_counter = i_counter + 1
          table.insert(nodes, t("| "))
          table.insert(nodes, i(i_counter))
          print(i_counter)
          table.insert(nodes, t(" "))
        end
        table.insert(nodes, t { "|", "" })
      end
      return sn(nil, nodes)
    end),
  }),
  -- }}}

  -- vuln {{{
  s( "vuln",
    fmt("# {}\n\n" ..
      "## Resources\n\n" ..
      "[{}]({}){}\n\n" ..
      "## Description\n\n" ..
      "{}\n\n" ..
      "## Exploitation\n\n" ..
      "{}\n\n" ..
      "## Remediation\n\n" ..
      "{}\n" ..
      "\n",
      {
        i(1, "Title"),
        i(2, "CVE-XXXX-XXXX"),
        i(3, "https://www.example.com/"),
        i(4, ""),
        i(5, ""),
        i(6, ""),
        i(7, ""),
      }
    )
  ),
  -- }}}
})
-- }}}
