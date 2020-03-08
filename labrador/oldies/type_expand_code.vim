"-------------------------------------------------------------------------------
"
" Filename:     type_expand_code.vim
" Description:  Complete the typing based on the file type and current
"               context, based on the cursor position in the text.
"
" Initial source was taken from: Damian Conway, Dr
"   Scripting the Vim editor, Part 3: Built-in lists
"   http://www.ibm.com/developerworks/linux/library/l-vim-script-3/index.html 
"   then the code was added and modified.
"
" RCS Id:       $Id: type_expand_code.vim,v 1.3 2010-06-29 14:19:58+02 jpriskin Exp jpriskin $
"
" RCS Revision: $Revision: 1.3 $
"
"-------------------------------------------------------------------------------
"
" TODO:
"
"   - Join back the type_expand_code.vim and type_expand_pat.vim.
"   - Fix the issue to move the cursor on some other position than on the
"     first line (the "f" command in the normal mode does not jump over the
"     next line).
"-------------------------------------------------------------------------------

let g:completions = []
let g:NONE = ""
let g:ANY_LANG = "any_lang"

" Function to add user-defined completions...
function! AddCmpl (lang, left, right, completion)
  call insert(g:completions, [a:lang, a:left, a:right, a:completion])
endfunction

" Simplified version of AddCmpl
function! AddCmplNoLeft (lang, left, completion)
  call insert(g:completions, [a:lang, a:left, g:NONE, a:completion])
endfunction

" Source the pattern file
" TODO: Is there some smarter way to replace the path and use runtime path ?
source ~/.vim/my_vimscripts/type_expand_patt.vim

" Implement smart completion magic...
function! SmartComplete ()
  " Remember where we parked...
  let cursorpos = getpos('.')
  let cursorcol = cursorpos[2]
  let curr_line = getline('.')

  " Special subpattern to match only at cursor position...
  let curr_pos_pat = '\%' . cursorcol . 'c'

  " Tab as usual at the left margin...
  if curr_line =~ '^\s*' . curr_pos_pat
    return "\<TAB>"
  endif

  " How to restore the cursor position...
  let cursor_back = "\<C-O>:call setpos('.'," . string(cursorpos) . ")\<CR>f|x"


  " If a matching smart completion has been specified, use that...
  for [lang, left, right, completion] in g:completions
    let pattern = left . curr_pos_pat . right
    if (((lang == g:ANY_LANG) || (lang == &filetype)) && (curr_line =~ pattern))
      " Code around bug in setpos() when used at EOL...
      if cursorcol == strlen(curr_line)+1 && strlen(completion)==1 
        let cursor_back = "\<LEFT>"
      endif

      " Return the completion...
      return completion . cursor_back
    endif
  endfor

  " If no contextual match and after an identifier, do simple CTRL-N completion...
  if curr_line =~ '\k' . curr_pos_pat
    return "\<C-N>"

  " Otherwise, just be a <TAB>...
  else
    return "\<TAB>"
  endif
endfunction

" Remap <TAB> for smart completion on various characters...
inoremap <silent> <TAB>   <C-R>=SmartComplete()<CR>

"------------------------------------------------------------------------------

