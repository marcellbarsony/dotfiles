-- Rust snippets
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
  s( -- enum
    "enum",
    fmt("enum {}\n" ..
      "}}\n"
      , {
      c(1, {
        d(1, function() -- Generic
          return sn(nil, {
            i(1),
            i(2, "Type"),
            t({" {", "\t"}),
            c(3, {
              -- Unit-like
              sn(nil, {i(1), i(2, "Variant"), t",", i(3)}),
              -- Data
              sn(nil, {i(1), i(2, "Variant"), t"(", i(3, "Type"), t"),", i(4)}),
              -- Struct-like
              sn(nil, {i(1), i(2, "Struct"), t" { ", i(3, "Type"), t" },", i(4)}),
            }),
          })
        end),
        d(1, function() -- Option
          return sn(nil, {
            i(1),
            t({"Option<T> {", "\tSome(T),", "\tNone,"}),
          })
        end),
        d(1, function() -- Result
          return sn(nil, {
            i(1),
            t({"Result<T, E> {", "\tOk(T),", "\tErr(E),"}),
          })
        end),
      }),
      }
    )
  ),
  s( -- impl
    "impl",
    fmt("impl {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}"
      , {
      c(1, {
        -- No Trait
        sn(nil, {i(1), i(2, "Type")}),
        -- Trait
        sn(nil, {i(1), i(2, "Trait"), t" for ", i(3, "Type")}),
      }),
      i(2, "// ..."),
      i(3),
      }
    )
  ),
  s( -- struct
    "struct",
    fmt("struct {} {{\n" ..
      "\t{}{}\n" ..
      "}}\n" ..
      "{}"
      , {
      c(1, {
        -- Type
        sn(nil, {i(1), i(2, "Type")}),
        -- Generic
        sn(nil, {i(1), i(2, "Type"), t"<", i(3, "T"), t">"}),
        -- Generic where
        sn(nil, {i(1), i(2, "Type"), t"<", i(3, "T"), t"> where ", i(4, "T: Trait") }),
      }),
      c(2, {
        -- Key & Type
        sn(nil, {i(1), i(2, "key"), t": ", i(3, "Type"), t","}),
        -- Key
        sn(nil, {i(1), i(2, "key"), t","}),
      }),
      i(3),
      i(4),
      }
    )
  ),
  s( -- trait
    "trait",
    fmt("{}trait {}{} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}"
      , {
      c(1, {
        -- Private
        sn(nil, {i(1), t""}),
        -- Public
        sn(nil, {i(1), t"pub "}),
      }),
      i(2, "Type"),
      c(3, {
        -- no generic type
        sn(nil, {i(1)}),
        -- generic type
        sn(nil, {i(1), t"<", i(2, "T, U, V"), t">"}),
      }),
      i(4, "// ..."),
      i(5),
      }
    )
  ),
})
-- }}}
