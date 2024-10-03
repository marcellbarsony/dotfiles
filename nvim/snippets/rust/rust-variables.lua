-- Rust snippets [Variables]
-- Docs: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

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
ls.add_snippets("rust", {
  -- const {{{
  s( "const",
    fmt("const {}: {} = {};\n" ..
      "{}",
      {
        i(1, "CONSTANT"),
        i(2, "T"),
        i(3, "value"),
        i(4),
      }
    )
  ),
  -- }}}

  -- let {{{
  s( "let",
    fmt("let {}\n" ..
      "{}",
      {
        c(1, {
          -- Array
          sn(nil, {
            i(1),
            i(2, "arr"),
            c(3, {
              -- Implicit
              sn(nil, {i(1), t" "}),
              -- Explicit
              sn(nil, {i(1), t": [", i(2, "T"), t"; ", i(3, "N"), t"] "}),
            }),
            t"= [",
            c(4, {
              -- Individual elements
              sn(nil, {i(1), i(2, "foo, bar, baz")}),
              -- Repeat expression
              sn(nil, {i(1), i(2, "repeat"), t"; ", i(3, "N")}),
              -- 2D array
              sn(nil, {t"[", i(1), i(2, "foo, bar, baz"), t"], [", i(3, "foo, bar, baz"), t"]", i(4)}),
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
            c(3, {
              -- Type
              sn(nil, {i(1), t": HashMap<", i(2, "T"), t", ", i(3, "T"), t"> "}),
              -- Custom typ
              sn(nil, {i(1), t" "}),
            }),
            t"= HashMap::",
            c(4, {
              -- New
              sn(nil, {i(1), t"new()"}),
              -- With capacity
              sn(nil, {i(1), t"with_capacity(", i(2), t")"}),
            }),
            t";"
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
          -- PathBuf
          sn(nil, {
            i(1),
            i(2, "path"),
            t": PathBuf = ",
            c(3, {
              -- New
              sn(nil, {i(1), t"PathBuf::new()"}),
              -- From
              sn(nil, {i(1), t'PathBuf::from("', i(2, "/foo/bar.baz"), t'")'}),
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
              -- String reference
              sn(nil, {i(1), t"&String", t' = ', i(2), t';'}),
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
            i(4, "foo, bar, baz"),
            t");",
          }),
          -- Vector
          sn(nil, {
            i(1),
            i(2, "vec"),
            c(3, {
              -- type
              sn(nil, {i(1), t": Vec<", i(2, "T"), t">"}),
              -- no type
              sn(nil, {i(1)}),
            }),
            t" = ",
            c(4, {
              -- empty
              sn(nil, {i(1), t"Vec::new();"}),
              -- content
              sn(nil, {i(1), t"vec![", i(2, "foo, bar, baz"), t"];"}),
              -- arguments
              sn(nil, {i(1), t"env::args().collect();"}),
              -- custom
              sn(nil, {i(1), i(2), t";"}),
            }),
          }),
        }),
        i(2),
      }
    )
  ),
  -- }}}

  -- static {{{
  s( "static",
    fmt("static {}: {} = {};\n" ..
      "{}",
      {
        i(1, "STATIC"),
        i(2, "Type"),
        i(3, "value"),
        i(4),
      }
    )
  ),
  -- }}}
})
-- }}}
