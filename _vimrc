call plug#begin()

Plug 'jiangmiao/auto-pairs'
" Plug 'LunarWatcher/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'vimsence/vimsence'
Plug 'preservim/nerdtree'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ap/vim-css-color'
Plug 'madox2/vim-ai'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'github/copilot.vim'

call plug#end()

packloadall

set autoindent smartindent expandtab tabstop=2 shiftwidth=2
set number relativenumber
set shell=\"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe\"
set autochdir
set ruler
set incsearch
set foldmethod=manual
set listchars=eol:$,tab:>-,space:??,trail:~,extends:>,precedes:<
set list

" gui stuff
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L
set guifont=Consolas:h14:cANSI:qDRAFT

filetype indent plugin on
syntax on

colorscheme moonfly
" end gui stuff

" netrw settings
" let g:netrw_keepdir=0
" let g:netrw_winsize=20
" let g:netrw_banner=0
" let g:netrw_liststyle=3

let g:NERDTreeWinSize=40

mapclear

" nnoremap <Leader>i :Lexplore %:p:h<CR>
" nnoremap <Leader>o :Lexplore<CR>

" H: Will "go back" in history.
" h: Will "go up" a directory.
" l: Will open a directory or a file.
" .: Will toggle the dotfiles.
" P: Will close the preview window.
" L: Will open a file and close Netrw.
" Leader dd: Will just close Netrw.

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction

augroup netrw_mapping
  autocmd!
"   autocmd filetype netrw call NetrwMapping()
"   autocmd filetype netrw set winfixwidth
augroup END
" end netrw settings

" vim lsp stuff
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> <leader>i <plug>(lsp-definition)
  nmap <buffer> <leader>d <plug>(lsp-declaration)
  nmap <buffer> <leader>r <plug>(lsp-references)
  nmap <buffer> <leader>l <plug>(lsp-document-diagnostics)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <f3> <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" end vim lsp stuff

cd $REPOS

nnoremap <leader><Space> :set list!<CR>
nnoremap <Esc> :up<CR>
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap <Space> za
tnoremap q :q!

tnoremap <Left> gT
tnoremap <Right> gt
" noremap <Leader>q :bp<Bar>sp<Bar>BN<Bar>bd<CR>

augroup Startup
    autocmd!
    autocmd GUIEnter * simalt ~x
    autocmd VimEnter *
    \ NERDTree $REPOS |
    \ tabnew +terminal++curwin |
    \ execute 'vertical terminal' |
    \ set winfixwidth |
    \ tabnew $VIMRC |
    \ tabfirst |
    \ normal 2w
augroup END
