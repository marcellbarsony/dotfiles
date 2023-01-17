-- Python snippets
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
ls.add_snippets("python", {
  s( -- class
    "class",
    fmt("class {}({}):\n\n" ..
      '\t"""Docstring for {}"""\n\n'..
      '\tdef __init__(self, {}):\n'..
      '\t\t{}({}, self).__init__()\n' ..
      '\t\tself.arg = {}{}'
      , {
      i(1, "ClassName"),
      i(2, "object"),
      same(1),
      i(3, "arg"),
      i(4, "super"),
      same(1),
      same(3),
      i(0),
      }
    )
  ),
  s( -- elif
    "elif",
    fmt("elif {}:\n"..
      "\t {}{}", {
      i(1, "expression"),
      i(2, "pass"),
      i(0),
    })
  ),
  s( -- else
    "else",
    fmt("else:\n"..
      "\t {}{}", {
      i(1, "pass"),
      i(0),
    })
  ),
  s( -- for
    "for",
    fmt("for {} in {}:\n"..
      "\t{}\n"..
      "{}{}", {
      i(1, "value"),
      i(2, "iterable"),
      i(3, "pass"),
      c(4, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({''}),
          })
        end),
        d(1, function() -- else
          return sn(nil, {
            i(1),
            t({"else:", "\t"}),
            i(2, "pass"),
            })
        end),
      }),
      i(0),
    })
  ),
  s( --function (+async)
    "def",
    fmt("{} {}({}):\n"..
      "\t{}{}", {
    c(1, {
      t{"def"},
      t{"async def"},
      }),
      i(2, "name"),
      i(3, "arg"),
      i(4, "pass"),
      i(0),
    })
  ),
  s( -- if-name 
    "if-name",
    fmt('if __name__ = "__main__":\n'..
      "\t{}{}", {
      i(1, "main()"),
      i(0),
    })
  ),
  s( -- import
    "import",
    fmt('{}import {}{}', {
      c(1, {
        sn(nil, {i(1), t""}), -- 1st opt
        sn(nil, {i(1), t"from ", i(2, "package"), t" "}) -- 2nd opt
      }),
      i(2, "module"),
      i(0),
    })
  ),
  s( -- if/else
    "if",
    fmt('if {}:\n'..
      '\t{}\n'..
      '{}{}', {
      i(1, "condition"),
      i(2, "pass"),
      c(3, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({''}),
          })
        end),
        d(1, function() -- else
          return sn(nil, {
            i(1),
            t({"else:", "\t"}),
            i(2, "pass"),
            })
        end),
      }),
      i(0),
    })
  ),
  s( -- shebang
    "#!",
    fmt('#!/usr/bin/env python3\n'..
      '"""\n'..
      "Author: {}\n"..
      "Date  : {}\n"..
      "Desc  : {}\n"..
      '"""\n\n\n{}', {
      i(1, "Name"),
      c(2, {
        f(function()
          return os.date("%D")
        end),
        f(function()
          return os.date("%d-%m-%Y")
        end),
        f(function()
          return os.date("%d %B %Y")
        end),
        f(function()
          return os.date("%Y %B %d")
        end),
      }),
      i(3, "Description"),
      i(0),
    })
  ),
  s( -- with
    "with",
    fmt("with {} as {}:\n" ..
      "\t{}{}", {
      i(1, "expression"),
      i(2, "target"),
      i(3, "pass"),
      i(0),
      }
    )
  ),
  s( -- with-context
    "with-context",
    fmt('with open({}, "{}") as {}:\n' ..
      '\t{} = {}.{}(){}', {
      i(1, "file"),
      c(2, {
        t{"wr"},
        t{"w"},
        t{"wb"},
        t{"r"},
        }),
      i(3, "var"),
      i(4, "content"),
      same(3),
      c(5, {
        t{"read"},
        t{"write"},
      }),
      i(0),
    })
  ),
  s( -- while/else
    "while",
    fmt("while {}:\n" ..
      "\t{}\n"..
      "{}{}", {
      i(1, "condition"),
      i(2, "pass"),
      c(3, {
        d(1, function() -- nothing
          return sn(nil, {
            i(1),
            t({''}),
          })
        end),
        d(1, function() -- else
          return sn(nil, {
            i(1),
            t({"else:", "\t"}),
            i(2, "pass"),
            })
        end),
      }),
      i(0),
    })
  ),
})
--}}}
