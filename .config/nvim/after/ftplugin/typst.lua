-- Generate Go code on save
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local output = vim.fn.system { 'typst', 'compile', vim.fn.bufname() }
  end
})

-- Options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
