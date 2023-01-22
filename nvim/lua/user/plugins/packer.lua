-- Packer
-- https://github.com/wbthomason/packer.nvim

-- Variables
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer = require("packer")

-- Packer auto install
-- @diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing Packer.nvim. Restart Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocmd (compile plugins on write)
-- PackerSync / PackerCompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('Packer.nvim failed to load')
  vim.notify('Please check packer.lua')
  return
end

-- Packer init
packer.init {
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  snapshot = nil, -- Name of the snapshot you would like to load at startup
  --  snapshot_path = join_paths(stdpath 'cache', 'packer.nvim'), -- Default save directory for snapshots
  --  package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  --  compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
  plugin_package = 'packer', -- Default package for plugins
  max_jobs = nil, -- No. of simultaneous jobs. nil means no limit
  auto_clean = true, -- During sync(), remove unused plugins
  compile_on_sync = true, -- During sync(), run packer.compile()
  disable_commands = false, -- Disable creating commands
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  transitive_opt = true, -- Make dependencies of opt plugins also opt by default
  transitive_disable = true, -- Automatically disable dependencies of disabled plugins
  auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
  preview_updates = false, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=false',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 60, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    compact = false, -- If true, fold updates results by default
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_update = 'u', -- only in preview
      continue = 'c', -- only in preview
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
  log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = false,
    threshold = 1,
  },
  autoremove = false, -- Remove disabled or unused plugins without prompting
}

-- Plugins
return packer.startup(function(use)

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Auto pair
  use 'windwp/nvim-autopairs'

  -- Bufferline
  use { 'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Color theme
  use 'folke/tokyonight.nvim'

  -- Dashboard
  use 'goolord/alpha-nvim'

  -- CMP
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  }

  -- Fold (ufo)
  -- use { 'kevinhwang91/nvim-ufo',
  --   requires = 'kevinhwang91/promise-async'
  -- }

  -- Gitsigns
  use { 'lewis6991/gitsigns.nvim' }

  -- Indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- LSP
  use { 'williamboman/mason.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'onsails/lspkind.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }

  -- LSP Lines
  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

  -- LSP Saga
  use { 'glepnir/lspsaga.nvim' }

  -- Nvim tree
  use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Null-ls
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Snippets [Luasnip]
  use { 'L3MON4D3/LuaSnip',
    requires = {
      'saadparwaiz1/cmp_luasnip',
      -- 'rafamadriz/friendly-snippets'
    },
  }

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  -- use 'glepnir/galaxyline.nvim'
  -- use 'feline-nvim/feline.nvim'
  -- use 'windwp/windline.nvim'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {
      'nvim-lua/plenary.nvim', -- Lua library
      'BurntSushi/ripgrep'
    } }
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'p00f/nvim-ts-rainbow' }
  }

  -- Which key
  use 'folke/which-key.nvim'

  -- DAP (Debug)
  use { 'mfussenegger/nvim-dap',
    requires = {
      'mfussenegger/nvim-dap-python', -- Python
      'nvim-telescope/telescope-dap.nvim', -- Telescope
      'rcarriga/nvim-dap-ui', -- UI
      -- 'theHamsta/nvim-dap-virtual-text', -- Virtual text
    }
  }

  -- VIM SCRIPT

  -- Startuptime
  -- use { 'dstein64/vim-startuptime' }

  -- NOT IN USE

  -- CMP [Ultisnips]
  -- use { 'hrsh7th/nvim-cmp',
  --   requires = { 'quangnguyen30192/cmp-nvim-ultisnips',
  --     config = function()
  --       -- optional call to setup (see customization section)
  --       require('cmp_nvim_ultisnips').setup{}
  --     end,
  --   }
  -- }

  -- Snippets [Ultisnips]
  -- use { 'SirVer/ultisnips', -- Snippet engine
  --   requires = {{ 'honza/vim-snippets', rtp = '.' }}, -- Snippets
  --   config = function()
  --     vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
  --     vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
  --     vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
  --     vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
  --     vim.g.UltiSnipsRemoveSelectModeMappings = 0
  --   end
  -- }

  -- Bootstrap
  -- Set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

end)

