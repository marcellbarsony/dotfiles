-- Rust snippets [Functions]
-- Docs: https://doc.rust-lang.org/reference/items/functions.html
-- Book: https://doc.rust-lang.org/book/ch03-03-how-functions-work.html

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
  s( -- function
    "fn",
    fmt("{}fn {}{}({}){}{{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}"
      , {
      c(1, {
        -- no qualifier
        sn(nil, {i(1)}),
        -- async
        sn(nil, {i(1), t"async "}),
        -- const
        sn(nil, {i(1), t"const "}),
        -- unsafe
        sn(nil, {i(1), t"unsafe "}),
        -- public
        sn(nil, {i(1), t"pub "}),
      }),
      i(2, "function"),
      c(3, {
        sn(nil, {i(1)}),
        -- generic
        sn(nil, {i(1), t"<", i(2, "T"), t">"}),
        -- generic + trait
        sn(nil, {i(1), t"<", i(2, "T"), t": ", i(3, "Trait"), t">"}),
        -- lifetime
        sn(nil, {i(1), t"<'", i(2, "lifetime"), t">"}),
      }),
      c(4, {
        -- no parameter
        sn(nil, {i(1), t""}),
        -- parameter
        sn(nil, {i(1), i(2, "foo"), t": ", i(3, "Type")}),
        -- self
        sn(nil, {i(1), t"&self"}),
        -- self + parameter
        sn(nil, {i(1), t"&self, ", i(2, "foo"), t": ", i(3, "Type")}),
        -- self + mut
        sn(nil, {i(1), t"&mut self", i(2, "")}),
        -- self + mut + parameter
        sn(nil, {i(1), t"&mut self, ", i(2, "foo"), t": ", i(3, "Type")}),
      }),
      c(5, {
        -- no return
        sn(nil, {i(1), t" "}),
        -- return
        sn(nil, {i(1), t" -> ", i(2, "Type"), t" "}),
        -- where
        d(1, function()
          return sn(nil, {
            i(1),
            t({" -> "}),
            i(2, "Type"),
            t({"", "\twhere "}),
            i(3, "T"),
            t({": "}),
            i(4, "Trait"),
            t({"", ""}),
          })
        end),
        -- result
        sn(nil, {i(1), t" -> Result<", i(2, "Type"), t", ", i(3, "io::Error"), t">"}),
      }),
      i(6, "// ..."),
      i(7),
      }
    )
  ),
})
-- }}}
