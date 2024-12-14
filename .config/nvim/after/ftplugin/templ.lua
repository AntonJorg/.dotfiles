-- Include Golang settings
vim.cmd.runtime("ftplugin/go.lua")

-- Generate Go code on save
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local output = vim.fn.system { 'templ', 'generate', '%' }
  end
})
