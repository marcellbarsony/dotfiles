-- rust-tools.nvim
-- https://github.com/simrat39/rust-tools.nvim
-- https://github.com/vadimcn/codelldb
-- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
-- :help rust-tools.txt

local rust_tools = require("rust-tools")
local mason_registry = require("mason-registry")

-- CodeLLDB
-- https://github.com/simrat39/rust-tools.nvim/wiki/Debugging
local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rust_tools.setup({
  -- DAP (CodeLLDB)
  dap = {
    -- https://github.com/simrat39/rust-tools.nvim/wiki/Debugging
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },

  -- Server
  server = {
    -- Keymaps
    -- https://github.com/simrat39/rust-tools.nvim#setup
    -- :help rust-tools-rust-tools.nvim-setup
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>lra", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>lrg", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
    -- Settings
    -- https://github.com/simrat39/rust-tools.nvim/wiki/Server-Configuration-Schema
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
              enable = true,
          },
        },
        procMacro = {
          enable = true
        },
      }
    }
  },

  -- Tools
  -- https://github.com/simrat39/rust-tools.nvim#configuration
  -- :help rust-tools-rust-tools.nvim-configuration
  tools = {
    executor = require("rust-tools.executors").termopen,
    on_initialized = nil,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      auto_focus = true,
      border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      max_width = nil,
      max_height = nil,
    },
    crate_graph = {
      backend = "x11",
      output = nil,
      full = true,
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },
})
