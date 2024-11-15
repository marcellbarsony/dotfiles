-- C snippets
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
ls.add_snippets("c", {
  -- Functions {{{
  -- function {{{
  s("fn",
    fmt("{}{} {}({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        c(1, {
          t(""),
          t("static "),
          t("inline "),
          t("extern "),
        }),
        c(2, {
          t("void"),
          t("int"),
          t("int*"),
          t("char*"),
          t("double"),
          t("float"),
          t("size_t"),
          sn(nil, {i(1), i(2, "custom_type") }),
        }),
        i(3, "name"),
        c(4, {
          sn(nil, {i(1), i(2, "args") }),
          sn(nil, {i(1), i(2, "") }),
        }),
        i(5, "// code"),
        i(6),
      }
    )
  ),
  -- }}}

  -- function (main) {{{
  s("main",
    fmt("int main({}) {{\n" ..
      "\t{}\n" ..
      "\treturn 0;\n" ..
      "}}{}",
      {
        c(1, {
          sn(nil, {i(1), i(2, "void")}),
          sn(nil, {i(1), i(2, "int argc, char *argv[]")}),
        }),
        i(2, "// code"),
        i(3),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Loops {{{
  -- for {{{
  s("for",
    fmt("for ({}; {}; {}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "/* init */"),
        i(2, "/* cond */"),
        i(3, "/* step */"),
        i(4, "// code"),
        i(5)
      }
    )
  ),
  -- }}}

  -- while {{{
  s("while",
    fmt("while ({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "true"),
        i(2, "// code"),
        i(3)
      }
    )
  ),
  -- }}}

  -- do-while {{{
  s("do-while",
    fmt("do {{\n" ..
      "\t{}\n" ..
      "}} while ({});\n" ..
      "{}",
      {
        i(1, "// code"),
        i(2, "condition"),
        i(3)
      }
    )
  ),
  -- }}}

  -- switch {{{
  s("switch",
    fmt("switch ({}) {{\n" ..
      "\tcase {}:\n" ..
      "\t\t{}\n" ..
      "\t\t{}{}\n" ..
      "\tdefault:\n" ..
      "\t\t{}\n" ..
      "\t\tbreak;\n" ..
      "}}{}",
      {
        i(1, "/* cond */"),
        i(2, "1"),
        i(3, "// code"),
        i(4, "break;"),
        i(5, ""),
        i(6, "// code"),
        i(7)
      }
    )
  ),
  -- }}}
  -- }}}

  -- Misc {{{
  -- include {{{
  s("#include",
    fmt("#include <{}>\n" ..
      "{}",
      {
        i(1),
        i(2),
      }
    )
  ),
  -- }}}

  -- printf {{{
  s("printf",
    fmt('printf("{}", {});\n' ..
      "{}",
      {
        i(1, ""),
        i(2, ""),
        i(3),
      }
    )
  ),
  -- }}}

  -- todo {{{
  s("todo",
    fmt("/* TODO:\n" ..
      " * {}\n" ..
      " */" ..
      "{}",
      {
        i(1, ""),
        i(2),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Statements {{{
  -- if {{{
  s("if",
    fmt("if ({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "/* condition */"),
        i(2, "// code"),
        i(3)
      }
    )
  ),
  -- }}}

  -- else if {{{
  s("else if",
    fmt("else if ({}) {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "condition"),
        i(2, "// code"),
        i(3)
      }
    )
  ),
  -- }}}

  -- else {{{
  s("else",
    fmt("else {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "// code"),
        i(2)
      }
    )
  ),
  -- }}}
  -- }}}

  -- Structs {{{
  -- struct {{{
  s("struct",
    fmt("struct {} {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        i(1, "name"),
        i(2, "// code"),
        i(3)
      }
    )
  ),
  -- }}}
  -- }}}
})
-- }}}
