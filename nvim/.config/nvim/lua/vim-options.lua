vim.g.mapleader = " "

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- vim.wo.number = true

-- Habilitar resaltado de sintaxis y auto-indentación según el tipo de archivo
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("filetype plugin on")

local options={
    -- Desactivar compatibilidad con vi
    compatible = false,

    -- Mostrar coincidencias de búsqueda
    showmatch = true,                           -- mostrar coincidencias de búsqueda

    -- Ignorar mayúsculas en búsquedas
    ignorecase = true, 

    -- Habilitar el uso del mouse en modo visual
    mouse = "a",                                

    -- Resaltar resultados de búsqueda
    hlsearch = true,
    incsearch = true,                           -- activa la busqueda incremental

    -- Configuración de tabulación
    tabstop = 2,                                -- espacios por tabulación
    softtabstop = 2,                            -- espacios por tabulación (igora 'tabstop')
    expandtab = false,                           -- inserta espacios en lugar del caracter tabulación
    shiftwidth = 2,                             -- indentanción automática

    -- Mostrar números de línea y otros
    number = true,
    relativenumber = true,                      -- Numeros de linea relativos
    numberwidth = 1,                            -- Espacio columna numeros (default 4)
    cursorline = true,                          -- Resaltar línea actual
    wrap = false,                               -- Sin salto de linea en la visualización

    -- Configuración de autocompletado estilo bash
    wildmode = { "longest", "list" },

    -- Habilitar el portapapeles del sistema
    clipboard = "unnamedplus",

    -- Mejorar velocidad de desplazamiento
    ttyfast = true,

    -- Codificación de los ficheros escritos
    fileencoding = "utf-8",


    -- Opcionales (descomentar si los necesitas)
    -- showmode = false,                           -- Ocultar el modo INSERT, VISUAL, etc..
    showtabline = 2,                            -- Mostrar siempre la linea de pestaña
    splitbelow = true,                          -- Activado: en división de ventanas horizontales nuevas a debajo
    splitright = true,                          -- Activado: en división de ventanas verticales nuevas a la derecha
    smartindent = true,                         -- Activar indentación inteligente
    signcolumn = "yes",                         -- Siempre mostar columna de signos
    scrolloff = 8,                              -- Margen 

    -- colorcolumn = "80",  -- Límite de 80 columnas
    -- spell = true,        -- Corrector ortográfico
    swapfile = false,    -- No crear archivos de intercambio
    -- backupdir = vim.fn.expand("~/.cache/vim"), -- Directorio de backups
    -- backup = false,                            -- crear ficheros de backup
    cmdheight = 2,                              -- espacio de la linea de comandos
    --completeopt = {"menuone", "noselect"},      -- para cmp
    conceallevel = 0,                           -- `` visible en ficheros markdown

}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end







