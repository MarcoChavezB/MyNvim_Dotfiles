-- Set leader key to space
vim.g.mapleader = " "

-- Alias for setting keymaps
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Keybindings

-- Window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false }) -- Move to the left window
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false }) -- Move to the lower window
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false }) -- Move to the upper window
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false }) -- Move to the right window

-- BufferLine navigation
map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true }) -- Next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true }) -- Previous buffer

-- Indenting in visual mode
map("v", "<", "<gv", { noremap = true, silent = false }) -- Decrease indent
map("v", ">", ">gv", { noremap = true, silent = false }) -- Increase indent

-- Copy-pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false }) -- Copy to system clipboard
map("n", "<C-s>", '"+P', { noremap = true, silent = false }) -- Paste from system clipboard

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
map("n", "<C-e>", ":NvimTreeToggle<cr>", { noremap = true, silent = true }) -- Toggle NvimTree
map("n", "<C-d>", ":NvimTreeClose<cr>", { noremap = true, silent = true }) -- Close NvimTree

-- Telescope
map("n", "<C-tab>", '<cmd>lua require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })<CR>', { noremap = true, silent = true }) -- Find files
map("n", "<C-'>", ":Telescope live_grep<cr>", { noremap = true, silent = true }) -- Live grep
map("n", "<C-¡>", ":Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true }) -- Fuzzy find in buffer
map("n", "<C-p>", ":Telescope buffers<CR>", { noremap = true, silent = true }) -- Open buffers list
map("n", "<C-S-p>", ":Bonly<CR>", { noremap = true, silent = true }) -- Close all buffers except current

-- Text selection
map("n", "<C>s", "v$", { noremap = true, silent = true }) -- Select to end of line

-- Window splitting
map("n", "<C-w>\\", ":vsplit<cr>", { noremap = true, silent = true }) -- Vertical split
map("n", "<C-w>-", ":split<cr>", { noremap = true, silent = true }) -- Horizontal split

-- Terminal
map("n", "<C-t>", ":ToggleTerm<cr>", { noremap = true, silent = true }) -- Toggle terminal

-- File tree resizing
map("n", "<C-9>", ":vertical resize +2<cr>", { noremap = true, silent = true }) -- Increase width
map("n", "<C-8>", ":vertical resize -2<cr>", { noremap = true, silent = true }) -- Decrease width

-- File tree focus
map("n", "<C-l>", ":NvimTreeFocus<cr>", { noremap = true, silent = true }) -- Focus NvimTree
map("n", "<C-ñ>", ":wincmd w<cr>", { noremap = true, silent = true }) -- Switch between windows

-- Tabs
map("n", "<C-c>", ":tabclose<cr>", { noremap = true, silent = true }) -- Close tab

-- Goto-preview
map("n", "<C-A-CR>", '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', { noremap = true, silent = true }) -- Preview definition
map("n", "<Esc>", '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true, silent = true }) -- Close all previews
map("n", "C-S-CR", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true }) -- List references

-- Delete workspace
map("n", "<C-x>", "dd", { noremap = true, silent = true }) -- Delete current line
map("n", "<C-BS>", "db", { noremap = true, silent = true }) -- Delete word before cursor

-- Text selection with Ctrl+Shift+Arrow keys
map("n", "<C-S-Right>", "ve", { noremap = true, silent = true }) -- Select to end of word
map("n", "<C-S-Left>", "vb", { noremap = true, silent = true }) -- Select to beginning of word
map("n", "<C-S-Up>", "vk", { noremap = true, silent = true }) -- Select previous line
map("n", "<C-S-Down>", "vj", { noremap = true, silent = true }) -- Select next line

-- Text deletion
map("v", "<C-x>", '"+d', default_opts) -- Cut to system clipboard

-- Text copying
map("v", "<C-c>", '"+y', default_opts) -- Copy to system clipboard
map("n", "<C-Del>", "dd", default_opts) -- Delete current line
map('n', '<C-a>', 'ggVG', default_opts) -- Select all text

-- Movimientos entre ventanas divididas
map("n", "<C-w><Right>", "<C-w>l", { noremap = true, silent = true }) -- Mover a la ventana derecha
map("n", "<C-w><Down>", "<C-w>j", { noremap = true, silent = true }) -- Mover a la ventana inferior
map("n", "<C-w><Up>", "<C-w>k", { noremap = true, silent = true }) -- Mover a la ventana superior
map("n", "<C-w><Left>", "<C-w>h", { noremap = true, silent = true }) -- Mover a la ventana izquierda

-- Mover la selección hacia abajo
map("v", "S", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Mover la selección hacia abajo
-- Mover la selección hacia arriba
map("v", "W", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Mover la selección hacia arriba

