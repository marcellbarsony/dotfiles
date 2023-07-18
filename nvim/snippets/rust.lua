-- Rust snippets
-- Docs: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

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
ls.add_snippets("rust", {
  s( -- enum
    "enum",
    fmt("enum {} {{\n" ..
      "\t{}{}\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "EnumName"),
      c(2, {
        sn(nil, {i(1), i(2, "Variant"), t"(", i(3, "type"), t"),"}),
        sn(nil, {i(1), i(2, "Variant"), t","}),
      }),
      i(3),
      i(4),
      }
    )
  ),
  s( -- if/else-if/else
    "if",
    fmt("if {} {{\n" ..
      "\t{}\n"..
      "}}{}\n"..
      "{}"
      , {
      i(1, "condition"),
      i(2, "// if"),
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
            i(2, "// else"),
            t({"", "}"}),
            })
        end),
        d(1, function() -- else-if
          return sn(nil, {
            i(1),
            t({" else if {", "\t"}),
            i(2, "// else if"),
            t({"", "} else {"}),
            t({"", "\t"}),
            i(3, "// else"),
            t({"", "}"}),
            })
        end),
      }),
      i(4),
      }
    )
  ),
  s( -- function
    "fn",
    fmt("fn {}({}){} {{\n" ..
      "\t{}\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "fn_name"),
      i(2, "parameter"),
      c(3, {
        sn(nil, {i(1), t" -> ", i(2, "return")}),
        sn(nil, {i(1), t""}),
      }),
      i(4, "// function body"),
      i(5),
      }
    )
  ),
  s( -- loop
    "loop",
    fmt("'{}: loop {{\n" ..
      "\t{}\n"..
      "\tbreak '{};\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "label"),
      i(2, "// loop body"),
      same(1),
      i(5),
      }
    )
  ),
  s( -- match
    "match",
    fmt("match {} {{\n" ..
      "\t{} => {}{}\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "expression"),
      i(2, "pattern"),
      c(3, {
        d(1, function() -- action
          return sn(nil, {
            i(1),
            i(2, "action"),
            t({","}),
            })
        end),
        d(1, function() -- action
          return sn(nil, {
            i(1),
            t({"{", "\t\t"}),
            i(2, "// case body"),
            t({"", "\t}"}),
            })
        end),
        --d(1, function() -- body
        --  return sn(nil, {
        --    i(1),
        --    t({"{", "\t"}),
        --    i(2, "// body"),
        --    t({"", "}"}),
        --    })
        --end),
      }),
      i(4),
      i(5),
      }
    )
  ),
  s( -- struct
    "struct",
    fmt("struct {} {{\n" ..
      "\t{}{}\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "StructName"),
      c(2, {
        sn(nil, {i(1), i(2, "key"), t": ", i(3, "type"), t","}),
        sn(nil, {i(1), i(2, "key"), t","}),
      }),
      i(3),
      i(4),
      }
    )
  ),
  s( -- while
    "while",
    fmt("while {} {{\n" ..
      "\t{}\n"..
      "}}\n"..
      "{}"
      , {
      i(1, "condition"),
      i(2, "// while loop body"),
      i(3),
      }
    )
  ),
})
--}}}
