require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Single mode mapping
map("n", "<leader>ff", "<cmd> Telescope <cr>", { desc = "Open Telescope" })

-- Multiple mode mapping
map({ "i", "n" }, "<C-k>", "<Up>", { desc = "Move up" })
map({ "i", "n" }, "<C-j>", "<Down>", { desc = "Move down" })

-- Mapping with a Lua function
map("n", "<A-i>", function()
  -- do something
end, { desc = "Toggle terminal floating" })

-- Disable mappings
nomap("i", "<C-k>")
nomap("n", "<C-k>")

-- Other mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { noremap = true, desc = "Exit insert mode" })

-- Move lines up and down in normal mode
map("n", "<S-Up>", ":<C-u>silent! move-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
map("n", "<S-Down>", ":<C-u>silent! move+<CR>==", { noremap = true, silent = true, desc = "Move line down" })

-- Move lines up and down in visual mode
map("x", "<S-Up>", ":<C-u>silent! '<,'>move-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })
map("x", "<S-Down>", ":<C-u>silent! '<,'>move'>+<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })

-- Select all in normal mode
map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Keybinding for F5 to save and execute the current file in normal mode
map("n", "<F5>", ":w<CR>:! %:p<CR>", { noremap = true, silent = true, desc = "Save and execute current file" })

-- Comments //
map("n", "//", "gcc", { desc = "Toggle Comment" })
map("v", "//", "gc", { desc = "Toggle comment" })

-- Autocommand to set F5 key mapping for PHP files
vim.cmd [[
  augroup php_f5_eval
    autocmd!
    autocmd FileType php nnoremap <buffer> <F5> :w<CR>:!wp eval-file %<CR>
  augroup END
]]

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { noremap = true, silent = true, desc = "Save file" })
