" ---- Opciones Básicas y Usabilidad ----

set nocompatible         " Deshabilita el modo compatible con vi (esencial para muchas características)
filetype plugin indent on " Habilita la detección de tipo de archivo, plugins y sangría inteligente

syntax on                " Habilita el resaltado de sintaxis
set number               " Muestra los números de línea
set relativenumber       " Muestra números de línea relativos (útil para saltos)
                         " Puedes comentar 'set number' si solo quieres relativenumber

set autoindent           " Auto-sangrado al crear nuevas líneas
set smartindent          " Sangrado más inteligente basado en la sintaxis
set tabstop=4            " Número de espacios que representa un tab
set shiftwidth=4         " Número de espacios a usar para cada sangría (<<, >>)
set expandtab            " Convierte tabs en espacios (muy recomendado)

set nowrap               " Evita que las líneas se rompan (envuelvan)
set textwidth=0          " Deshabilita el auto-ajuste de línea
set wrapmargin=0         " Deshabilita el margen de auto-ajuste

set backspace=indent,eol,start " Permite borrar el sangrado, saltos de línea y al inicio de la línea

set mouse=a              " Habilita el uso del ratón en todos los modos (si tienes un terminal compatible)

set hidden               " Permite tener varios buffers abiertos sin guardarlos

set showmatch            " Muestra el paréntesis, corchete o llave correspondiente al escribir
set showcmd              " Muestra el comando parcial en la última línea

set incsearch            " Búsqueda incremental (resalta mientras escribes)
set hlsearch             " Resalta todas las coincidencias de búsqueda
" nnoremap <leader>s :nohlsearch<CR> " Mapeo para deshabilitar el resaltado de búsqueda (presiona ,s)

set ignorecase           " Ignora mayúsculas/minúsculas en la búsqueda
set smartcase            " No ignora mayúsculas/minúsculas si la búsqueda contiene mayúsculas

set scrolloff=8          " Mantiene 8 líneas de contexto al desplazarse
set sidescrolloff=15     " Mantiene 15 columnas de contexto al desplazarse horizontalmente

set colorcolumn=80       " Muestra una columna de referencia en la columna 80 (útil para limitar líneas)

" ---- Configuración de Apariencia ----

colorscheme default      " Define el esquema de color (puedes probar otros como 'desert', 'blue', 'elflord', etc.)
                         " Para instalar más, necesitarías un gestor de plugins o copiarlos manualmente.

set cursorline           " Resalta la línea actual
set cursorcolumn         " Resalta la columna actual (puede ser pesado en terminales lentas, desactívalo si no te gusta)

" ---- Mapeos de Teclas (Key Mappings) ----

let mapleader = ","      " Define la tecla 'leader' como coma (muy útil para mapeos personalizados)

" Mapeo para guardar rápidamente (presiona ,w)
nnoremap <leader>w :w<CR>

" Mapeo para guardar y salir rápidamente (presiona ,q)
nnoremap <leader>q :wq<CR>

" Mapeo para recargar .vimrc (presiona ,rc)
nnoremap <leader>rc :source ~/.vimrc<CR>

" Navegación entre buffers (presiona ,n y ,p)
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" ---- Comandos para Plugins (Ejemplo, si usas Vundle, Plug, etc.) ----
" Si planeas usar plugins (muy recomendado para extender Vim),
" aquí es donde empezarías a configurarlos.
" Por ejemplo, con vim-plug:
" call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-fugitive' " Un plugin para Git
" call plug#end()
" Tendrías que instalar vim-plug primero y luego ejecutar :PlugInstall en Vim.

" ---- Atajos para Comandos de Vim ----
" Abrir archivo en un split horizontal
" nnoremap <leader>s :split<CR>
" Abrir archivo en un split vertical
" nnoremap <leader>v :vsplit<CR>
