" ##############################################################################
" IMPORTANTE: Descargar el gestor de plugins para el correcto funcionamiento
" Para ello ejecutar:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


"  --------------------------------------
"  VARS
"  --------------------------------------
let data_dir = '~/.vim'

"  --------------------------------------
"  Comprobación de plugins e instalación
"  --------------------------------------

" ---- Comandos para Plugins con vim-plug ----
" Este bloque comprueba si vim-plug está instalado antes de intentar usarlo.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ---- Lista de tus plugins ----
" Añade aquí todos los plugins que quieras. Ejemplos:
" Plug 'tpope/vim-fugitive'      " Un plugin para Git
Plug 'tpope/vim-commentary' " Un plugin para poner comentarios
" Plug 'preservim/nerdtree'       " Un explorador de archivos
" Plug 'vim-airline/vim-airline'  " Una barra de estado mejorada

call plug#end()

" ---- CÓDIGO AÑADIDO: Autoinstalación al iniciar Vim ----
" Se ejecuta al abrir Vim, comprueba si faltan plugins y los instala.
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \ | PlugInstall --sync | source $MYVIMRC
  \ | endif

"  --------------------------------------
"  Opciones Básicas y Usabilidad
"  --------------------------------------

set nocompatible              " Deshabilita el modo compatible con vi
filetype plugin indent on     " Habilita la detección de tipo de archivo, plugins y sangría
syntax on                     " Habilita el resaltado de sintaxis

" ---- Apariencia del editor ----
set number                    " Muestra los números de línea
set relativenumber            " Muestra números de línea relativos
set showmatch                 " Muestra el paréntesis, corchete o llave correspondiente
set showcmd                   " Muestra el comando parcial en la última línea
set scrolloff=8               " Mantiene 8 líneas de contexto al desplazarse
set sidescrolloff=15          " Mantiene 15 columnas de contexto al desplazarse
" set colorcolumn=80          " Muestra una columna de referencia en la columna 80

" ---- Sangría y Espacios ----
set autoindent
set smartindent
set tabstop=4                 " Un tab son 4 espacios
set shiftwidth=4              " La sangría automática usa 4 espacios
set expandtab                 " Convierte tabs en espacios

" ---- Comportamiento general ----
set nowrap                    " Evita que las líneas se rompan (envuelvan)
set backspace=indent,eol,start " Permite borrar sobre sangrado, saltos de línea y el inicio
set mouse=a                   " Habilita el uso del ratón en todos los modos
set hidden                    " Permite cambiar de buffer sin guardar
set ignorecase                " Ignora mayúsculas/minúsculas en la búsqueda
set smartcase                 " No ignora mayúsculas si la búsqueda contiene mayúsculas
set incsearch                 " Búsqueda incremental (resalta mientras escribes)
set hlsearch                  " Resalta todas las coincidencias de búsqueda

"  --------------------------------------
"  Configuración de Apariencia
"  --------------------------------------
colorscheme default           " Define el esquema de color

"  --------------------------------------
"  Mapeos de Teclas (Key Mappings)
"  --------------------------------------
let mapleader = ","           " Define la tecla 'leader' como la coma (¡haz esto ANTES de los mapeos!)

" ---- Mapeos personalizados ----
" Deshabilitar resaltado de búsqueda
nnoremap <leader>s :nohlsearch<CR>
" Guardar
nnoremap <leader>w :w<CR>
" Guardar y salir
nnoremap <leader>q :wq<CR>
" Recargar .vimrc
nnoremap <leader>rc :source ~/.vimrc<CR>
" Navegación entre buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>