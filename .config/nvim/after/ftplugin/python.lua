-- Python specific configuration

-- Run current file
vim.keymap.set("n", "<leader>p", ":!python %<cr>", { desc="Run Current File" })

-- Set line limit indicator at 88 chars 
vim.o.colorcolumn = "88"

