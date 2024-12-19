-- Zig specific configuration

-- Build and run project
vim.keymap.set("n", "<leader>p", ":!zig build run <cr>", { desc = "Build and run project" })
