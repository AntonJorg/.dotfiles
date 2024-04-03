-- Go specific configuration

-- Run
vim.keymap.set(
  "n",
  "<leader>p",
  ":!go run *.go<cr>",
  {
    desc = "Run main package"
  }
)

vim.keymap.set(
  "n",
  "<leader>o",
  ":!templ generate<cr>",
  {
    desc = "Generate templ code"
  }
)

-- Options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
