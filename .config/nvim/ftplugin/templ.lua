vim.cmd.runtime("ftplugin/go.lua")

-- Generate Go code on save
vim.api.nvim_create_autocmd('BufWritePost', {
  command = "!templ generate -f %<CR>"
})
