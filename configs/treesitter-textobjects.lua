local M = {}

M.config = function()
  require("nvim-treesitter.configs").setup {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },
      delete = {
        enable = true,
        keymaps = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dif"] = "@function.inner",
        },
      },
    },
  }
end

return M
