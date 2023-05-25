-- rust-tools.nvim
-- https://github.com/simrat39/rust-tools.nvim

local rt = require("rust-tools")


rt.setup({
  -- LSP
  server = {
    on_attach = function(_, bufnr)
      -- Capabilities
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
      -- Hover actions
      vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  -- DAP
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
  },
})
