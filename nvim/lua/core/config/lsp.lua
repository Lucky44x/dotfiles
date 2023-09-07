require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "pylsp", "lua_ls", "yamlls", "vimls", "cssls", "clangd", "rust_analyzer" },
})

local on_attach = function(_, bufnr)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definitions, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementations, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require('lspconfig').cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require('lspconfig').pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

--require('lspconfig').asm_lsp.setup {
--	on_attach = on_attach,
--	capabilities = capabilities
--}

require('lspconfig').clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

--require('lspconfig').jdtls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities
--}

--require('lspconfig').marksman.setup {
--	on_attach = on_attach,
--	capabilities = capabilities
--}

require('lspconfig').yamlls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require('lspconfig').vimls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
