local status, lsp_config = pcall(require, "lspconfig")
if (not status) then return end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local sign = function (opts)
    vim.fn.sign_define(opts.name, {
	texth1 = opts.name,
	text = opts.text,
	numh1 = ''
    })
end


sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })


vim.diagnostic.config({
    virtual_text = true, -- show diagnostic message using virtual text
    severity_sort = true, -- order diagnostic by severity<surowość>
    signs = true, -- show a sing next to the line with a diagnostic
    update_in_insert = true, -- update diagnostic while editing in insert mode
    underline = true, -- use an underline to show a diagnostic location
    float = true, -- show diagnostic messages in floating windows
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)


local on_attach = function (client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- here keymaps will go
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_config.pyright.setup{
    on_attach=on_attach,
    capabilities=capabilities,
    settings = {
	python = {}
    }

}

lsp_config.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

lsp_config.sumneko_lua.setup{
    capabilities,
    on_attach=on_attach
}

lsp_config.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
