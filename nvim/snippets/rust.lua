-- Rust snippets
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
ls.add_snippets("rust", {
  -- Attributes {{{
  s( "#[attr]",
    fmt("#[{}{}", {
      c(1, {
        d(1, function() -- derive-debug
          return sn(nil, {
            i(1),
            t({ "derive(Debug)]" }),
          })
        end),
        d(1, function() -- test
          return sn(nil, {
            i(1),
            t({ "test]" }),
          })
        end),
        d(1, function() -- ignore test
          return sn(nil, {
            i(1),
            t({ "test]", '#[ignore = "' }),
            i(2, "reason"),
            t({ '"]' }),
          })
        end),
      }),
      i(2),
    })
  ),
  -- }}}

  -- Flow control {{{
  -- if {{{
  s({
    trig = "if",
    desc = "If statement"
    },
    fmt("if {} {{\n" ..
      "\t{}\n" ..
      "}}{}\n" ..
    "{}",
      {
        i(1, "condition"),
        i(2, "// ..."),
        c(3, {
          d(1, function() -- nothing
            return sn(nil, {
              i(1),
              t({ "" }),
            })
          end),
          d(1, function() -- else
            return sn(nil, {
              i(1),
              t({ " else {", "\t" }),
              i(2, "// ..."),
              t({ "", "}" }),
            })
          end),
          d(1, function() -- else-if
            return sn(nil, {
              i(1),
              t({ " else if " }),
              i(2, "condition"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "} else {" }),
              t({ "", "\t" }),
              i(4, "// ..."),
              t({ "", "}" }),
            })
          end),
        }),
        i(4),
      }
    )
  ),
  -- }}}

  -- if let {{{
  s( "if let",
    fmt("if let {} {{\n" ..
      "\t{}\n" ..
      "}}{}\n",
      {
        c(1, {
          -- Custom
          sn(nil, { i(1), i(2, "pattern"), t " = ", i(3, "var") }),
          -- Option
          sn(nil, { i(1), t "Some(", i(2), t ") = ", i(3, "var") }),
          sn(nil, { i(1), t "None(", i(2), t ") = ", i(3, "var") }),
          -- Error
          sn(nil, { i(1), t "Ok(", i(2), t ") = ", i(3, "var") }),
          sn(nil, { i(1), t "Err(", i(2), t ") = ", i(3, "var") }),
          -- Boolean
          sn(nil, { i(1), t "true = ", i(2, "var") }),
          sn(nil, { i(1), t "false = ", i(2, "var") }),
          -- Tuple
          sn(nil, { i(1), t "(", i(2, "foo, bar"), t ") = ", i(3, "var") }),
        }),
        i(2, "// ..."),
        i(3),
      }
    )
  ),
  -- }}}

  -- match {{{
  s( "match",
    fmt("match {} {{\n" ..
      "\t{}" ..
      "\n}}{}\n" ..
      "{}",
      {
        i(1, "pattern"),
        c(2, {
          d(1, function() -- action
            return sn(nil, {
              i(1),
              i(2, "Variant"),
              t({ " => " }),
              i(3, "action"),
              i(4),
            })
          end),
          d(1, function() -- action case
            return sn(nil, {
              i(1),
              i(2, "Variant"),
              t({ " => {", "\t\t" }),
              i(3, "// ..."),
              t({ "", "\t}" }),
              i(4)
            })
          end),
          d(1, function() -- error handling
            return sn(nil, {
              i(1),
              t({ "Ok(" }),
              i(2, "foo"),
              t({ ") => " }),
              i(3, "action"),
              t({ ",", "\tErr(" }),
              i(4, "err"),
              t({ ") => " }),
              i(5, "action"),
            })
          end),
          d(1, function() -- option
            return sn(nil, {
              i(1),
              t({ "Some(" }),
              i(2, "foo"),
              t({ ") => " }),
              i(3, "action"),
              t({ ",", "\tNone => " }),
              i(4, "action"),
            })
          end),
        }),
        i(3),
        i(4),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Function {{{
  s( "fn", -- function
    fmt("{}fn {}{}({}){}{{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        c(1, {
          -- no qualifier
          sn(nil, { i(1) }),
          -- async
          sn(nil, { i(1), t "async " }),
          -- const
          sn(nil, { i(1), t "const " }),
          -- unsafe
          sn(nil, { i(1), t "unsafe " }),
          -- public
          sn(nil, { i(1), t "pub " }),
        }),
        i(2, "function"),
        c(3, {
          sn(nil, { i(1) }),
          -- generic
          sn(nil, { i(1), t "<", i(2, "T"), t ">" }),
          -- generic + trait
          sn(nil, { i(1), t "<", i(2, "T: Trait"), t ">" }),
          -- lifetime
          sn(nil, { i(1), t "<'", i(2, "lifetime"), t ">" }),
        }),
        c(4, {
          -- no parameter
          sn(nil, { i(1), t "" }),
          -- parameter
          sn(nil, { i(1), i(2, "foo"), t ": ", i(3, "Type") }),
          -- self
          sn(nil, { i(1), t "&self" }),
          -- self + parameter
          sn(nil, { i(1), t "&self, ", i(2, "foo"), t ": ", i(3, "Type") }),
          -- self + mut
          sn(nil, { i(1), t "&mut self", i(2, "") }),
          -- self + mut + parameter
          sn(nil, { i(1), t "&mut self, ", i(2, "foo"), t ": ", i(3, "Type") }),
        }),
        c(5, {
          -- no return
          sn(nil, { i(1), t " " }),
          -- return
          sn(nil, { i(1), t " -> ", i(2, "Type"), t " " }),
          -- where
          d(1, function()
            return sn(nil, {
              i(1),
              t({ " -> " }),
              i(2, "Type"),
              t({ "", "\twhere " }),
              i(3, "T"),
              t({ ": " }),
              i(4, "Trait"),
              t({ "", "" }),
            })
          end),
          -- result
          sn(nil, { i(1), t " -> Result<", i(2, "Type"), t ", ", i(3, "io::Error"), t ">" }),
        }),
        i(6, "// ..."),
        i(7),
      }
    )
  ),
  -- }}}

  -- Loops {{{
  -- for {{{
  s( "for",
    fmt("for {} in {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "item"),
        i(2, "iterator"),
        i(3, "// ..."),
        i(4),
      }
    )
  ),
  -- }}}

  -- loop {{{
  s( "loop",
    fmt("{}\n" ..
      "{}",
      {
        c(1, {
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "'" }),
              i(2, "label"),
              t({ " loop {", "\t" }),
              i(3, "// ..."),
              t({ "", "\tbreak '" }),
              same(2),
              t({ ";", "}" }),
            })
          end),
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "loop {", "\t" }),
              i(2, "// ..."),
              t({ "", "}" }),
            })
          end),
        }),
        i(2),
      }
    )
  ),
  -- }}}

  -- while {{{
  s( "while",
    fmt("while {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "bool_condition"),
        i(2, "// ..."),
        i(3),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Macros {{{
  s( "println!",
    fmt("println!({});\n" ..
      "{}",
      {
        c(1, {
          -- String
          sn(nil, {i(1), t'"', i(2, "Hello, world!"), t'"'}),
          -- String + Variable
          sn(nil, {i(1), t'"', i(2, "Hello, world!"), t'", ', i(3, "foo")}),
        }),
        i(2),
      }
    )
  ),
  -- }}}

  -- Modules {{{
  -- crate {{{
  s("crate",
    fmt("{};\n" ..
      "{}",
      {
        c(1, {
          -- Absolute path
          sn(nil, { i(1), t "crate::", i(2, "module::function()") }),
          -- Relative path
          sn(nil, { i(1), i(2, "module::function()") }),
          -- Parent module
          sn(nil, { i(1), t "super::", i(2, "module::function()") }),
        }),
        i(2),
      }
    )
  ),
  -- }}}

  -- mod {{{
  s("mod",
    fmt("{}\n" ..
      "{}",
      {
        c(1, {
          d(1, function() -- mod (private)
            return sn(nil, {
              i(1),
              t({ "mod " }),
              i(2, "mod_name"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          d(1, function() -- mod (public)
            return sn(nil, {
              i(1),
              t({ "pub mod " }),
              i(2, "mod_name"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          d(1, function() -- mod (file)
            return sn(nil, {
              i(1),
              t({ "mod " }),
              i(2, "file_name"),
              t({ ";" }),
            })
          end),
        }),
        i(2),
      }
    )
  ),
  -- }}}

  -- use {{{
  s("use",
    fmt("use {};\n" ..
      "{}",
      {
        c(1, {
          -- Module
          sn(nil, { i(1), i(2, "module::module") }),
          -- Alias
          sn(nil, { i(1), i(2, "module::module"), t " as ", i(3, "name") }),
          -- Glob operator
          sn(nil, { i(1), i(2, "module::module"), t "::*" }),
          -- Nested path
          sn(nil, { i(1), i(2, "module::module"), t "::{", i(3, "foo, bar, baz"), t "}" }),
          -- Nested path (with self reference)
          sn(nil, { i(1), i(2, "module::module"), t "::{self, ", i(3, "foo, bar, baz"), t "}" }),
          -- Crate [Absolute path]
          sn(nil, { i(1), t "crate::", i(2, "module") }),
          -- Self [Relative path]
          sn(nil, { i(1), t "self::", i(2, "module") }),
          -- Super [TODO]
          sn(nil, { i(1), t "super::", i(2, "module") }),
        }),
        i(2),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Types {{{
  -- enum {{{
  s( "enum",
    fmt("enum {}\n" ..
      "}}\n",
      {
        c(1, {
          d(1, function() -- Generic
            return sn(nil, {
              i(1),
              i(2, "Type"),
              t({ " {", "\t" }),
              c(3, {
                -- Unit-like
                sn(nil, { i(1), i(2, "Variant"), t ",", i(3) }),
                -- Data
                sn(nil, { i(1), i(2, "Variant"), t "(", i(3, "Type"), t "),", i(4) }),
                -- Struct-like
                sn(nil, { i(1), i(2, "Struct"), t " { ", i(3, "Type"), t " },", i(4) }),
              }),
            })
          end),
          d(1, function() -- Option
            return sn(nil, {
              i(1),
              t({ "Option<T> {", "\tSome(T),", "\tNone," }),
            })
          end),
          d(1, function() -- Result
            return sn(nil, {
              i(1),
              t({ "Result<T, E> {", "\tOk(T),", "\tErr(E)," }),
            })
          end),
        }),
      }
    )
  ),
  -- }}}

  -- struct {{{
  s( "struct",
    fmt("struct {} {{\n" ..
      "\t{}{}\n" ..
      "}}\n" ..
      "{}",
      {
        c(1, {
          -- Type
          sn(nil, { i(1), i(2, "Type") }),
          -- Generic
          sn(nil, { i(1), i(2, "Type"), t "<", i(3, "T"), t ">" }),
          -- Where
          sn(nil, { i(1), i(2, "Type"), t "<", i(3, "T"), t "> where ", i(4, "T: Trait") }),
        }),
        c(2, {
          -- Key & Type
          sn(nil, { i(1), i(2, "key"), t ": ", i(3, "Type"), t "," }),
          -- Key
          sn(nil, { i(1), i(2, "key"), t "," }),
        }),
        i(3),
        i(4),
      }
    )
  ),
  -- }}}

  -- trait {{{
  s( "trait",
    fmt("{}trait {}{} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        c(1, {
          -- Private
          sn(nil, { i(1), t "" }),
          -- Public
          sn(nil, { i(1), t "pub " }),
        }),
        i(2, "Type"),
        c(3, {
          -- no generic type
          sn(nil, { i(1) }),
          -- generic type
          sn(nil, { i(1), t "<", i(2, "T, U, V"), t ">" }),
        }),
        i(4, "// ..."),
        i(5),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Variables {{{
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
    fmt("{} {}\n" ..
      "{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        c(2, {
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
        i(3),
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
  -- }}}
})
-- }}}
