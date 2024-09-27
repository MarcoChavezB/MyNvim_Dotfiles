return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lspconfig = require("lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "double",
				width = 0.8,
				height = 0.8,
			},
		})

		-- mason-lspconfig
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"cssls",
				"marksman",
				"ts_ls",
        "angularls",
			},
			automatic_installation = true,
		})

		-- mason-tool-installer
		mason_tool_installer.setup({
			ensure_installed = {
				{ "bash-language-server" },
				{ "lua-language-server" },
				{ "vim-language-server" },
				{ "stylua" },
				{ "editorconfig-checker" },
				{ "html-lsp" },
				{ "emmet-ls" },
				{ "css-lsp" },
				{ "pyright" },
				{ "black" },
				{ "autopep8" },
				{ "json-lsp" },
				{ "prettier" },
				{ "typescript-language-server" },
				{ "js-debug-adapter" },
				{ "node-debug2-adapter" },
				{ "eslint_d" },
				{ "eslint-lsp" },
				{ "codelldb" },
				{ "tailwindcss-language-server" },
				{ "clangd" },
				{ "clang-format" },
				{ "sqls" },
			},

			auto_update = true,
			run_on_start = true,
			start_delay = 3000, -- 3 second delay
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})

		-- Configurar LSPs instalados
		local servers = {
			"lua_ls",
			"cssls",
			"marksman",
			"ts_ls",
			"intelephense",
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				on_attach = function(client, bufnr)
					-- Mapeos personalizados para el buffer actual
					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end
					local function buf_set_option(...)
						vim.api.nvim_buf_set_option(bufnr, ...)
					end

					buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Mapeos para LSP
					local opts = { noremap = true, silent = true }

					buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
					buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
					buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
					buf_set_keymap("n", "<space>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
					buf_set_keymap("n", "<space>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
					buf_set_keymap(
						"n",
						"<space>wl",
						"<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
						opts
					)
					buf_set_keymap("n", "<space>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
					buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
					buf_set_keymap("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
					buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
					buf_set_keymap("n", "<space>e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
					buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
					buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
					buf_set_keymap("n", "<space>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
					buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
				end,

				flags = {
					debounce_text_changes = 150,
				},
			})
		end
	end,
}
