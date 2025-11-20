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

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/templates/*.yaml",
    "*/templates/*.tpl",
    "*/templates/_*.yaml",
    "*/templates/_*.tpl",
    "*/templates/NOTES.txt",
  },
  callback = function()
    local path = vim.fn.expand("%:p")
    -- Check if we're in a Helm chart (Chart.yaml exists in parent dirs)
    if vim.fn.findfile("Chart.yaml", vim.fn.expand("%:p:h") .. ";") ~= "" then
      vim.bo.filetype = "helm"
    end
  end,
})

-- Also detect by Chart.yaml proximity
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/charts/*/templates/*",
  callback = function()
    vim.bo.filetype = "helm"
  end,
})
