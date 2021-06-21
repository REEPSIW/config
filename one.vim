" =============================================================================
" Filename: autoload/lightline/colorscheme/one.vim
" Author: Zoltan Dalmadi
" License: MIT License
" Last Change: 2019/09/09 22:42:48.
" =============================================================================

" Common colors
let s:blue   = [ '#61afef', 33 ]
let s:green  = [ '#98c379', 76 ]
let s:purple = [ '#c678dd', 127 ]
let s:red1   = [ '#e06c75', 196 ]
let s:red2   = [ '#be5046', 196 ]
let s:yellow = [ '#e5c07b', 180 ]
let s:cyan   = [ '#61afef', 35 ]
let s:white  = [ '#FFFFFF', 255 ]
let s:black  = [ '#000000', 16 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if lightline#colorscheme#background() ==# 'light'
  " Light variant
  let s:fg    = [ '#494b53', 255 ]
  let s:bg    = [ '#fafafa', 255 ]
  let s:gray1 = [ '#494b53', 238 ]
  let s:gray2 = [ '#f0f0f0', 255 ]
  let s:gray3 = [ '#d0d0d0', 250 ]
  let s:green = [ '#98c379', 34 ]

  let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
  let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:bg, s:gray3 ] ]
else
  " Dark variant
  let s:fg    = [ '#abb2bf', 145 ]
  let s:bg    = [ '#282c34', 232 ]
  let s:gray1 = [ '#5c6370', 241 ]
  let s:gray2 = [ '#2c323d', 235 ]
  let s:gray3 = [ '#3e4452', 236 ]

  let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
  let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:gray1, s:bg ] ]
endif

" Common
let s:p.normal.left    = [ [ s:black, s:green, 'bold' ], [ s:white, s:gray2 ] ]
let s:p.normal.middle  = [ [ s:white, s:gray3 ] ]
let s:p.normal.right   = [ [ s:black, s:green, 'bold' ], [ s:black, s:gray1,'bold' ] ]
let s:p.normal.error   = [ [ s:red2, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:black, s:gray1, 'bold' ] ]
let s:p.insert.left    = [ [ s:bg, s:blue, 'bold' ], [ s:white, s:gray2 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.left   = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.left    = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:cyan, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = [ [ s:gray2, s:gray2 ], [ s:gray2, s:bg ] ]

let g:lightline#colorscheme#one#palette = lightline#colorscheme#flatten(s:p)
