-- mason.nvim
-- https://github.com/williamboman/mason.nvim

require("mason").setup({

  -- Pip
  pip = {
    upgrade_ipi = true, -- Upgrade pip to the latest version in the virtual environment before installing packages.
    install_args = {},
  },

  -- Log level
  log_level = vim.log.levels.INFO,

  -- Concurrent installers
  max_concurrent_installers = 4,

  -- GitHub
  github = {
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  -- Providers
  providers = {
    "mason.providers.registry-api",
 },

  -- UI
  ui = {
    check_outdated_packages_on_open = false,
    border = "none", -- none/rounded
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
    },
  },

})

require("mason-lspconfig").setup()
