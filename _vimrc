" Vim with all enhancements
" ЧТОБЫ ИЗМЕНИТЬ ЦВЕТА СКОБОК, ЗАЙТИ В RAINBOW_MAIN.VIM
" Otherwise use the special 'diffexpr' for Windows.
" Add highlighting for function definition in C++
autocmd ColorScheme molokai hi StartifyHeader ctermfg=035 ctermbg=NONE cterm=italic
autocmd ColorScheme molokai hi BookmarkSign   ctermfg=051 ctermbg=black
autocmd ColorScheme molokai hi CocErrorSign   ctermfg=196 ctermbg=black cterm=bold
autocmd ColorScheme molokai hi CocWarningSign ctermfg=190 ctermbg=black cterm=bold
" autocmd ColorScheme molokai hi cCustomClass ctermfg=011
" MAPPINGS

" Tagbar
nmap <F6> :TagbarToggle<CR>
" ===============================================================================
" NERDTree
map <C-b> :NERDTreeToggle<CR>
" ===============================================================================
" Vim-Move
vmap <C-Up> <Plug>MoveBlockUp
vmap <C-Down> <Plug>MoveBlockDown
nmap <C-Up> <Plug>MoveLineUp
nmap <C-Down> <Plug>MoveLineDown
" ===============================================================================
" Coc-nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
" ===============================================================================
" Build and run a single C++ file
map <F8> :!clear <CR> :w <CR> :!g++ % -o %:r && ./%:r<CR> 
" ===============================================================================
" Build and run a C++ project
map <F9> :!clear <CR> :wa <CR> :!make && :!make run<CR>
" ===============================================================================
" Run a single C++ file
map <F5> :!clear <CR> :w <CR> :!./%:r<CR>
" ===============================================================================
" Folding
map <C-f> za <CR> 
" ===============================================================================
" Buffers
nnoremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
" ===============================================================================





" SET something

set autoindent
" Show spaces
set listchars=tab:>·,trail:·,extends:>,precedes:<,space:·
" Show line numbers
set number
" Don't highlight cursor etc.
set nocursorline
set nocursorcolumn
" Commands autocomplete
set wildmenu
set incsearch
" For normal C++ switch indent 
set cinoptions+=l1
set cindent
" Highlight search results
set hlsearch
" Ignore case in search
set ignorecase
" Highlight white spaces (use both with listchars)
set list 
" Save undos after file closes
set undofile
" Don't wrap lines
set nowrap
" Highlight matching braces
set showmatch
" I don't know what does it mean
set iskeyword=@,48-57,_,192-255
" Required for normal backspace work
set backspace=indent,eol,start

set fileencoding=utf-8
set encoding=UTF-8

set scrolloff=999
set guifont=Consolas:h14
" Best folding
set foldmethod=syntax
set foldlevel=999

if !exists('g:syntax_on')
    syntax enable
endif
:hi Space ctermfg=darkgrey
"disable syntax highlighting inside a comments
:let c_comment_strings = 1 
:unlet c_comment_strings

filetype off
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:NERDTreeShowHidden=1
filetype plugin indent on
hi Folded term=NONE cterm=NONE
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim'
Plug 'matze/vim-move'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'jszakmeister/vim-togglecursor'
Plug 'Krasjet/auto.pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jrudess/vim-foldtext'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'rhysd/vim-clang-format'
Plug 'josa42/vim-lightline-coc'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
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
let g:startify_session_delete_buffers=0
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

:match Space / /
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
set laststatus=2
set noshowmode
"autocmd vimenter * NERDTree
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
let g:ophigh_color = 070
" Cpp modern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

" cpp-enchanced
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"============================================================================================================================

let g:coc_disable_startup_warning = 1

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
command Rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
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


