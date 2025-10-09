require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "yamlls", "ansiblels" }

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

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
