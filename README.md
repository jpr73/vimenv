This is the VimEnv (VIM Environment).
Started at 27. Feb 2020.

TODO
====
* Clean-up ./labrador/vimrc_labrador -> Completed Apr 8 2020.
* Update at Win PC. -> Completed at Apr 11 2020.
* Update work Linux -> Completed at Apr 12 2020.
* Diff ./vimrc and ./work_linux/vimrc

Install
=======

1. Clone git repos
*  Go to $HOME
*  git clone https://github.com/jpr73/vimenv.git
*  cd vimenv
*  git submodule init
*  git submodule update

Linux:
*  cd
*  mkdir -p .vim/pack/vimenv_external
*  ln -s ~/vimenv/external .vim/pack/vimenv_external/start
*  ln -s vimenv/vimrc .vimrc

Windows:
*  Make links as Administrator if does not work normally
*  Go to $HOME
*  Create dir vimfiles\pack\vimenv_external and go there.
*  mklink /D start "Full path to $HOME"\vimenv\external
*  Go to $HOME
*  mklink _vimrc vimenv\vimrc

References
==========
VIM Scripting:
*  <https://learnvimscriptthehardway.stevelosh.com>
*  <https://devhints.io/vimscript>
*  <https://developer.ibm.com/articles/l-vim-script-1/>

Vim related:
*  <https://shapeshed.com/vim-packages/>
*  <https://www.root.cz/clanky/plugin-vim-orgmode-portace-popularniho-orgmode-do-vimu/>

Check this for inspiration:
*  <https://github.com/amix/vimrc>

Scripts used in the past
========================
 * 256-grayvim : Blue & gray 256 colorscheme
    <https://www.vim.org/scripts/script.php?script_id=3062>

 * taglist.vim : Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
    <https://www.vim.org/scripts/script.php?script_id=273>

 * verilog_systemverilog.vim : Extending Verilog syntax highlighting for SystemVerilog
    <https://www.vim.org/scripts/script.php?script_id=1586>

 * VHDL indent ('93 syntax) : Revised VHDL indent file
    <https://www.vim.org/scripts/script.php?script_id=1450>

 * comments.vim : To Comment/Un-Comment single/multiple lines of code for different source files
    <https://www.vim.org/scripts/script.php?script_id=1528>

 * SystemVerilog indent and syntax scripts
    <https://github.com/nachumk/systemverilog.vim>

 * A Vim plugin for visually displaying indent levels in code
    <https://github.com/nathanaelkane/vim-indent-guides>

 * Vim Markdown
    <https://github.com/plasticboy/vim-markdown>

*Used for snippets*
 * SnipMate aims to provide support for textual snippets, similar to TextMate ...
    <https://github.com/garbas/vim-snipmate>

 * This library provides some utility functions...
     Used by vim-snipmate plugin.
    <https://github.com/tomtom/tlib_vim>

 * Various utils such as caching interpreted contents of files or advanced glob like things
     Used by vim-snipmate plugin.
    <https://github.com/MarcWeber/vim-addon-mw-utils>

 * snipMate & UltiSnip Snippets
     Uses vim-snipmate
     <https://github.com/honza/vim-snippets>

