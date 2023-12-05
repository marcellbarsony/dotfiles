-- Rust snippets [Modules]
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
  s( -- import
    "crate",
    fmt("{};\n{}"
      , {
      c(1, {
        -- Absolute path
        sn(nil, {i(1), t"crate::", i(2, "module::function()")}),
        -- Relative path
        sn(nil, {i(1), i(2, "module::function()")}),
        -- Parent module
        sn(nil, {i(1), t"super::", i(2, "module::function()")}),
      }),
      i(2),
      }
    )
  ),
  s( -- module
    "mod",
    fmt("{}\n{}", {
      c(1, {
        d(1, function() -- mod (private)
          return sn(nil, {
            i(1),
            t({"mod "}),
            i(2, "mod_name"),
            t({" {", "\t"}),
            i(3, "// ..."),
            t({"", "}"}),
          })
        end),
        d(1, function() -- mod (public)
          return sn(nil, {
            i(1),
            t({"pub mod "}),
            i(2, "mod_name"),
            t({" {", "\t"}),
            i(3, "// ..."),
            t({"", "}"}),
            })
        end),
        d(1, function() -- mod (file)
          return sn(nil, {
            i(1),
            t({"mod "}),
            i(2, "file_name"),
            t({";"}),
            })
        end),
      }),
      i(2),
      }
    )
  ),
  s( -- use
    "use",
    fmt("use {};\n{}", {
      c(1, {
        -- Module
        sn(nil, {i(1), i(2, "module::module")}),
        -- Alias
        sn(nil, {i(1), i(2, "module::module"), t" as ", i(3, "name")}),
        -- Glob operator
        sn(nil, {i(1), i(2, "module::module"), t"::*"}),
        -- Nested path
        sn(nil, {i(1), i(2, "module::module"), t"::{", i(3, "foo, bar, baz"), t"}"}),
        -- Nested path (with self reference)
        sn(nil, {i(1), i(2, "module::module"), t"::{self, ", i(3, "foo, bar, baz"), t"}"}),
        -- Crate [Absolute path]
        sn(nil, {i(1), t"crate::", i(2, "module")}),
        -- Self [Relative path]
        sn(nil, {i(1), t"self::", i(2, "module")}),
        -- Super [TODO]
        sn(nil, {i(1), t"super::", i(2, "module")}),
      }),
      i(2),
      }
    )
  ),
})
-- }}}
