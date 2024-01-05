-- Rustaceanvim
-- https://github.com/mrcjkb/rustaceanvim
-- :h rustaceanvim.config

-- Advanced configuration
-- https://github.com/mrcjkb/rustaceanvim#advanced-configuration
vim.g.rustaceanvim = function()
  -- Debugging
  -- https://github.com/mrcjkb/rustaceanvim#using-codelldb-for-debugging
  local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

  -- https://github.com/mrcjkb/rustaceanvim/blob/master/lua/rustaceanvim/config/internal.lua
  local cfg = require("rustaceanvim.config")
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      hover_actions = {
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
        auto_focus = true,
      },
    },
    inlay_hints = {
      highlight = "NonText",
    },
  }
end

-- Keymaps
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local bufnr = vim.api.nvim_get_current_buf()

map("n", "<leader>lrc", function() vim.cmd.RustLsp("codeAction") end, { silent = true, buffer = bufnr, desc = "Code Action" })
map("n", "<leader>lrd", function() vim.cmd.RustLsp("debuggables") end, { desc = "Debuggables" })
map("n", "<leader>lrr", function() vim.cmd.RustLsp("runnables") end, { desc = "Runnables" })
map("n", "<leader>lrj", function() vim.cmd.RustLsp("joinLines") end, { desc = "Join lines" })
