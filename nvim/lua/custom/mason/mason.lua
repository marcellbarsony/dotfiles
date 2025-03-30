-- Mason
-- https://github.com/williamboman/mason.nvim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
-- `:h mason`

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    build = ":MasonUpdate",
    cmd = "Mason",
    config = function()
      local mason = require("mason")
      mason.setup({
        PATH = "prepend",

        log_level = vim.log.levels.INFO,

        max_concurrent_installers = 5,

        registries = {
          "github:mason-org/mason-registry"
        },

        providers = {
          "mason.providers.registry-api",
          "mason.providers.client"
        },

        github = {
          download_url_template = "https://github.com/%s/releases/download/%s/%s"
        },

        pip = {
          upgrade_pip = true,
          install_args = {}
        },

        ui = {
          check_outdated_packages_on_open = false,
          border = "none",
          width = 0.8,
          height = 0.8,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
          keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "v",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "x",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
            toggle_package_install_log = "<CR>",
            toggle_help = "g?"
          }
        }
      })
    end
  }
}
