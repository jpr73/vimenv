* DiffOrig - Diff the current buffer
Diff the file since it was loaded, i.e. track changes of the file as
edited. Copied from VIM help ':help vimdiff'
`command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_`
`	\ | diffthis | wincmd p | diffthis`

