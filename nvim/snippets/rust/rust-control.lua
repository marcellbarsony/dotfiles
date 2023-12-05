-- Rust snippets [Control]
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
  s( -- if/else-if/else
    "if",
    fmt("if {} {{\n" ..
      "\t{}\n" ..
      "}}{}\n" ..
      "{}"
      , {
      i(1, "condition"),
      i(2, "// ..."),
      c(3, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({""}),
          })
        end),
        d(1, function() -- else
          return sn(nil, {
            i(1),
            t({" else {", "\t"}),
            i(2, "// ..."),
            t({"", "}"}),
            })
        end),
        d(1, function() -- else-if
          return sn(nil, {
            i(1),
            t({" else if "}),
            i(2, "condition"),
            t({" {", "\t"}),
            i(3, "// ..."),
            t({"", "} else {"}),
            t({"", "\t"}),
            i(4, "// ..."),
            t({"", "}"}),
            })
        end),
      }),
      i(4),
      }
    )
  ),
  s( -- if let
    "if let",
    fmt("if let {} {{\n" ..
      "\t{}\n"..
      "}}{}\n"
      , {
      c(1, {
        -- Custom
        sn(nil, {i(1),  i(2, "pattern"), t" = ", i(3, "var") }),
        -- Option
        sn(nil, {i(1), t"Some(", i(2), t") = ", i(3, "var") }),
        sn(nil, {i(1), t"None(", i(2), t") = ", i(3, "var") }),
        -- Error
        sn(nil, {i(1), t"Ok(", i(2), t") = ", i(3, "var") }),
        sn(nil, {i(1), t"Err(", i(2), t") = ", i(3, "var") }),
        -- Boolean
        sn(nil, {i(1), t"true = ", i(2, "var") }),
        sn(nil, {i(1), t"false = ", i(2, "var") }),
        -- Tuple
        sn(nil, {i(1), t"(", i(2, "foo, bar"), t") = ", i(3, "var") }),
      }),
      i(2, "// ..."),
      i(3),
      }
    )
  ),
  s( -- match
    "match",
    fmt("match {} {{\n" ..
      "\t{}" ..
      "\n}}{}\n" ..
      "{}"
      , {
      i(1, "pattern"),
      c(2, {
        d(1, function() -- action
          return sn(nil, {
            i(1),
            i(2, "Variant"),
            t({" => "}),
            i(3, "action"),
            i(4),
            })
        end),
        d(1, function() -- action case
          return sn(nil, {
            i(1),
            i(2, "Variant"),
            t({" => {", "\t\t"}),
            i(3, "// ..."),
            t({"", "\t}"}),
            i(4)
            })
        end),
        d(1, function() -- error handling
          return sn(nil, {
            i(1),
            t({"Ok("}),
            i(2, "foo"),
            t({") => "}),
            i(3, "action"),
            t({",", "\tErr("}),
            i(4, "err"),
            t({") => "}),
            i(5, "action"),
            })
        end),
        d(1, function() -- option
          return sn(nil, {
            i(1),
            t({"Some("}),
            i(2, "foo"),
            t({") => "}),
            i(3, "action"),
            t({",", "\tNone => "}),
            i(4, "action"),
            })
        end),
      }),
      i(3),
      i(4),
      }
    )
  ),
})
-- }}
