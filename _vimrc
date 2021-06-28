" Vim with all enhancements
" ЧТОБЫ ИЗМЕНИТЬ ЦВЕТА СКОБОК, ЗАЙТИ В RAINBOW_MAIN.VIM
" Otherwise use the special 'diffexpr' for Windows.
" Add highlighting for function definition in C++
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
autocmd ColorScheme molokai hi StartifyHeader ctermfg=035 ctermbg=NONE cterm=italic
autocmd ColorScheme molokai hi BookmarkSign   ctermfg=051 ctermbg=black
autocmd ColorScheme molokai hi CocErrorSign   ctermfg=196 ctermbg=black cterm=bold
autocmd ColorScheme molokai hi CocWarningSign ctermfg=190 ctermbg=black cterm=bold
autocmd ColorScheme molokai hi cCustomFunc  ctermfg=011
autocmd ColorScheme molokai hi cCustomClass ctermfg=011
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

"disable syntax highlighting inside a comments
:let c_comment_strings = 1 
:unlet c_comment_strings

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
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:NERDTreeShowHidden=1
filetype plugin indent on
set conceallevel=3
set foldmethod=syntax
set foldlevel=999
hi Folded term=NONE cterm=NONE
nmap <F6> :TagbarToggle<CR>
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
Plug 'bfrg/vim-cpp-modern'
Plug 'ryanoasis/vim-devicons'
Plug 'jszakmeister/vim-togglecursor'
Plug 'Krasjet/auto.pairs'
Plug 'hallzy/lightline-onedark'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jrudess/vim-foldtext'
Plug 'mileszs/ack.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'rhysd/vim-clang-format'
Plug 'josa42/vim-lightline-coc'
Plug 'majutsushi/tagbar'
Plug 'soramugi/auto-ctags.vim'
call plug#end()
let g:startify_custom_header = [
\ '                                                                                   ',
\ '                                                                                   ',
\ '                                                                                   ',
\ '                                                                                   ',
\ '                                                                                   ',
\ '                                                    ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ',
\ '                                                    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
\ '                                                          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
\ '                                                           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
\ '                                                          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
\ '                                                   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
\ '                                                  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
\ '                                                 ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
\ '                                                 ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
\ '                                                      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
\ '                                                       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
\ '                                                         ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋       ',
\]
let g:startify_bookmarks = [
\ '~/_vimrc'
\]
let g:lightline#ale#indicator_ok = "\uf00c"
let g:startify_lists = [
    \ { 'type': 'sessions', 'header': startify#center(['Sessions']) },
    \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']) },
    \ { 'type': 'files', 'header': startify#center(['Files']) },
    \ { 'type': 'commands',  'header': startify#center(['Commands']) },
    \ ]
" let g:startify_padding_left = 
let g:startify_session_autoload = 1
let g:lightline#ale#indicator_ok = "\uf00c"
let g:startify_enable_special = 0
let g:tagbar_show_tag_linenumbers=2
autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
colorscheme molokai
highlight ALEError ctermbg=005
highlight ALEErrorSign ctermbg=black ctermfg=196
highlight ALEWarningSign ctermbg=black ctermfg=190
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '✔️'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~-'
let g:clang_library_path='/usr/lib/llvm-9/lib/clang/9.0.0/lib/linux'

set scrolloff=999
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
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'gitbranch', 'filename'], ['tagbar' ] ],
      \   'right': [ [ 'linenum','cocinfo', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
      \   [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'linenum': 'GetLineNum',
      \ },
      \ 'component': {
      \   'tagbar':  '%{tagbar#currenttag("%s", "", "f")}'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \
      \ 'subseparator': { 'left': '', 'right': '' },
      \
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_info': 'info',
      \   'linter_hints': 'hints',
      \   'linter_ok': 'left',
      \   'buffers': 'tabsel',
      \ }
      \ }
call lightline#coc#register()
let g:clang_format#style_options = {
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \ "AlignAfterOpenBracket" : "Align",
            \ "AlwaysBreakBeforeMultilineStrings " : "false",
            \ "BreakBeforeBraces" : "Allman"}
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
nnoremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
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
let g:auto_ctags = 1
set showtabline=2
:set guicursor+=a:blinkon0
autocmd FileType apache setlocal commentstring=#\ %s
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
let g:cpp_attributes_highlight = 1
let g:coc_disable_startup_warning = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
"============================================================================================================================
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
