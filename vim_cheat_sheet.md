* DiffOrig - Diff the current buffer
Diff the file since it was loaded, i.e. track changes of the file as
edited. Copied from VIM help ':help vimdiff'
`command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_`
`	\ | diffthis | wincmd p | diffthis`

* Orgmode:
  Tags:
    \st   - Set tag
    \ft   - Find tag
  Date:
    \sa   - Set date

    For dates, there is increment/decrement which works normally
    for days, months ... via <CTRL-A> / <CTRL-X>

  For help see:  ~/vimenv/external/vim-orgmode/doc/orgguide.txt
