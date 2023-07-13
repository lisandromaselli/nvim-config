local plugins = {
  {
    "williamboman/mason.nvim",
    ops = {
      ensure_installed = {
        "gopls",
        "yaml-language-server",
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
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
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
