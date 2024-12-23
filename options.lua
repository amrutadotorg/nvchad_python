require "nvchad.options"
-- https://neovim.io/doc/user/provider.html#clipboard-osc52
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lnum = mark[1]
    local col = mark[2]
    if lnum > 0 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { lnum, col })
    end
  end,
})
