-- Golang specific configuration

-- Run all Go files
vim.keymap.set("n", "<leader>p", ":!go run *.go<cr>", { desc = "Run Go files" })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
