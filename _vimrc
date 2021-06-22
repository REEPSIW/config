" Vim with all enhancements
" ЧТОБЫ ИЗМЕНИТЬ ЦВЕТА СКОБОК, ЗАЙТИ В RAINBOW_MAIN.VIM
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
autocmd ColorScheme molokai hi StartifyHeader ctermfg=035 ctermbg=NONE cterm=italic
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
if !exists('g:syntax_on')
    syntax enable
endif
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
set listchars=tab:>·,trail:·,extends:>,precedes:<,space:·
set number
:hi Space ctermfg=darkgrey
if has('gui_running')
  set guioptions-=e
endif
set nocursorline
set nocursorcolumn
set norelativenumber
set wildmenu
set incsearch
set cino+=m1
:set hlsearch
:set ignorecase
:set smartcase
set nolist 
set nocompatible
set nowrap
set showmatch
:set iskeyword=@,48-57,_,192-255
set backspace=indent,eol,start
:set history=128 " ������� ������ ������� ������
:set undolevels=2048 " ������� ������� ��������� ������ N
:set fileencoding=utf-8
set encoding=UTF-8
:set guifont=Consolas:h14
set nocompatible
filetype off
se list
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
filetype plugin indent on
set conceallevel=3
set foldmethod=syntax
set foldlevel=999
hi Folded term=NONE cterm=NONE
"build
map <F8> :!clear <CR> :w <CR> :!g++ % -o %:r <CR> 
"build and run 
map <F9> :!clear <CR> :w <CR> :!g++ % -o %:r && ./%:r <CR>
"run
map <F5> :!clear <CR> :w <CR> :!./%:r
"folding
map <C-f> za <CR> 
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim'
Plug 'matze/vim-move'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bfrg/vim-cpp-modern'
Plug 'ryanoasis/vim-devicons'
Plug 'jszakmeister/vim-togglecursor'
Plug 'jiangmiao/auto-pairs'
Plug 'hallzy/lightline-onedark'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'dense-analysis/ale'
Plug 'jrudess/vim-foldtext'
Plug 'maximbaz/lightline-ale'
call plug#end()
let g:startify_custom_header = [
\ '                                            ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
\ '                                             ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
\ '                                                   ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
\ '                                                    ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
\ '                                                   ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
\ '                                            ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
\ '                                           ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
\ '                                          ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
\ '                                          ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
\ '                                               ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
\ '                                                ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
\ '                                                  ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋      ',
\]
colorscheme molokai
highlight ALEError ctermbg=057
highlight ALEErrorSign ctermfg=196 ctermbg=235
highlight ALEWarningSign ctermfg=190 ctermbg=238
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '✔️'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '🔧➖'
set scrolloff=999
let g:AutoPairsFlyMode = 1
" :set viminfo^=%
:match Space / /
vmap <C-Down> <Plug>MoveBlockDown
vmap <C-Up> <Plug>MoveBlockUp
nmap <C-Down> <Plug>MoveLineDown
nmap <C-Up> <Plug>MoveLineUp
let g:move_key_modifier = 'C'
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
function! GetLineNum()
  let i = line('$')
  return i
endfunction
let g:lightline#bufferline#unicode_symbols = 1
command GetLineNum :call GetLineNum()
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'gitbranch', 'absolutepath' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \              [ 'linenum' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype'] ]
      \ },
      \
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'linenum': 'GetLineNum'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \
      \ 'subseparator': { 'left': '', 'right': '' },
      \
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
nnoremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
set laststatus=2
set noshowmode
:set cindent
"autocmd vimenter * NERDTree
map <C-b> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=20
let NERDTreeHighlightCursorline = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
set showtabline=2
:set guicursor+=a:blinkon0
autocmd FileType apache setlocal commentstring=#\ %s
let delimitMate_expand_cr = 1
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
:highlight Normal ctermfg=white ctermbg=black
let g:coc_start_at_startup = 1
set mouse=a
" if hidden is not set, TextEdit might fail.
set hidden confirm
set switchbuf=useopen
let g:coc_node_path = '/home/mikhail/node10.16/bin/node'
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif
if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
let g:coc_disable_startup_warning = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
"============================================================================================================================
