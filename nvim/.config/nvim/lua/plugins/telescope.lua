return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({hidden = true})
      end, { desc = 'Buscar archivos (incluye ocultos)' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
       extensions = {
         ["ui-select"] = {
           require("telescope.themes").get_dropdown {
           }
         }
       }
     })
     require("telescope").load_extension("ui-select")
   end
  },
}
