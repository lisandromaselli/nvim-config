local on_attach = require("plugins.configs.lspconfig").on_attach 
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities=capabilities,
  cmd = {"gopls"},
  filetypes = {"go","gomod","gowork","gotmpl"},
  root_dir = util.root_pattern("go.work","go.mod",".git"),
  settings = {
    gopls = {
      usePlaceholders = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unusedvariable = true,
        nillness = true,
        shadow = true,
        useany = true,
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yml", "yaml", "yaml.docker-compose" },
  settings = {
    format = { enable = true },
    validate = true,
    completion = true,
    hover = true,
    yaml = {
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      schemas = {
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { ".gitlab-ci.yml"},
        kubernetes = "globPattern",
      },
    }
  }
}
