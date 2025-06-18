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
  s({
    trig = "#[attr]",
    name = "Attributes",
    desc = "Attributes:\n" ..
      "derive(Debug) / test \n" ..
      " "
    },
    fmt("#[{}]{}", {
      c(1, {
        -- derive-debug {{{
        d(1, function()
          return sn(nil, {
            i(1),
            t({ "derive(Debug)" }),
          })
        end),
        -- }}}
        -- test {{{
        d(1, function()
          return sn(nil, {
            i(1),
            t({ "test" }),
          })
        end),
        -- }}}
        -- ignore test {{{
        d(1, function()
          return sn(nil, {
            i(1),
            t({ "test]", '#[ignore = "' }),
            i(2, "reason"),
            t({ '"' }),
          })
        end),
        -- }}}
      }),
      i(0)
    })
  ),
  -- }}}

  -- Control flow {{{
  -- if/else {{{
  s({
    trig = "if",
    name = "ef-else statement",
    desc = "if <condition> {\n" ..
      " ",
    },
    fmt("{}\n" ..
      "{}",
      {
        c(1, {
          -- if {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "if " }),
              i(2, "condition"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
              c(4, {
                -- if {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ "" }),
                  })
                end),
                -- }}}
                -- else {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ " else {", "\t" }),
                    i(2, "// ..."),
                    t({ "", "}" }),
                  })
                end),
                -- }}}
                -- else-if {{{
                d(1, function()
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
                -- }}}
              })
            })
          end),
          -- }}}
          -- let if {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "let " }),
              i(2, "var"),
              t({ " =", "\tif " }),
              i(3, "condition"),
              t({ " {", "\t\t" }),
              i(4, "// ..."),
              t({ "", "\t}" }),
              c(5, {
                -- if {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ ";" }),
                  })
                end),
                -- }}}
                -- else {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ " else {", "\t\t" }),
                    i(2, "// ..."),
                    t({ "", "\t};" }),
                  })
                end),
                -- }}}
                -- else-if {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ " else if " }),
                    i(2, "condition"),
                    t({ " {", "\t\t" }),
                    i(3, "// ..."),
                    t({ "", "\t} else {", "\t\t" }),
                    i(4, "// ..."),
                    t({ "", "\t};" }),
                  })
                end),
                -- }}}
              })
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- if let {{{
  s({
    trig = "if let",
    name = "If-let statement",
    desc = "If-let statement\n" ..
      " ",
    },
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
        i(0)
      }
    )
  ),
  -- }}}

  -- match {{{
  s({
    trig = "match",
    name = "Match statement",
    desc = "Match statement\n" ..
      " ",
    },
    fmt("{}match {} {{\n" ..
      "\t{}" ..
      "\n}}{}\n" ..
      "{}",
      {
        c(1, {
          sn(nil, { i(1) }),
          sn(nil, { i(1), t "let ", i(2, "var"), t " = " }),
        }),
        i(2, "pattern"),
        c(3, {
          -- Action {{{
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "Variant"),
              t({ " => " }),
              c(3, {
                -- Action {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    i(2, "action"),
                  })
                end),
                -- }}}
                -- Action case {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ "{", "\t\t" }),
                    i(2, "action"),
                    t({ "", "\t}" }),
                  })
                end),
                -- }}}
              }),
              c(4, {
                -- Remaining case {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({ ",", "\t_ => " }),
                    i(2, "action"),
                    t(",")
                  })
                end),
                -- }}}
                -- Empty {{{
                d(1, function()
                  return sn(nil, {
                    i(1),
                    t({","}),
                  })
                end),
                -- }}}
              }),
            })
          end),
          -- }}}
          -- Error handling (Ok/Err) {{{
          d(1, function()
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
          -- }}}
          -- Option (Some/None) {{{
          d(1, function()
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
          -- }}}
        }),
        i(4),
        i(0)
      }
    )
  ),
  -- }}}
  -- }}}

  -- Function {{{
  s({
    trig = "fn",
    name = "Function definition",
    desc = "Function definition\n" ..
      " ",
    },
    fmt("{}fn {}{}({}){}{{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        -- Qualifier {{{
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
        -- }}}
        i(2, "function"),
        -- Traits/Lifetimes {{{
        c(3, {
          sn(nil, { i(1) }),
          -- generic
          sn(nil, { i(1), t "<", i(2, "T, U, V"), t ">" }),
          -- generic + trait
          sn(nil, { i(1), t "<", i(2, "T: Trait, U: Trait, V: Trait"), t ">" }),
          -- lifetime
          sn(nil, { i(1), t "<'", i(2, "lifetime"), t ">" }),
        }),
        -- }}}
        -- Signature {{{
        c(4, {
          -- no parameter
          sn(nil, {i(1), t "" }),
          -- parameter
          sn(nil, {i(1), i(2, "par: Type")}),
          -- self
          sn(nil, {i(1), t "&self" }),
          -- self + parameter
          sn(nil, {i(1), t "&self, ", i(2, "par: Type")}),
          -- mut self
          sn(nil, {i(1), t "&mut self", i(2, "") }),
          -- mut self + parameter
          sn(nil, {i(1), t "&mut self, ", i(2, "par: Type")}),
        }),
        -- }}}
        -- Return {{{
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
              i(3, "T: Trait"),
              t({ "", "" }),
            })
          end),
          -- result
          d(1, function()
            return sn(nil, {
              i(1),
              t({ " -> Result<" }),
              i(2, "Type"),
              t({ ", " }),
              i(3, "io::Error"),
              t({ "> " }),
            })
          end),
        }),
        -- }}}
        i(6, "// ..."),
        i(0),
      }
    )
  ),
  -- }}}

  -- Loops {{{
  -- for {{{
  s({
    trig = "for",
    name = "For loop",
    desc = "For loop\n" ..
      " ",
    },
    fmt("for {} in {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "iter"),
        c(2, {
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "iterator"),
            })
          end),
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "iterator"),
              c(3, {
                t".iter()",
                t".into_iter()",
                t".iter_mut()",
              })
            })
          end),
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "1..11"),
            })
          end),
        }),
        i(3, "// ..."),
        i(0)
      }
    )
  ),
  -- }}}

  -- while {{{
  s({
    trig = "while",
    name = "While pool",
    desc = "While loop\n" ..
      " ",
    },
    fmt("while {} {{\n" ..
      "\t{}\n" ..
      "}}\n" ..
      "{}",
      {
        i(1, "bool_condition"),
        i(2, "// ..."),
        i(0)
      }
    )
  ),
  -- }}}

  -- loop {{{
  s({
    trig = "loop",
    name = "loop",
    desc = "loop\n" ..
      " ",
    },
    fmt("{}\n" ..
      "{}",
      {
        c(1, {
          -- label {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "'" }),
              i(2, "label"),
              t({ ": loop {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- label + break {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "'" }),
              i(2, "label"),
              t({ ": loop {", "\t" }),
              i(3, "// ..."),
              t({ "", "\tbreak '" }),
              i(4, "label"),
              t({ ";", "}" }),
            })
          end),
          -- }}}
          -- loop {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "loop {", "\t" }),
              i(2, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- loop + break {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "loop {", "\t" }),
              i(2, "// ..."),
              t({ "", "\tbreak" }),
              i(3, ""),
              t({ ";", "}" }),
            })
          end),
          -- }}}
        }),
        i(0),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Macros {{{
  -- eprintln! {{{
  s({
    trig = "eprintln!",
    name = "eprintln!",
    desc = "eprintln!\n" ..
      " ",
    },
    fmt("eprintln!({}){}",
      {
        c(1, {
          -- String
          sn(nil, {i(1), t'"', i(2, "Print error"), t'"'}),
          -- String + Variable
          sn(nil, {i(1), t'"', i(2, "Print error"), t" {", i(3, ":?"), t'}", ', i(4, "var")}),
        }),
        c(2, {
          sn(nil, {i(1), t";"}),
          sn(nil, {i(1), t""}),
        }),
      }
    )
  ),
  -- }}}

  -- println! {{{
  s({
    trig = "println!",
    name = "println!",
    desc = "println!\n" ..
      " ",
    },
    fmt("println!({}){}",
      {
        c(1, {
          -- String
          sn(nil, {i(1), t'"', i(2, "Print macro"), t'"'}),
          -- String + Variable
          sn(nil, {i(1), t'"', i(2, "Print macro"), t" {", i(3, ":?"), t'}", ', i(4, "var")}),
        }),
        c(2, {
          sn(nil, {i(1), t";"}),
          sn(nil, {i(1), t""}),
        }),
      }
    )
  ),
  -- }}}

  -- panic! {{{
  s({
    trig = "panic!",
    name = "panic!",
    desc = "panic!\n" ..
      " ",
    },
    fmt("panic!(\"{}\");{}",
      {
        i(1, "Error message"),
        i(0),
      }
    )
  ),
  -- }}}
  -- }}}

  -- Modules {{{
  -- crate {{{
  s({
    trig = "module",
    name = "module",
    desc = "module\n" ..
      " ",
    },
    fmt("{};{}",
      {
        c(1, {
          -- Relative path
          sn(nil, { i(1), i(2, "module::function()") }),
          -- Absolute path
          sn(nil, { i(1), t "crate::", i(2, "module::function()") }),
          -- Parent module
          sn(nil, { i(1), t "super::", i(2, "module::function()") }),
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- mod {{{
  s({
    trig = "mod",
    name = "mod",
    desc = "mod\n" ..
      " ",
    },
    fmt("{}{}",
      {
        c(1, {
          -- mod (private) {{{
          d(1, function() -- mod (private)
            return sn(nil, {
              i(1),
              t({ "mod " }),
              i(2, "module"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- mod (public) {{{
          d(1, function() -- mod (public)
            return sn(nil, {
              i(1),
              t({ "pub mod " }),
              i(2, "module"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- mod (file) {{{
          d(1, function() -- mod (file)
            return sn(nil, {
              i(1),
              t({ "mod " }),
              i(2, "file"),
              t({ ";" }),
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- use {{{
  s({
    trig = "use",
    name = "use",
    desc = "use\n" ..
      " ",
    },
    fmt("use {};{}",
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
        i(0)
      }
    )
  ),
  -- }}}
  -- }}}

  -- Enum {{{
  s({
    trig = "enum",
    name = "enum",
    desc = "enum\n" ..
      " ",
    },
    fmt("{}enum {}\n" ..
      "}}{}\n",
      {
        c(1, {
          sn(nil, { i(1) }),
          sn(nil, { i(1), t "pub " }),
        }),
        c(2, {
          -- Generic {{{
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
          -- }}}
          -- Option {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "Option<T> {", "\tSome(T),", "\tNone," }),
            })
          end),
          -- }}}
          -- Result {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "Result<T, E> {", "\tOk(T),", "\tErr(E)," }),
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Structs {{{
  s({
    trig = "struct",
    name = "Struct",
    desc = "struct Point {\n" ..
      "\tx: f32,\n" ..
      "\ty: f32\n" ..
      "}\n" ..
      " ",
    },
    fmt("{}struct {}{}",
      {
        c(1, {
          sn(nil, { i(1) }),
          sn(nil, { i(1), t "pub " }),
        }),
        c(2, {
          -- C-like {{{
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "Clike"),
              c(3, {
                -- Type
                sn(nil, { i(1) }),
                -- Generic
                sn(nil, { i(1), t "<", i(2, "T, U, V"), t ">" }),
                -- Where
                sn(nil, { i(1), t "<", i(2, "T"), t "> where ", i(3, "T: Trait") }),
              }),
              t({ " {", "\t" }),
              c(4, {
                -- Key & Type
                sn(nil, { i(1), i(2, "key"), t ": ", i(3, "Type"), t "," }),
                -- Key
                sn(nil, { i(1), i(2, "key"), t "," }),
              }),
              i(5),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- Tuple {{{
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "Tuple"),
              t({ " {" }),
              i(3, "i32, i32, i32"),
              t({ "}" }),
            })
          end),
          -- }}}
          -- Unit {{{
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, "Unit"),
              t({ ";" }),
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Impl {{{
  s({
    trig = "impl",
    name = "impl",
    desc = "impl\n" ..
      " ",
    },
    fmt("{}{}",
      {
        c(1, {
          -- Type {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "impl "}),
              i(2, "Type"),
              t({ " {", "\t" }),
              i(3, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- Type + Generic {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "impl<"}),
              i(2, "T, U, V"),
              t({ "> "}),
              i(3, "Type"),
              t({ "<"}),
              same(2),
              t({ "> {", "\t" }),
              i(4, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
          -- Trait for Type {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "impl "}),
              i(2, "Trait"),
              t({ " for " }),
              i(3, "Type"),
              t({ " {", "\t" }),
              i(4, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Trait {{{
  s({
    trig = "trait",
    name = "trait",
    desc = "trait\n" ..
      " ",
    },
    fmt("{}trait {}{} {{\n" ..
      "\t{}\n" ..
      "}}{}",
      {
        c(1, {
          -- Private
          sn(nil, { i(1), t "" }),
          -- Public
          sn(nil, { i(1), t "pub " }),
        }),
        i(2, "Trait"),
        c(3, {
          -- No Generic type
          sn(nil, { i(1) }),
          -- Generic type
          sn(nil, { i(1), t "<", i(2, "T, U, V"), t ">" }),
        }),
        i(4, "// ..."),
        i(0)
      }
    )
  ),
  -- }}}

  -- Variables {{{
  -- Array {{{
  s({
    trig = "array",
    name = "Array",
    desc = "**Malloc**: Stack\n" ..
      "**Sequence**: Fixed-size\n" ..
      "**Data types**: Same type\n" ..
      " ",
    },
    fmt("{} {}{} = [{}];{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "arr"),
        c(3, {
          -- Implicit type
          sn(nil, {i(1), t""}),
          -- Explicit type
          sn(nil, {i(1), t": [", i(2, "T"), t"; ", i(3, "len"), t"]"}),
        }),
        c(4, {
          -- Individual elements
          sn(nil, {i(1), i(2, "foo, bar, baz")}),
          -- Repeat expression
          sn(nil, {i(1), i(2, "repeat"), t"; ", i(3, "N")}),
          -- 2D array
          sn(nil, {t"[", i(1), i(2, "foo, bar, baz"), t"], [", i(3, "foo, bar, baz"), t"]", i(4)})
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Boolean {{{
  s({
    trig = "boolean",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}: bool = {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "bool"),
        c(3, {
          sn(nil, {i(1), t"true"}),
          sn(nil, {i(1), t"false"})
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Character {{{
  s({
    trig = "character",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}: char = '{}';{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "char"),
        i(3, ""),
        i(0)
      }
    )
  ),
  -- }}}

  -- Closure {{{
  s({
    trig = "closure",
    name = "Closure",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {} = |{}| {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "clos"),
        c(3, {
          sn(nil, {i(1), i(2, "foo, bar, baz")}),
          sn(nil, {i(1)}),
        }),
        c(4, {
          -- One liner {{{
          d(1, function()
            return sn(nil, {
              i(1),
              i(2, 'println!("")'),
            })
          end),
          -- }}}
          -- Function body {{{
          d(1, function()
            return sn(nil, {
              i(1),
              t({ "{", "\t" }),
              i(2, "// ..."),
              t({ "", "}" }),
            })
          end),
          -- }}}
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Constant {{{
  s({
    trig = "constant",
    name = "Constant variable",
    desc = "const\n" ..
      " ",
    },
    fmt("const {}: {} = {};{}",
      {
        i(1, "CONSTANT"),
        i(2, "T"),
        i(3, "value"),
        i(0)
      }
    )
  ),
  -- }}}

  -- File {{{
  s({
    trig = "file",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}{} = File::{};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "f"),
        c(3, {
          sn(nil, {i(1)}),
          sn(nil, {i(1), t": Result<", i(2, "File, Error"), t">"}),
        }),
        i(4, ""),
        i(0)
      }
    )
  ),
  -- }}}

  -- Hashmap {{{
  s({
    trig = "hashmap",
    name = "HashMap",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("let mut {}{};{}",
      {
        i(1, "hash"),
        c(2, {
          sn(nil, {i(1), t": HashMap<", i(2, "K"), t", ", i(3, "V"), t"> = HashMap::new()"}),
          sn(nil, {i(1), t" = HashMap::<", i(2, "K"), t", ", i(3, "V"), t">::new()"}),
          sn(nil, {i(1), t" = HashMap::", i(2, "")})
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Integer {{{
  s({
    trig = "integer",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}{} = {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "int"),
        c(3, {
          sn(nil, {i(1), t""}),
          sn(nil, {i(1), t": ", i(2, "T")}),
        }),
        i(4, "32"),
        i(0)
      }
    )
  ),
  -- }}}

  -- Option {{{
  s({
    trig = "option",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}: Option<{}> = {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "opt"),
        i(3, "T"),
        c(4, {
          -- None
          sn(nil, {i(1), t"None"}),
          -- Some
          sn(nil, {i(1), t"Some(", i(2, "value"), t")"}),
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- PathBuf {{{
  s({
    trig = "pathbuf",
    name = "PathBuffer",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}{} = PathBuf::{};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "path"),
        c(3, {
          -- No Type
          sn(nil, {i(1), t""}),
          -- Type
          sn(nil, {i(1), t': PathBuf' }),
        }),
        c(4, {
          -- New
          sn(nil, {i(1), t"new()"}),
          -- From
          sn(nil, {i(1), t'from("', i(2, "/path/to/file.ext"), t'")'}),
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- String {{{
  s({
    trig = "string",
    name = "String",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}: {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "str"),
        c(3, {
          -- String slice (&str)
          sn(nil, {i(1), t"&str", t' = "', i(2), t'"'}),
          -- String literal (empty)
          sn(nil, {i(1), t"String", t" = String::new()"}),
          -- String literal (content)
          sn(nil, {i(1), t"String", t' = String::from("', i(2), t'")'}),
          -- String format
          sn(nil, {i(1), t"String", t' = format!("', i(2, 'Hello {}", "world!'), t'")'}),
          -- String reference
          sn(nil, {i(1), t"&String", t' = ', i(2)})
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Tuple {{{
  s({
    trig = "tuple",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}{} = ({});{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "tup"),
        c(3, {
          sn(nil, {i(1)}),
          sn(nil, {i(1), t": (", i(2, 'T, T, T'), t')'}),
        }),
        i(4, "foo, bar, baz"),
        i(0)
      }
    )
  ),
  -- }}}

  -- Tuple (destructuring) {{{
  s({
    trig = "tuple-destruct",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} ({}) = {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "var1, var2"),
        i(3, "tup"),
        i(0)
      }
    )
  ),
  -- }}}

  -- Vector {{{
  s({
    trig = "vector",
    name = "Variable bindings",
    desc = "let [mut] NAME: Type = value\n" ..
      " ",
    },
    fmt("{} {}{} = {};{}",
      {
        c(1, {
          t"let",
          t"let mut"
        }),
        i(2, "vec"),
        c(3, {
          -- no type
          sn(nil, {i(1)}),
          -- type
          sn(nil, {i(1), t": Vec<", i(2, "T"), t">"}),
        }),
        c(4, {
          -- empty
          sn(nil, {i(1), t"Vec::new()"}),
          -- content
          sn(nil, {i(1), t"vec![", i(2, "foo, bar, baz"), t"]"}),
          -- arguments
          sn(nil, {i(1), t"env::args().collect()"}),
          -- custom
          sn(nil, {i(1), i(2)})
        }),
        i(0)
      }
    )
  ),
  -- }}}

  -- Static {{{
  s({
    trig = "static",
    name = "Static (Global) variable",
    desc = "static STATIC: Type = value\n" ..
      " ",
    },
    fmt("{} {}: {} = {};{}",
      {
        c(1, {
          t"static",
          t"static mut"
        }),
        i(2, "STATIC"),
        i(3, "Type"),
        i(4, ""),
        i(0)
      }
    )
  ),
  -- }}}
  -- }}}
})
-- }}}
