vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme gruvbox")

require("uki.options")
require("uki.plugins")
require("uki.cmp")
require("uki.lualine")
require("uki.toggleterm")
require("uki.autopairs")

require("uki.telescope")
require("uki.treesitter")
require("uki.nvimtree")
require("uki.bufferline")

require("uki.lsp.null-ls")
require("uki.lsp.mason")
require("uki.lsp.lspconfig")
