local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Activa los atajos por defecto (si quieres mantenerlos) y añade los personalizados
  api.config.mappings.default_on_attach(bufnr)

  -- Atajos personalizados:
  vim.keymap.set("n", "l", api.node.open.edit, opts("Abrir archivo o carpeta"))
  vim.keymap.set("n", "h", api.tree.close, opts("Cerrar directorio"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Abrir en división vertical"))
  vim.keymap.set("n", "R", api.tree.reload, opts("Refrescar árbol"))
  vim.keymap.set("n", "a", api.fs.create, opts("Crear archivo o carpeta"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Eliminar archivo o carpeta"))
  vim.keymap.set("n", "r", api.fs.rename, opts("Renombrar archivo o carpeta"))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cortar archivo o carpeta"))
  vim.keymap.set("n", "c", api.fs.copy.node, opts("Copiar archivo o carpeta"))
  vim.keymap.set("n", "p", api.fs.paste, opts("Pegar archivo o carpeta"))
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    name = "nvim-tree",
    config = function()
      require("nvim-tree").setup({
        on_attach = on_attach,
        view = {
          width = 30,
          side = "left",
        },
        filters = {
          dotfiles = false,  -- muestra archivos ocultos
        },
        git = {
          enable = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
      })
      vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  }
}
