local autocmd = vim.api.nvim_create_autocmd

-- Detect Ansible files
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/playbooks/*.yml",
    "*/playbooks/*.yaml",
    "*/ansible/*.yml",
    "*/ansible/*.yaml",
    "*/roles/*/tasks/*.yml",
    "*/roles/*/handlers/*.yml",
    "*/roles/*/vars/*.yml",
    "*/roles/*/defaults/*.yml",
    "*/group_vars/*",
    "*/host_vars/*",
    "site.yml",
    "playbook.yml",
    "local.yml",
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})
