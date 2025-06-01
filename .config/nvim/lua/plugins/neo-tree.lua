return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },

  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    close_if_last_window = true,
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_patch)
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    -- fill any relevant options here
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Toggle Neo-tree con <leader>e
    vim.keymap.set('n','<leader>e', function()
      require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    end, { desc = "Toggle Neo-tree" })
  end,
}
