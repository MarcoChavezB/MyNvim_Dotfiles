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
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		-- rust_analyzer
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			-- Server-specific settings. See :help lspconfig-setup
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

    -- C++ lsp
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",  -- Mantener esta línea
        "--background-index",        -- Habilita indexación en segundo plano
        "--clang-tidy",              -- Habilita clang-tidy para diagnósticos adicionales
        "--completion-style=detailed", -- Ofrece detalles adicionales en autocompletado
        "--header-insertion=iwyu",   -- Inserción automática de cabeceras (Incluir lo que se usa)
        "--cross-file-rename",       -- Soporte para renombrar entre archivos
      },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    })
    vim.cmd([[autocmd BufWritePre *.cpp,*.h lua vim.lsp.buf.format()]])

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

