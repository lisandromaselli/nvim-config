local plugins = {
  {
    "williamboman/mason.nvim",
    ops = {
      ensure_installed = {
        "gopls",
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
      "jose-elias-alvarez/null-ls.nvim",
      ft = "go",
      opts = function ()
        return require "custom.configs.null-ls"
      end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {"node_modules",".git"},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go","gomod" },
      hightlight = {
        additional_vim_regex_highlighting = false,
      },
    }
  },
}
return plugins
