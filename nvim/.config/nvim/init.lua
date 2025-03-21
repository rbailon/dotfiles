local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")


-- Configuración de atajos personalizados para bufferline.lua
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Siguiente buffer' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Buffer anterior' })
