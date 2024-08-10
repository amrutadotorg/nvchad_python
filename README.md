# install nvim al2
https://gorm.dev/install-neovim-on-amazon-linux-2


# NvChad and Custom Configuration Setup

## clean and backup
```bash
mv ~/.config/nvim ~/.config/nvim_back_$(date +%Y%m%d%H%M%S)
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

## Clone NvChad 2.0 + dreamsofcode
```bash
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone git@github.com:dreamsofcode-io/neovim-python.git ~/.config/nvim/lua/custom
mkdir -p ~/.config/mypy && echo -e "[mypy]\nignore_missing_imports = True" > ~/.config/mypy/config
```
## Clone NvChad newest
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
## custom mappings
```lua
local map = vim.api.nvim_set_keymap

-- Keybindings for commentary
map('n', '//', ':Commentary<CR>', { noremap = true, silent = true, desc = "Toggle commentary in normal mode" })
map('v', '//', ':Commentary<CR>', { noremap = true, silent = true, desc = "Toggle commentary in visual mode" })
map('o', '//', ':Commentary<CR>', { noremap = true, silent = true, desc = "Toggle commentary in operator-pending mode" })

-- Move lines up and down in normal mode
map('n', '<S-Up>', ':<C-u>silent! move-2<CR>==', { noremap = true, silent = true, desc = "Move line up" })
map('n', '<S-Down>', ':<C-u>silent! move+<CR>==', { noremap = true, silent = true, desc = "Move line down" })

-- Move lines up and down in visual mode
map('x', '<S-Up>', ':<C-u>silent! \'<,\'>move-2<CR>gv=gv', { noremap = true, silent = true, desc = "Move selection up" })
map('x', '<S-Down>', ':<C-u>silent! \'<,\'>move\'>+<CR>gv=gv', { noremap = true, silent = true, desc = "Move selection down" })

-- Select all in normal mode
map('n', '<C-a>', 'ggVG', { noremap = true, silent = true, desc = "Select all" })

-- Keybinding for F5 to save and execute the current file in normal mode
map('n', '<F5>', ':w<CR>:! %:p<CR>', { noremap = true, silent = true, desc = "Save and execute current file" })

-- Autocommand to set F5 key mapping for PHP files
vim.cmd([[
  augroup php_f5_eval
    autocmd!
    autocmd FileType php nnoremap <buffer> <F5> :w<CR>:!wp eval-file %<CR>
  augroup END
]])
```
