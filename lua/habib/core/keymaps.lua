vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
-- Toggle between tabs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- BufferLine
map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false })
map("n", "<C-s>", '"+P', { noremap = true, silent = false })
-- Remapping Escape key
map("i", "kj", "<Esc>", { noremap = true, silent = false })
map("n", "kj", "<Esc>", { noremap = true, silent = false })
map("v", "kj", "<Esc>", { noremap = true, silent = false })

-- Remapping gj gk for wrapped line
map("n", "j", "gj", { noremap = true, silent = true })
map("n", "k", "gk", { noremap = true, silent = true })
-- Unhighlight searched elements
map("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true })
-- show nvim-tree on ctrl+e
map("n", "<C-e>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
-- hide nvim-tree on ctrl+d
map("n", "<C-d>", ":NvimTreeClose<cr>", { noremap = true, silent = true })

-- show find files on ctrl+tabs
map(
	"n",
	"<C-tab>",
	'<cmd>lua require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })<CR>',
	{ noremap = true, silent = true }
)

-- select text
map("n", "<C>s", "v$", { noremap = true, silent = true })
-- divide window
map("n", "<C-w>\\", ":vsplit<cr>", { noremap = true, silent = true })
-- divide window to bottom
map("n", "<C-w>-", ":split<cr>", { noremap = true, silent = true })

-- open terminal
map("n", "<C-t>", ":ToggleTerm<cr>", { noremap = true, silent = true })

-- seach word in all files
map("n", "<C-'>", ":Telescope live_grep<cr>", { noremap = true, silent = true })

-- open seach in file content
map("n", "<C-¡>", ":Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true })

-- File Tree --

-- rezise file tree (row right, row left)
map("n", "<C-9>", ":vertical resize +2<cr>", { noremap = true, silent = true })
map("n", "<C-8>", ":vertical resize -2<cr>", { noremap = true, silent = true })

-- cursor focus on file tree and the work space
map("n", "<C-l>", ":NvimTreeFocus<cr>", { noremap = true, silent = true })
map("n", "<C-ñ>", ":wincmd w<cr>", { noremap = true, silent = true })

-- tabs --
-- delete tabs
map("n", "<C-c>", ":tabclose<cr>", { noremap = true, silent = true })

-- Mapear teclas para el uso de goto-preview

map(
	"n",
	"<C-A-CR>",
	'<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
	{ noremap = true, silent = true }
)
map("n", "<Esc>", '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true, silent = true })
map("n", "C-S-CR", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
