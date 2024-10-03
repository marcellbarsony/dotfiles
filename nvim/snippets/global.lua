-- Global snippets
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
ls.add_snippets("all", {
  -- date {{{
  s("date",
    fmt("{}", {
      c(1, {
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
    })
  ),
  -- }}}

  -- lorem {{{
  s("lorem",
    fmt("{}", {
      c(1, {
        t { "Lorem ipsum dolor sit amet, consectetur adipiscing elit." },
        t { "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          "Proin nec condimentum massa. Quisque tempus tempus malesuada.",
          "Vivamus justo leo, mattis vel viverra ac, mattis sit amet ex.",
          "Maecenas vel scelerisque leo. Duis in congue urna. Praesent non est",
          "et nunc feugiat porttitor id quis nisi. Maecenas et lacinia ex.",
          "Donec mollis sapien accumsan elit aliquet dignissim eu volutpat massa.",
          "Nulla tempor mi a consequat rutrum. Praesent vitae scelerisque augue.",
          "Donec imperdiet lorem metus, id facilisis lectus fringilla a.",
          "Vivamus egestas, nunc et fringilla egestas, velit dui finibus purus,",
          "et congue odio felis quis elit. Nunc at risus velit. Proin ex mauris,",
          "pellentesque eu sem nec, lobortis aliquam ligula.",
        },
      }),
    })
  ),
  -- }}}

  -- pwd {{{
  s("pwd",
    fmt("{}", {
      f(function()
        return os.getenv("PWD")
      end)
    })
  ),
  -- }}}

  -- time {{{
  s("time",
    fmt("{}", {
      c(1, {
        f(function()
          return os.date("%I:%M %p")
        end),
        f(function()
          return os.date("%H:%M")
        end),
      }),
    })
  ),
  -- }}}

  -- user {{{
  s("user",
    fmt("{}", {
      f(function()
        return os.getenv("USER")
      end)
    })
  ),
  -- }}}
})
-- }}}
