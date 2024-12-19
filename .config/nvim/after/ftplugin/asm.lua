-- Assembly specific configuration

-- Compile
vim.keymap.set("n", "<leader>p", ":!make && chmod a+x main && ./main<cr>", { desc = "Compile + run main.asm" })

-- Options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
