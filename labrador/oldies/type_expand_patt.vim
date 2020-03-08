"-------------------------------------------------------------------------------
"
" Filename:     type_expand_patt.vim
" Description:  Patterns for complete the typing based on the file type and
"               current context, based on the cursor position in the text.
"               The file is parsed by type_expand_code.vim script.
"
" RCS Id:       $Id:$
"
" RCS Revision: $Revision:$
"
"-------------------------------------------------------------------------------
"
" TODO:
"
"   - Add Verilog, Perl, Tcl patterns
"
"-------------------------------------------------------------------------------

" Rules for writing patterns: 
"   - Adding completion for more than one line (i.e. adding \n) requires enable
"     autoindent to indent properly.
"   - Use "|" (pipe) char for specifying where the cursor should be moved.

"--- Any language indendent completion
"
call AddCmpl(g:ANY_LANG, '{',   g:NONE, "|}")
call AddCmpl(g:ANY_LANG, '{',   '}',    "\<CR>\<C-D>\<ESC>O")
call AddCmpl(g:ANY_LANG, '\[',  g:NONE, "]")
call AddCmpl(g:ANY_LANG, '\[',  '\]',   "\<CR>\<ESC>O\<TAB>")
call AddCmpl(g:ANY_LANG, '(',   g:NONE, ")")
call AddCmpl(g:ANY_LANG, '(',   ')',    "\<CR>\<ESC>O\<TAB>")
call AddCmpl(g:ANY_LANG, '<',   g:NONE, ">")
call AddCmpl(g:ANY_LANG, '<',   '>',    "\<CR>\<ESC>O\<TAB>")
call AddCmpl(g:ANY_LANG, '"',   g:NONE, '"')
call AddCmpl(g:ANY_LANG, '"',   '"',    "\\n")
call AddCmpl(g:ANY_LANG, "'",   g:NONE, "'")
call AddCmpl(g:ANY_LANG, "'",   "'",    g:NONE)

"--- VHDL completion
"
call AddCmplNoLeft("vhdl", "library",          " |ieee;\nuse ieee.std_logic_1164.all;")
call AddCmplNoLeft("vhdl", "entity",           " | is\n\<TAB>port (\n);\n\<BS>end ;")
call AddCmplNoLeft("vhdl", "architecture",     " | of is\nbegin\nend ;")
call AddCmplNoLeft("vhdl", "configuration",    " | of is\n\<TAB>for\nend for;\n\<BS>end configuration ;")
call AddCmplNoLeft("vhdl", "package",          " | is\nend package;\n\npackage body is\nend package body ;")
call AddCmplNoLeft("vhdl", "procedure",        " | is\nbegin\nend procedure ;")
call AddCmplNoLeft("vhdl", "function",         " | () return is\nbegin\nend ;")
call AddCmplNoLeft("vhdl", "process",          " (|)\n\<TAB>begin\nend process ;")
call AddCmplNoLeft("vhdl", "for",              " | in 0 to loop\nend loop;")
call AddCmplNoLeft("vhdl", "while",            " | loop\nend loop;")
call AddCmplNoLeft("vhdl", "case",             " | is\n\<TAB>when =>\nwhen others=>\n\<BS>end case;")
call AddCmplNoLeft("vhdl", "if",               " (|) then\nelse\nend if;")
call AddCmplNoLeft("vhdl", "integer",          " range 0 to |")
call AddCmplNoLeft("vhdl", "natural",          " range 0 to |")
call AddCmplNoLeft("vhdl", "assert",           " |\n\<TAB>report \"\"\nseverity error;")
call AddCmplNoLeft("vhdl", "std_logic",        "_vector|")
call AddCmplNoLeft("vhdl", "std_logic_vector", " (| downto )")
call AddCmplNoLeft("vhdl", "--",               "===== |=====\n-- \n--\n")

"--- Verilog
"
call AddCmplNoLeft("verilog", "module",        " |;\n\<TAB>\n\<BS>endmodule\n")
call AddCmplNoLeft("verilog", "task",          " |;\n\<TAB>\n\<BS>endtask\n")
call AddCmplNoLeft("verilog", "initial",       " begin\n\<TAB>\n\<BS>end\n")
call AddCmplNoLeft("verilog", "always",        " | begin\n\<TAB>\n\<BS>end\n")
call AddCmplNoLeft("verilog", "if",            " (|) begin\n\<TAB>\n\<BS>end\nelse begin\n\<TAB>\n\<BS>end")
call AddCmplNoLeft("verilog", "repeat",        " (|) begin\n\<TAB>\n\<BS>end\n")
call AddCmplNoLeft("verilog", "@",             "(posedge |)")
call AddCmplNoLeft("verilog", "//",            "----- |-----\n")

"--- Perl completion
"
call AddCmplNoLeft("perl", "if",               " (|) {\n} else {\n}")

"------------------------------------------------------------------------------

