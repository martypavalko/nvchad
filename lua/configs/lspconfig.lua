require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "yamlls", "ansiblels", "helm_ls" }

vim.lsp.config.ansiblels = {
  filetypes = { "yaml.ansible", "ansible" },
  cmd = { "ansible-language-server", "--stdio" },
  root_markers = { "ansible.cfg", ".ansible-lint" },
  settings = {
    ansible = {
      python = {
        interpreterPath = "python3"
      },
      ansible = {
        path = "ansible"
      },
      executionEnvironment = {
        enabled = false
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
        }
      }
    }
  }
}

vim.lsp.config.helm_ls = {
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
  root_markers = { "Chart.yaml" },
  settings = {
    ['helm-ls'] = {
      yamlls = {
        enabled = true,
        diagnosticsLimit = 50,
        showDiagnosticsDirectly = false,
        path = "yaml-language-server",
      }
    }
  }
}

vim.lsp.config.yamlls = {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "templates/*.yaml",
      },
      validate = true,
      hover = true,
      completion = true,
    }
  }
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
