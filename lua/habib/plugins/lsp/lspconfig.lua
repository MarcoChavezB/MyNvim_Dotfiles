return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = "!", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Auto Formatting
		--		vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

		--LspInfo Borders
		lspui.default_options.border = "double"

		-- Managing language servers individually
		-- pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- tsserver
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		-- rust_analyzer
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})

		-- clangd
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- html
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- configure emmet language server
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- Lua LS
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

    -- Angular LS
lspconfig.angularls.setup({
    cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations", vim.fn.getcwd() .. "/node_modules/@angular" },
    on_new_config = function(new_config)
        new_config.cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations", vim.fn.getcwd() .. "/node_modules/@angular" }
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    root_dir = lspconfig.util.root_pattern("angular.json", ".git"),
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if client.server_capabilities then
            client.server_capabilities.document_formatting = false
        else
            print("Advertencia: Las capacidades del cliente LSP no están disponibles.")
        end
    end,
})
		-- CSS LS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- Tailwind
		-- Support for tailwind auto completion
		-- install the tailwind server : "sudo npm install -g @tailwindcss/language-server"
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
	end,
}
