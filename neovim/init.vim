call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
call plug#end()

lua << EOF
local lspconfig = require('lspconfig')
require 'lspconfig'.clangd.setup{
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false
            }
        ),
  },
}
EOF

let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:livepreview_previewer = 'open -a Preview'

set rtp+=/opt/homebrew/opt/fzf
set backspace=indent,eol,start

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd Filetype tex setl updatetime=1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

syntax enable
colorscheme gruvbox
set number
set showcmd
set relativenumber
set autoindent
set autowrite
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

