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

  -- Header {{{
  s( "header",
    fmt(
      "<!-- {} {{{{{{-->\n" ..
      "{} {}\n" ..
      "\n" ..
      "{}\n" ..
      "\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, "Header"),
        c(2, {
          t { "#" },
          t { "##" },
          t { "###" },
          t { "####" },
          t { "#####" }
        }),
        same(1),
        i(3),
        i(4)
      }
    )
  ),
  -- }}}

  -- Checklist {{{
  s( "checklist",
    fmt(
      "- [{}] {}",
      {
        c(1, {
          t { " " },
          t { "x" },
        }),
        i(2),
      }
    )
  ),
  -- }}}

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

  -- Vulnerability {{{
  s( "vuln",
    fmt("# {}\n\n" ..
      "<!-- Resources {{{{{{ -->\n" ..
      "## Resources\n\n" ..
      "- [{}]({}){}\n\n" ..
      "<!-- }}}}}} -->\n\n" ..
      "<!-- Description {{{{{{ -->\n" ..
      "## Description\n\n" ..
      "{}\n\n" ..
      "<!-- }}}}}} -->\n\n" ..
      "<!-- Impact {{{{{{ -->\n" ..
      "## Impact\n\n" ..
      "{}\n\n" ..
      "<!-- }}}}}} -->\n\n" ..
      "<!-- Exploitation {{{{{{ -->\n" ..
      "## Exploitation\n\n" ..
      "{}\n\n" ..
      "<!-- }}}}}} -->\n\n" ..
      "<!-- Remediation {{{{{{ -->\n" ..
      "## Remediation\n\n" ..
      "{}\n\n" ..
      "<!-- }}}}}} -->" ..
      "\n",
      {
        i(1, "Title"),
        i(2, "CVE-XXXX-XXXX"),
        i(3, "https://www.example.com/"),
        i(4, ""),
        i(5, ""),
        i(6, ""),
        i(7, ""),
        i(8, ""),
      }
    )
  ),
  -- }}}

  -- Example {{{
  s( "example",
    fmt(
      "<!-- Example {{{{{{-->\n" ..
      "> [!example]-\n" ..
      ">{}\n" ..
      "> ```sh\n" ..
      ">{}\n" ..
      "> ```\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, ""),
        i(3, "")
      }
    )
  ),
  -- }}}

  -- Info {{{
  s( "info",
    fmt(
      "<!-- Info {{{{{{-->\n" ..
      "> [!info]-{}\n" ..
      ">\n" ..
      ">{}\n" ..
      ">\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, ""),
        i(3, "")
      }
    )
  ),
  -- }}}

  -- Note {{{
  s( "note",
    fmt(
      "<!-- Note {{{{{{-->\n" ..
      "> [!note]-{}\n" ..
      ">\n" ..
      ">{}\n" ..
      ">\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, ""),
        i(3, "")
      }
    )
  ),
  -- }}}

  -- Tip {{{
  s( "tip",
    fmt(
      "<!-- Tip {{{{{{-->\n" ..
      "> [!tip]-\n" ..
      ">\n" ..
      ">{}\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, "")
      }
    )
  ),
  -- }}}

  -- Warning {{{
  s( "warning",
    fmt(
      "<!-- Warning {{{{{{-->\n" ..
      "> [!warning]\n" ..
      ">\n" ..
      ">{}\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, "")
      }
    )
  ),
  -- }}}

  -- Danger {{{
  s( "danger",
    fmt(
      "<!-- Danger {{{{{{-->\n" ..
      "> [!danger]-\n" ..
      ">\n" ..
      ">{}\n" ..
      "<!-- }}}}}} -->\n" ..
      "{}",
      {
        i(1, ""),
        i(2, "")
      }
    )
  ),
  -- }}}
})
-- }}}
