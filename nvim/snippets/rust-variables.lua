-- Rust snippets [variables]
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
  s( -- const
    "const",
    fmt("const {}: {} = {};\n" ..
      "{}"
      , {
      i(1, "CONSTANT"),
      i(2, "T"),
      i(3, "value"),
      i(4),
      }
    )
  ),
  s( -- let
    "let",
    fmt("let {}\n" ..
      "{}"
      , {
      c(1, {
        -- Array
        sn(nil, {
          i(1),
          i(2, "arr"),
          t": [",
          i(3, "T"),
          t"; ",
          i(4, "N"),
          t"] = [",
          c(5, {
            -- Individual elements
            sn(nil, {i(1), t"x, y, z"}),
            -- Repeat expression
            sn(nil, {i(1), i(2, "expr"), t"; ", i(3, "N")}),
          }),
          t"];"
        }),
        -- Bool
        sn(nil, {
          i(1),
          i(2, "bool"),
          t": bool = ",
          c(3, {
            sn(nil, {i(1), t"true"}),
            sn(nil, {i(1), t"false"}),
          }),
          t";",
        }),
        -- HashMap
        sn(nil, {
          i(1),
          t"mut ",
          i(2, "hash"),
          t": HashMap<",
          i(3, "key"),
          t", ",
          i(4, "value"),
          t"> = HashMap::new();",
        }),
        -- Integer
        sn(nil, {
          i(1),
          i(2, "int"),
          t": ",
          i(3, "T"),
          t" = ",
          i(4, "num"),
          t";"
        }),
        -- Option
        sn(nil, {
          i(1),
          i(2, "opt"),
          t": Option<",
          i(3, "T"),
          t"> = ",
          c(4, {
            -- None
            sn(nil, {i(1), t"None"}),
            -- Some
            sn(nil, {i(1), t"Some(", i(2, "value"), t")"}),
          }),
          t";",
        }),
        -- Strings
        sn(nil, {
          i(1),
          i(2, "str"),
          t": ",
          c(3, {
            -- String slice (&str)
            sn(nil, {i(1), t"&str", t' = "', i(2), t'";'}),
            -- String literal (empty)
            sn(nil, {i(1), t"String", t" = String::new();"}),
            -- String literal (content)
            sn(nil, {i(1), t"String", t' = String::from("', i(2), t'");'}),
            -- String format
            sn(nil, {i(1), t"String", t' = format!("', i(2, 'Hello {}", "world!'), t'");'}),
            -- Character
            sn(nil, {i(1), t"char", t' = "', i(2, ""), t'";'}),
          }),
        }),
        -- Tuple
        sn(nil, {
          i(1),
          i(2, "tup"),
          t": (",
          i(3, "T"),
          t") = (",
          i(4, "elements"),
          t");",
        }),
        -- Vector
        sn(nil, {
          i(1),
          i(2, "vec"),
          t": Vec<",
          i(3, "T"),
          t"> = ",
          c(4, {
            -- Vector (empty)
            sn(nil, {i(1), t"Vec::new();"}),
            -- Vector (content)
            sn(nil, {i(1), t"vec![", i(2, "items"), t"];"}),
          }),
        }),
      }),
      i(2),
      }
    )
  ),
  s( -- static
    "static",
    fmt("static {}: {} = {};\n" ..
      "{}"
      , {
      i(1, "STATIC"),
      i(2, "T"),
      i(3, "value"),
      i(4),
      }
    )
  ),
})
-- }}}
