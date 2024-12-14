-- C++ specific configuration

-- Compile
vim.keymap.set("n", "<leader>p", ":!make && chmod a+x main && ./main<cr>", { desc = "Compile + run main.cpp" })

-- Options
vim.o.shiftwidth = 2
vim.o.tabstop = 2
