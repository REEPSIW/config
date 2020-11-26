" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Remap a few keys for Windows behavior
source $VIMRUNTIME/mswin.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
set ai
syntax enable
set background=dark
set listchars=tab:>Ј,trail:Ј,extends:>,precedes:<,space:Ј
:set number
set incsearch
:set hlsearch
:set ignorecase
:set smartcase
set nocompatible
set nowrap
set showmatch
:set iskeyword=@,48-57,_,192-255
set backspace=indent,eol,start
:set history=128 " хранить больше истории команд
:set undolevels=2048 " хранить историю изменений числом N
:set fileencoding=windows-1251
:set guifont=Consolas:h14
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Courier\ New\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Consolas:h13:cDEFAULT
  endif
endif
set nocompatible
filetype off
se list
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neocomplcache.vim'
Plug 'Raimondi/delimitMate'
Plug 'aisapatino/hex-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'matze/vim-move'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:startify_bookmarks = [
            \ { 'vimrc': 'C:\Vim\_vimrc' },
            \ ]
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
call plug#end()

let g:move_key_modifier = 'C'
vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <C-Up> <Plug>MoveLineUp
nmap <C-Down> <Plug>MoveLineDown
set laststatus=128
set noshowmode
colorscheme molokai
"autocmd vimenter * NERDTree
map <C-b> :NERDTreeToggle<CR>
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 1
map <C-d> :<Esc>zf<CR>
map <C-/> :<Esc>gc<CR>
autocmd FileType apache setlocal commentstring=#\ %s
set langmap=‘»—¬”јѕ–ЎќЋƒ№“ў«… џ≈√ћ÷„Ќя;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчн€;abcdefghijklmnopqrstuvwxyz
let g:neocomplcache_enable_at_startup = 1
let delimitMate_expand_cr = 1
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
:highlight Normal ctermfg=grey ctermbg=black
hi clear CursorLine
highlight CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=#292424 guifg=NONE
set mouse=a
set cursorline
":h delimitMate_expand_cr
":h delimitMateExpansion
"set t_Co=256
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#4f4646   ctermbg=7
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#4f4646   ctermbg=7
:hi Space guifg=#4f4646
:match Space / /
highlight Cursor guibg=red
highlight iCursor guibg=red

set guicursor+=n-v-c:blinkon0


