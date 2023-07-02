-- rust-tools.nvim
-- https://github.com/simrat39/rust-tools.nvim
-- https://github.com/vadimcn/codelldb

local rust_tools = require("rust-tools")
local mason_registry = require("mason-registry")

-- CodeLLDB
local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rust_tools.setup({

  -- https://github.com/simrat39/rust-tools.nvim/wiki/Debugging
  -- DAP (CodeLLDB)
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },

  -- Server
  -- https://github.com/simrat39/rust-tools.nvim#setup
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>ra", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>rg", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },

  -- Tools
  -- https://github.com/simrat39/rust-tools.nvim#configuration
  tools = {
    executor = require("rust-tools.executors").termopen,
    on_initialized = nil,
    reload_workspace_from_cargo_toml = true,
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
  },

})
