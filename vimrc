"-------------------------------------------------------------------------------
"
" Filename:     vimrc
" Description:  VIM/GVIM user setup file. Should be renamed to .vimrc and saved
"               as in ~/.vimrc. Simlinks can be used.
"
"-------------------------------------------------------------------------------

"----- Show line number and setting to toggle it
"      when hitting CTRL-N twice.
set number
nmap <c-n><c-n> :set number!<CR>

"----- Set indentation 
set autoindent
set smartindent
filetype indent on

"----- Colors
" Tried at several modern terminals and t_Co was set to 256.
" In case of need, uncomment.
"set t_Co=256
colorscheme lucius
LuciusDarkHighContrast

if has('gui_running')
  "----- GUI setup
  set lines=68 columns=100
  if has("win32")
    set guifont=Lucida_Console:h10:cDEFAULT
  endif
else

  "----- CLI setup
  set mouse=a
  set ttymouse=sgr
endif

"--- Status line
set showmode
set showcmd
set ruler

"----- Search setup
set incsearch
set ignorecase
set hlsearch

"----- Backspace
set backspace=indent,eol,start

" TAB to show buffers in normal mode
nmap <TAB> :ls<CR>

"----- Set wildmenu for options
set wildmenu

"----- Setting completion for CTRL-N and the keywords dictionary
set complete=.  "this file
set complete+=w "other windows
set complete+=k "dictionary
set complete+=t "tags

"----- Filetype specific options
" Sets Tab length because of Python
" Sets dictionaries
"
"----- Function to set Tab to be replaced by spaces of given length
function Set_tab(tab_len)
  set expandtab
  set nosmarttab
  execute "set softtabstop=".a:tab_len
  execute "set shiftwidth=".a:tab_len
endfunction

function Set_filetype()
  if &filetype=="vhdl"
    call Set_tab(2)
    setlocal dictionary=$HOME/vimenv/dict/vhdl_keywords

  elseif &filetype=="verilog"
    call Set_tab(2)
    setlocal dictionary=$HOME/vimenv/dict/verilog_keywords

  elseif &filetype=="python"
    call Set_tab(4)
    setlocal dictionary=$HOME/vimenv/dict/python_keywords,
                       \$HOME/vimenv/dict/python_exceptions

  else
    call Set_tab(2)
    setlocal dictionary=""
  endif
endfunction

autocmd Filetype * :call Set_filetype()

"----- Syntax
syntax on

"----- Just an example of syntax highlight
syntax match patt_abc "abc"
highlight patt_abc guibg=yellow

"--- Additional syntax highlight 
" TODO: The highlight for tabs and trailing white space does not work for comments,
" because the comment pattern takes more chars than tab. See :h syn-arguments
function Usr_Highlight ()
  syntax match tabs "\t\+"
  highlight tabs guibg=#202020 ctermbg=darkgray

  syntax match trailing_space " \+$"
  highlight trailing_space guibg=#202020 ctermbg=darkgray
endfunction

"autocmd Syntax *.vhd,*.v,*.p[lm],*.vim,.vimrc,*.log :call Usr_Highlight()
"TODO: Fix this for various file types only
autocmd Syntax * :call Usr_Highlight()

"----- For vim-orgmode plugin operation for some reason
" detection, plugin, indent need to be ON.
filetype plugin indent on

"----- UltiSnip config
let g:UltiSnipsSnippetDirectories=[$HOME.'/vimenv/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" File reviewed and updated Apr 8 2020.
"------------------------------------------------------------------------------
