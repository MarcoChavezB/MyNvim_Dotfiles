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

    lspconfig.intelephense.setup({
      settings = {
        intelephense = {
          environment = {
            phpVersion = "8.3",
          },
        },
      },
    })

		local signs = { Error = " ", Warn = "!", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end


    -- Flutter
    lspconfig.dartls.setup({
      on_attach = function(client, bufnr)
        -- Aquí puedes agregar configuraciones adicionales al LSP si es necesario
      end,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    -- Csharp
      lspconfig.omnisharp.setup {
        cmd = { "omnisharp" }, -- mason se encarga de instalarlo
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
      }



   lspconfig.astro.setup({
      capabilities = capabilities,
      filetypes = { "astro" },
      root_dir = lspconfig.util.root_pattern("package.json", ".git"),
    })

    -- Kotlin Language Server
    require'lspconfig'.kotlin_language_server.setup{
      cmd = { "kotlin-language-server" },
      filetypes = { "kotlin" },
      root_dir = require'lspconfig'.util.root_pattern("build.gradle", "settings.gradle", ".git"),
      settings = {
        kotlin = {
          compiler = {
            arguments = { "-Xjsr305=strict" }
          }
        }
      }
    }
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

		-- html
		lspconfig.html.setup({
			capabilities = capabilities,
		})


    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--background-index",
        "--clang-tidy=false",  -- Desactiva tidy si da problemas
        "--completion-style=detailed",
        "--header-insertion=never",
        "--cross-file-rename",
      },
      init_options = {
        clangdFileStatus = true,
      },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    })

		-- configure emmet language server
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "blade"},
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

