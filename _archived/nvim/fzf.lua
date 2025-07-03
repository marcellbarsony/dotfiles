-- Fzf-lua
-- https://github.com/ibhagwan/fzf-lua

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fB", "<cmd>FzfLua<CR>", desc = "Builtin" },

      -- Buffers & Files {{{
      { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Old files" },
      { "<leader>fq", "<cmd>FzfLua quickfix<CR>", desc = "Quickfix" },
      { "<leader>fQ", "<cmd>FzfLua quickfix_stack<CR>", desc = "Quickfix [Stack]" },
      { "<leader>fl", "<cmd>FzfLua loclist<CR>", desc = "Loclist" },
      { "<leader>fL", "<cmd>FzfLua loclist_stack<CR>", desc = "Loclist [Stack]" },
      -- }}}

      -- DAP {{{
      { "<leader>dd", "<cmd>FzfLua dap_configurations<CR>", desc = "Configurations" },
      { "<leader>dfb", "<cmd>FzfLua dap_breakpoints<CR>", desc = "Breakpoints" },
      { "<leader>dfc", "<cmd>FzfLua dap_commands<CR>", desc = "Commands" },
      { "<leader>dff", "<cmd>FzfLua dap_frames<CR>", desc = "Frames" },
      { "<leader>dfv", "<cmd>FzfLua dap_variables<CR>", desc = "Variables" },
      -- }}}

      -- Git {{{
      { "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Branches" },
      { "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
      { "<leader>gd", "<cmd>FzfLua git_diff<CR>", desc = "Diff" },
      { "<leader>gf", "<cmd>FzfLua git_files<CR>", desc = "Files" },
      { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
      { "<leader>gS", "<cmd>FzfLua git_stash<CR>", desc = "Stash" },
      -- }}}

      -- LSP {{{
      { "gD", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Denfinition [Type]" },
      { "<leader>la", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Actions" },
      { "<leader>lci", "<cmd>FzfLua lsp_incoming_calls<CR>", desc = "Incoming" },
      { "<leader>lco", "<cmd>FzfLua lsp_outgoing_calls<CR>", desc = "Outgoing" },
      { "<leader>lD", "<cmd>FzfLua lsp_definitions<CR>", desc = "Definitions" },
      { "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", desc = "Implementations" },
      { "<leader>lRr", "<cmd>FzfLua lsp_references<CR>", desc = "References" },
      { "<leader>lSd", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document" },
      { "<leader>lSw", "<cmd>FzfLua lsp_workspace_symbols<CR>", desc = "Workspace" },
      -- }}}

      -- Search {{{
      { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Grep" },
      { "<leader>fG", "<cmd>FzfLua live_grep_glob<CR>", desc = "Grep [Global]" },
      -- }}}

      -- Treesitter {{{
      { "<leader>vTs", "<cmd>FzfLua treesitter<CR>", desc = "Symbols" },
      -- }}}

      -- Vim {{{
      { "<leader>vfa", "<cmd>FzfLua autocmds<CR>", desc = "Autocommands" },
      { "<leader>vfc", "<cmd>FzfLua commands<CR>", desc = "Commands" },
      { "<leader>vfh", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
      { "<leader>vfj", "<cmd>FzfLua jumplist<CR>", desc = "Jumplist" },
      { "<leader>vfk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
      { "<leader>vfm", "<cmd>FzfLua manpages<CR>", desc = "Manpages" },
      { "<leader>vfo", "<cmd>FzfLua nvim_options<CR>", desc = "Options" },
      { "<leader>vfr", "<cmd>FzfLua registers<CR>", desc = "Registers" },
      { "<leader>vHc", "<cmd>FzfLua command_history<CR>", desc = "Command" },
      { "<leader>vHs", "<cmd>FzfLua search_history<CR>", desc = "Search" },
      -- }}}
    },
    config = function ()
      require("fzf-lua").setup{
        -- Winopts {{{
        winopts = {
          border = "none",
          backdrop = 0,
          preview = {
            border = "none",
            vertical       = "down:50%",      -- up|down:size
            horizontal     = "right:50%",     -- right|left:size
          }
        },
        -- }}}

        -- Keymaps {{{
        keymap = { },
        -- }}}

        -- Actions {{{
        actions = { },
        -- }}}

        -- Options {{{
        fzf_opts = { },
        -- }}}

        -- Colors {{{
        fzf_colors = { },
        -- }}}

        -- Highlights {{{
        hls = {
          normal = "NormalSB",         -- normal fg/bg
          preview_normal = "NormalSB",  -- preview fg/bg
          cursorlinenr = "CursorLine",
        },
        -- }}}

        -- Previewers {{{
        previewers = { },
        -- }}}

        -- Files {{{
        files = {
          cwd_prompt = false,
        },
        -- }}}
      }
    end
  }
}
