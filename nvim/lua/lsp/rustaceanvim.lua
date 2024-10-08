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
    -- tools = {
    --   hover_actions = {
    --     auto_focus = true,
    --     border = {
    --       { "┌", "FloatBorder" },
    --       { "─", "FloatBorder" },
    --       { "┐", "FloatBorder" },
    --       { "│", "FloatBorder" },
    --       { "┘", "FloatBorder" },
    --       { "─", "FloatBorder" },
    --       { "└", "FloatBorder" },
    --       { "│", "FloatBorder" },
    --     },
    --     replace_builtin_hover = true,
    --   },
    -- },
    -- inlay_hints = {
    --   highlight = "NonText",
    -- },
    -- server = {
    --   on_attach = function(client, bufnr)
    --     require("lsp-inlayhints").on_attach(client, bufnr)
    --   end
    -- }
  }
end
