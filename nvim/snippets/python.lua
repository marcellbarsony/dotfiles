-- Python snippets
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
ls.add_snippets("python", {
  -- Class {{{
  s( "class",
    fmt("class {}({}):\n\n" ..
      '\t"""Docstring for {}"""\n\n'..
      '\tdef __init__(self, {}):\n'..
      '\t\t{}({}, self).__init__()\n' ..
      '\t\tself.arg = {}{}\n',
      {
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
  -- }}}

  -- Context {{{
  s( "with",
    fmt('with open({}, "{}") as {}:\n' ..
      '\t{} = {}.{}(){}',
      {
        i(1, "file"),
        c(2,{
          t { "r" },
          t { "w" },
          t { "rw" },
          t { "wb" },
          t { "rb" },
        }),
        i(3, "file"),
        i(4, "content"),
        same(3),
        c(5, {
          t { "read" },
          t { "write" },
        }),
        i(0),
      }
    )
  ),
  -- }}}

  -- Decorators {{{
  -- @decorator {{{
  s( "@decorator",
    fmt("def {}({}):\n" ..
      "\tdef {}({})\n" ..
      "\t\t{}\n" ..
      "{}{}\n" ..
      "\n" ..
      "\n" ..
      "@{}",
      {
        same(1),
        i(2, "func"),
        i(3, "wrapper"),
        c(4, {
          t { "" },
          t { "*args" },
          t { "*args, **kwargs" },
        }),
        i(5, "pass"),
        c(6, {
          sn(nil, { i(1), t "" }),
          sn(nil, { i(1), t "\t", t "return ", i(2, "") })
        }),
        i(0),
        i(1, "decorator"),
      }
    )
  ),
  -- }}}

  -- @timer {{{
  s( "@timer",
    fmt("def {}({}):\n" ..
      "\tdef {}({})\n" ..
      "\t\t{} = time.time()\n" ..
      "\t\t{}()\n" ..
      '\t\tprint("{}", time.time() - {}, "{}")\n' ..
      "\t\t{}\n" ..
      "{}{}\n" ..
      "\n" ..
      "\n" ..
      "@{}",
      {
        same(1),
        i(2, "func"),
        i(3, "wrapper"),
        c(4, {
          t { "" },
          t { "*args" },
          t { "*args, **kwargs" },
        }),
        i(5, "before"),
        same(2),
        i(6, "Function took"),
        same(5),
        i(7, "seconds"),
        i(8, "pass"),
        c(9, {
          sn(nil, { i(1), t "" }),
          sn(nil, { i(1), t "\t", t "return ", i(2, "") })
        }),
        i(0),
        i(1, "timer"),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Exceptions {{{
  -- try/exrept/else/finally {{{
  s( "try",
    fmt("try:\n" ..
      "\t{}\n" ..
      "except {}{}\n" ..
      "\t{}\n" ..
      "{}{}",
      {
        i(1, "pass"),
        c(2, { -- Errors
          t { "Exception" },
          t { "NameError" },
          t { "TypeError" },
          t { "ValueError" },
        }),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ ':' }),
            })
          end),
          d(1, function() -- as err:
            return sn(nil, {
              i(1),
              t({ " as " }),
              i(2, "err"),
              t({ ":" }),
            })
          end),
        }),
        i(4, "pass"),
        c(5, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
          d(1, function() -- finally
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
              t({ "", "finally:", "\t" }),
              i(3, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),
  -- }}}

  -- except {{{
  s( "except",
    fmt("except {}{}\n" ..
      "\t{}",
      {
        c(1, { -- Errors
          t { "Exception" },
          t { "NameError" },
          t { "TypeError" },
          t { "ValueError" },
        }),
        c(2, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ ':' }),
            })
          end),
          d(1, function() -- as err:
            return sn(nil, {
              i(1),
              t({ " as " }),
              i(2, "err"),
              t({ ":" }),
            })
          end),
        }),
        i(3, "pass")
      }
    )
  ),
  -- }}}

  -- finally {{{
  s( "finally",
    fmt("finally:\n" ..
      "\t{}{}",
      {
        i(1, "pass"),
        i(0)
      }
    )
  ),
  -- }}}
  -- }}}

  -- Flow control {{{
  -- elif {{{
  s( "elif",
    fmt("elif {}:\n" ..
      "\t{}{}",
      {
        i(1, "expression"),
        i(2, "pass"),
        i(0),
      }
    )
  ),
  -- }}}

  -- else {{{
  s( "else",
    fmt("else:\n" ..
      "\t{}{}",
      {
        i(1, "pass"),
        i(0),
      }
    )
  ),
  -- }}}

  -- for {{{
  s( "for",
    fmt("for {} in {}:\n" ..
      "\t{}\n" ..
      "{}{}",
      {
        i(1, "value"),
        i(2, "iterable"),
        i(3, "pass"),
        c(4, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),
  -- }}}

  -- if {{{
  s( "if", -- if-else
    fmt('if {}:\n' ..
      '\t{}\n' ..
      '{}{}', {
        i(1, "condition"),
        i(2, "pass"),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),
  -- }}}

  -- while {{{
  s( "while", -- while-else
    fmt("while {}:\n" ..
      "\t{}\n" ..
      "{}{}",
      {
        i(1, "condition"),
        i(2, "pass"),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ '' }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ "else:", "\t" }),
              i(2, "pass"),
            })
          end),
        }),
        i(0),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Function {{{
  s( "def",
    fmt("{} {}({}):\n" ..
      "\t{}{}",
      {
        c(1, {
          t { "def" },
          t { "async def" },
        }),
        i(2, "name"),
        i(3, "arg"),
        i(4, "pass"),
        i(0),
      }
    )
  ),
  -- }}}

  -- Misc {{{
  -- #! (shbang) {{{
  s( "#!",
    fmt('#!/usr/bin/env python3\n' ..
      '"""\n' ..
      "Author: {}\n" ..
      "Date  : {}\n" ..
      "Desc  : {}\n" ..
      '"""\n\n\n{}',
      {
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
      }
    )
  ),
  -- }}}

  -- if-name {{{
  s( "if-name",
    fmt('if __name__ == "__main__":\n' ..
      "\t{}{}", {
        i(1, "main()"),
        i(0),
      }
    )
  ),
  -- }}}

  -- import {{{
  s( "import",
    fmt('{}import {}{}', {
      c(1, {
        sn(nil, { i(1), t "" }),                         -- 1st opt
        sn(nil, { i(1), t "from ", i(2, "package"), t " " }) -- 2nd opt
      }),
      i(2, "module"),
      i(0),
    })
  ),
  -- }}}
  -- }}}

  -- Socket {{{
  s( "socket",
    fmt('{} = socket.socket(socket.AF_INET, socket.SOCK_STREAM)\n' ..
      "{}.connect(({}, {}))\n" ..
      "{}",
      {
        i(1, "s"),
        same(1),
        i(2, "target_ip"),
        i(3, "target_port"),
        i(0),
      }
    )
  ),
  -- }}}
})
-- }}}
