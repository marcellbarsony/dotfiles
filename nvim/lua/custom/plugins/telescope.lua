-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-lua/plenary.nvim
-- `:h telescope.nvim`

-- Helper functions {{{
local function safe_cmd(command, error_message)
  return function()
    local ok, _ = pcall(vim.cmd, command)
    if not ok then
      vim.api.nvim_err_writeln(error_message)
    end
  end
end
-- }}}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      -- Keys {{{
      { "<leader>tt", "<cmd>Telescope<CR>", desc = "Telescope" },
      { "<leader>tb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Current Buffer" },
      { "<leader>td", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>tg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<leader>tG", "<cmd>Telescope live_grep<CR>", desc = "Grep [String]" },
      { "<leader>to", "<cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },

      -- DAP {{{
      { "<leader>dd", "<cmd>lua require'telescope'.extensions.dap.configurations}<CR>", desc = "Debug" },
      { "<leader>dtc", "<cmd>lua require'telescope'.extensions.dap.commands}<CR>", desc = "Commands" },
      { "<leader>dtb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints}<CR>", desc = "Breakpoints" },
      { "<leader>dtv", "<cmd>lua require'telescope'.extensions.dap.variables}<CR>", desc = "Variables" },
      { "<leader>dtf", "<cmd>lua require'telescope'.extensions.dap.frames}<CR>", desc = "Frames" },
      -- }}}

      -- GIT {{{
      { "<leader>gb", safe_cmd("Telescope git_branches", "Warning: Not a Git directory"), desc = "Branches" },
      { "<leader>gc", safe_cmd("Telescope git_commits", "Warning: Not a Git directory"), desc = "Commits" },
      { "<leader>gf", safe_cmd("Telescope git_files", "Warning: Not a Git directory"), desc = "Files" },
      { "<leader>gs", safe_cmd("Telescope git_status", "Warning: Not a Git directory"), desc = "Status" },
      -- }}}

      -- LSP {{{
      { "gD", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Definition [Type]" },
      { "<leader>lI", "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
      { "<leader>lci", "<cmd>Telescope lsp_incoming_calls<CR>", desc = "Incoming" },
      { "<leader>lco", "<cmd>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing" },
      { "<leader>lR", "<cmd>Telescope lsp_references<CR>", desc = "References" },
      { "<leader>lSd", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document" },
      { "<leader>lSw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace" },
      -- }}}

      -- Treesitter {{{
      { "<leader>vth", "<cmd>Telescope highlights<CR>", desc = "Highlights" },
      { "<leader>vts", "<cmd>Telescope treesitter<CR>", desc = "Symbols" },
      -- }}}

      -- Vim {{{
      { "<leader>vta", "<cmd>Telescope autocommands<CR>", desc = "Autocommands" },
      { "<leader>vtc", "<cmd>Telescope commands<CR>", desc = "Commands" },
      { "<leader>vtj", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
      { "<leader>vtk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
      { "<leader>vtm", "<cmd>Telescope man_pages<CR>", desc = "Man pages" },
      { "<leader>vto", "<cmd>Telescope vim_options<CR>", desc = "Options" },
      { "<leader>vtr", "<cmd>Telescope registers<CR>", desc = "Registers" },
      { "<leader>vHc", "<cmd>Telescope command_history<CR>", desc = "Command" },
      { "<leader>vHs", "<cmd>Telescope search_history<CR>", desc = "Search" }
      -- }}}
    -- }}}
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        -- Defaults {{{
        defaults = {
          -- Border
          border = true,
          -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },

          -- Icons
          entry_prefix = " ",
          multi_icon = "+",
          prompt_prefix = "> ",
          selection_caret = ">",

          -- Mode
          initial_mode = "insert",

          -- Mappings & Actions
          -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
          -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua
          mappings = {
            -- Insert {{{
            i = {
              ["<C-p>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-f>"] = actions.preview_scrolling_left,
              ["<C-k>"] = actions.preview_scrolling_right,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["<M-f>"] = actions.results_scrolling_left,
              ["<M-k>"] = actions.results_scrolling_right,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-/>"] = actions.which_key,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
              ["<C-w>"] = { "<c-s-w>", type = "command" },
              ["<C-r><C-w>"] = actions.insert_original_cword,
              ["<C-r><C-a>"] = actions.insert_original_cWORD,
              ["<C-r><C-f>"] = actions.insert_original_cfile,
              ["<C-r><C-l>"] = actions.insert_original_cline,
            },
            -- }}}

            -- Normal {{{
            n ={
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              -- TODO: This would be weird if we switch the ordering.
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-f>"] = actions.preview_scrolling_left,
              ["<C-k>"] = actions.preview_scrolling_right,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["<M-f>"] = actions.results_scrolling_left,
              ["<M-k>"] = actions.results_scrolling_right,

              ["?"] = actions.which_key,
            }
            -- }}}
          },

          -- Opacity
          winblend = 0,

          -- Strategy & Layout
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          scroll_strategy = "cycle",
          selection_strategy = "reset",
          sorting_strategy = "ascending",

          -- Title
          dynamic_preview_title = false,
          prompt_title = false,
          results_title = false,

          -- Wrap
          wrap_results = false,
        },
        -- }}}

        -- Pickers {{{
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
              }
            }
          },
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
          }
        },
        -- }}}

        -- Extensions {{{
        extensions = {
          -- extension_name = {
          -- config_key = value,
          -- }
        }
        -- }}}
      }
    end
  }
}
