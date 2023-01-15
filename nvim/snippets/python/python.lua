-- Python snippets
-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

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
  s({ -- class
    trig="class",
    name="Class",
    dscr="Class definition",
    }, {
    t({"class "}),
    i(1, "ClassName"),
    t({"("}),
    i(2, "object"),
    t({"):", "", '\t""""Docstrings for '}),
    same(1),
    t({'"""', "", ""}),
    t { "\tdef __init__(self, " },
    i(3, "arg"),
    t({"):", ""}),
    t{ "\t\tsuper(" },
    same(1 ),
    t{ ", self).__init__()", "\t\tself.arg = " },
    same(3),
    t{"", "\t"},
    i(0)
  }),
  s({ -- elif
    trig="elif",
    name="Elif",
    dscr="Conditional statement",
    }, {
    t({"elif "}),
    i(1, "expression"),
    t({":", "\t"}),
    i(2, "pass")
  }),
  s({ -- else
    trig="else",
    name="Else",
    dscr="Conditional statement",
    }, {
    t({"else: ", "\t"}),
    i(1, "pass"),
  }),
  s({ -- for
    trig="for",
    name="For",
    dscr="For loop"
    }, {
    t({"for "}),
    i(1, "value"),
    t({" in "}),
    i(2, "iterable"),
    t({":", "\t"}),
    i(3, "pass")
  }),
  s({ -- for/else
    trig="for/else",
    name="For/Else",
    dscr="For/else loop"
    }, {
    t({"for "}),
    i(1, "value"),
    t({" in "}),
    i(2, "iterable"),
    t({":", "\t"}),
    i(3, "pass"),
    t({"", "else: ", "\t"}),
    i(4, "pass"),
  }),
  s({ -- function
    trig="def",
    name="Function",
    dscr="Function definition",
    }, {
    t{"def "},
    i(1, "name"),
    t{"("},
    i(2, "arg"),
    t{"):", ""},
    t{"\t"},
    i(3, "pass"),
  }),
  s({ -- function (async)
    trig="def-a",
    name="Function (Async)",
    dscr="Asynchronous Function definition",
    }, {
    t{"async def "},
    i(1, "name"),
    t{"("},
    i(2, "arg"),
    t{"):", ""},
    t{"\t"},
    i(3, "pass"),
  }),
  s({ -- if
    trig="if",
    name="If statement",
    dscr="Conditional statement",
    }, {
    t({"if "}),
    i(1, "condition"),
    t({":", "\t"}),
    i(2, "pass")
  }),
  s({ -- if/else
    trig="if/else",
    name="If/else statement",
    dscr="Conditional statement",
    }, {
    t{"if "},
    i(1, "condition"),
    t{":", "\t"},
    i(2, "pass"),
    t{"", "else:"},
    t{"", "\t"},
    i(3, "pass")
  }),
  s({ -- if name == main
    trig="if-name",
    name="If statement",
    dscr="Conditional statement",
    }, {
    t{'if __name__ = "__main__":', '\t'},
    i(1, "main()"),
  }),
  s({ -- import
    trig="import",
    name="Import module",
    dscr="Import module",
    }, {
    t({"import "}),
    i(1),
  }),
  s({ -- import from
    trig="from",
    name="Import from module",
    dscr="Import from module",
    }, {
    t({"from "}),
    i(1, "module"),
    t({" import "}),
    i(2, "submodule"),
  }),
  s({ -- shebang
    trig="#!",
    name="Shebang",
    dscr="Shebang line",
    }, {
    t{"#!/usr/bin/env python3"},
    t{ "", "" },
    t{ '"""' },
    t{ "", "" },
    t{"Author : "},
    i(1, "Author"),
    t{ "", "" },
    t({"Date   : "}),
		f(function()
      return os.date("%D")
    end),
    t{ "", "" },
    t{ '"""' },
  }),
  s({ -- with
    trig="with",
    name="With",
    dscr="With statement"
    }, {
    t{"with "},
    i(1, "expression"),
    t{' as '},
    i(2, "target"),
    t{':', "\t"},
    i(3, "pass"),
  }),
  s({ -- with
    trig="with-open",
    name="Open file",
    dscr="Context manager"
    }, {
    t{"with open("},
    i(1, "file"),
    t{', "'},
    i(2, "mode"),
    t{'") as '},
    i(3, "variable"),
    t{"", "\tcontent = "},
    same(3),
    t{".read()"},
  }),
  s({ -- while
    trig="while",
    name="While",
    dscr="While loop"
    }, {
    t{"while "},
    i(1, "condition"),
    t{":", "\t"},
    i(2, "pass"),
  }),
  s({ -- while/else
    trig="while/else",
    name="While/Else",
    dscr="While/else loop"
    }, {
    t{"while "},
    i(1, "expression"),
    t{":", "\t"},
    i(2, "pass"),
    t{"", "else: ", "\t"},
    i(3, "pass"),
  }),
})
--}}}
