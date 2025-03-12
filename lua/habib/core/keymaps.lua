
-- Set leader key to space
vim.g.mapleader = " "

-- Alias for setting keymaps
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- BufferLine navigation
map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true }) -- Next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true }) -- Previous buffer

-- Indenting in visual mode
map("v", "<", "<gv", { noremap = true, silent = false }) -- Decrease indent
map("v", ">", ">gv", { noremap = true, silent = false }) -- Increase indent

-- Copy-pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false }) -- Copy to system clipboard

-- Remapping Escape key
map("i", "kj", "<Esc>", { noremap = true, silent = false }) -- Exit insert mode
map("n", "kj", "<Esc>", { noremap = true, silent = false }) -- Exit normal mode
map("v", "kj", "<Esc>", { noremap = true, silent = false }) -- Exit visual mode

-- Wrapping lines
map("n", "j", "gj", { noremap = true, silent = true }) -- Move down by screen lines
map("n", "k", "gk", { noremap = true, silent = true }) -- Move up by screen lines

-- Unhighlight search
map("n", "<C-m>", ":nohlsearch<cr>", { noremap = true, silent = true }) -- Clear search highlight

-- NvimTree
map("n", "Q", ":NvimTreeToggle<cr>", { noremap = true, silent = true }) -- Toggle NvimTree
map("n", "<C-d>", ":NvimTreeClose<cr>", { noremap = true, silent = true }) -- Close NvimTree

-- Telescope
map(
	"n",
	'Y',
	'<cmd>lua require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })<CR>',
	{ noremap = true, silent = true }
)


map("n", "<leader>fj", "<cmd>Telescope commands<CR>", { noremap = true, silent = true })

-- Find files
vim.api.nvim_set_keymap(
  "n",
  "O",
  '<cmd>lua require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })<CR>',
  { noremap = true, silent = true }
)
map("n", "I", ":Telescope live_grep<cr>", { noremap = true, silent = true }) -- Busqueda global
map("n", "U", ":Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true }) -- busqueda en el currrent file


map("n", "<C-S-p>", ":Bonly<CR>", { noremap = true, silent = true }) -- Close all buffers except current

-- Text selection
map("n", "<C>s", "v$", { noremap = true, silent = true }) -- Select to end of line

-- Terminal
map("n", "<C-t>", ":ToggleTerm<cr>", { noremap = true, silent = true }) -- Toggle terminal

-- File tree resizing
map("n", "<C-9>", ":vertical resize +2<cr>", { noremap = true, silent = true }) -- Increase width
map("n", "<C-8>", ":vertical resize -2<cr>", { noremap = true, silent = true }) -- Decrease width

-- File tree focus
map("n", "<C-ñ>", ":wincmd w<cr>", { noremap = true, silent = true }) -- Switch between windows

-- Goto-preview
map(
	"n",
	"<C-A-CR>",
	'<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
	{ noremap = true, silent = true }
) -- Preview definition
map("n", "<Esc>", '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true, silent = true }) -- Close all previews

-- Delete workspace
map("n", "<C-x>", "dd", { noremap = true, silent = true }) -- Delete current line
map("n", "<C-BS>", "db", { noremap = true, silent = true }) -- Delete word before cursor


-- Text selection with Ctrl+Shift+Arrow keys
map("n", "<C-S-Right>", "ve", { noremap = true, silent = true }) -- Select to beginning of word
map("n", "<C-S-Left>", "vb", { noremap = true, silent = true }) -- Select to beginning of word
map("n", "<C-S-Up>", "vk", { noremap = true, silent = true }) -- Select previous line
map("n", "<C-S-Down>", "vj", { noremap = true, silent = true }) -- Select next line
-- Text deletion
map("v", "<C-x>", '"+d', default_opts) -- Cut to system clipboard
-- Text copying
map("v", "<C-c>", '"+y', default_opts) -- Copy to system clipboard
--[[ map("n", "<C-Del>", "dd", default_opts) -- Delete current line ]]
map("n", "<C-a>", "ggVG", default_opts) -- Select all text

-- Movimientos entre ventanas divididas
map("n", "<leader>l", "<C-w>l", { noremap = true, silent = true }) -- Mover a la ventana derecha
map("n", "<leader>k", "<C-w>j", { noremap = true, silent = true }) -- Mover a la ventana inferior
map("n", "<leader>j", "<C-w>h", { noremap = true, silent = true }) -- Mover a la ventana izquierda
map("n", "<leader>i", "<C-w>k", { noremap = true, silent = true }) -- Mover a la ventana izquierda

map("n", "<C-d>", "D", default_opts) -- Borrar hasta el final de la linea
-- duplidc line
map('n', '<C-s>', 'yyp', { noremap = true, silent = true })

map('n', '<A-Tab>', ':b#<CR>', { noremap = true, silent = true })
map('n', '<A-z>', 'gg', { noremap = true, silent = true }) -- Principio del archivo
map('n', '<A-x>', 'G', { noremap = true, silent = true }) -- Final del archivo
map('n', '<A-v>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map("n", "<A-ESC>", ":noh<CR>", { noremap = true, silent = true })


map('n', 'M', 'V', { noremap = true, silent = true }) -- seleccionar toda la lina

-- dar tab a el area seleccionada shift + tab
map('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Move selection to up or down with 'Ctrl - alt - Up' or 'Ctrl - alt - Down'
map('v', 'M', ":m '>+1<CR>gv=gv", default_opts)
map('v', 'J', ":m '<-2<CR>gv=gv", default_opts)

-- split window 
map('n', '<C-CR>', ':vsplit<CR>', { noremap = true, silent = true })

-- return to last change
map('n', '<A-º>', '<C-o>', { noremap = true, silent = true })

-- Abre el compilador con Ctrl + 1
vim.api.nvim_set_keymap('n', '<leader>yu', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Ir al final de la línea
map("n", "J", "g_", { noremap = true, silent = true }) -- Ir al final de la línea
-- Ir al principio de la línea
map("n", "H", "0", { noremap = true, silent = true }) -- Ir al principio de la línea

-- Avanzar por palabra hacia atrás
map("n", "<A-q>", "b", { noremap = true, silent = true }) -- Moverse una palabra hacia atrás


-- Keymaps for resizing windows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Mapea <leader>e para mostrar el diagnóstico en una ventana flotante en la posición actual del cursor
vim.api.nvim_set_keymap(
    'n', 
    '<A-j>', 
    '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
    { noremap = true, silent = true }
)



