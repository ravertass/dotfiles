" Vim syntax file
" For the TIC-80 - modified from the Vim builtin Lua syntax file

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("lua_version")
  " Default is lua 5.1
  let lua_version = 5
  let lua_subversion = 1
elseif !exists("lua_subversion")
  " lua_version exists, but lua_subversion doesn't. So, set it to 0
  let lua_subversion = 0
endif

syn case match

" syncing method
syn sync minlines=100

" Comments
syn keyword luaTodo             contained TODO FIXME XXX
syn match   luaComment          "--.*$" contains=luaTodo,@Spell
if lua_version == 5 && lua_subversion == 0
  syn region  luaComment        matchgroup=luaComment start="--\[\[" end="\]\]" contains=luaTodo,luaInnerComment,@Spell
  syn region  luaInnerComment   contained transparent start="\[\[" end="\]\]"
elseif lua_version > 5 || (lua_version == 5 && lua_subversion >= 1)
  " Comments in Lua 5.1: --[[ ... ]], [=[ ... ]=], [===[ ... ]===], etc.
  syn region  luaComment        matchgroup=luaComment start="--\[\z(=*\)\[" end="\]\z1\]" contains=luaTodo,@Spell
endif

" First line may start with #!
syn match luaComment "\%^#!.*"

" catch errors caused by wrong parenthesis and wrong curly brackets or
" keywords placed outside their respective blocks

syn region luaParen transparent start='(' end=')' contains=ALLBUT,luaError,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaCondStart,luaBlock,luaRepeatBlock,luaRepeat,luaStatement
syn match  luaError ")"
syn match  luaError "}"
syn match  luaError "\<\%(end\|else\|elseif\|then\|until\|in\)\>"

" Function declaration
syn region luaFunctionBlock transparent matchgroup=luaFunction start="\<function\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat

" if then else elseif end
syn keyword luaCond contained else

" then ... end
syn region luaCondEnd contained transparent matchgroup=luaCond start="\<then\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaRepeat

" elseif ... then
syn region luaCondElseif contained transparent matchgroup=luaCond start="\<elseif\>" end="\<then\>" contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat

" if ... then
syn region luaCondStart transparent matchgroup=luaCond start="\<if\>" end="\<then\>"me=e-4 contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat nextgroup=luaCondEnd skipwhite skipempty

" do ... end
syn region luaBlock transparent matchgroup=luaStatement start="\<do\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat

" repeat ... until
syn region luaRepeatBlock transparent matchgroup=luaRepeat start="\<repeat\>" end="\<until\>" contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat

" while ... do
syn region luaRepeatBlock transparent matchgroup=luaRepeat start="\<while\>" end="\<do\>"me=e-2 contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaRepeat nextgroup=luaBlock skipwhite skipempty

" for ... do and for ... in ... do
syn region luaRepeatBlock transparent matchgroup=luaRepeat start="\<for\>" end="\<do\>"me=e-2 contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd nextgroup=luaBlock skipwhite skipempty

" Following 'else' example. This is another item to those
" contains=ALLBUT,... because only the 'for' luaRepeatBlock contains it.
syn keyword luaRepeat contained in

" other keywords
syn keyword luaStatement return local break
syn keyword luaOperator  and or not
syn keyword luaConstant  nil
if lua_version > 4
  syn keyword luaConstant true false
endif

" Strings
if lua_version < 5
  syn match  luaSpecial contained "\\[\\abfnrtv\'\"]\|\\\d\{,3}"
elseif lua_version == 5 && lua_subversion == 0
  syn match  luaSpecial contained "\\[\\abfnrtv\'\"[\]]\|\\\d\{,3}"
  syn region luaString2 matchgroup=luaString start=+\[\[+ end=+\]\]+ contains=luaString2,@Spell
elseif lua_version > 5 || (lua_version == 5 && lua_subversion >= 1)
  syn match  luaSpecial contained "\\[\\abfnrtv\'\"]\|\\\d\{,3}"
  syn region luaString2 matchgroup=luaString start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
endif
syn region luaString  start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=luaSpecial,@Spell
syn region luaString  start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=luaSpecial,@Spell

" integer number
syn match luaNumber "\<\d\+\>"
" floating point number, with dot, optional exponent
syn match luaFloat  "\<\d\+\.\d*\%(e[-+]\=\d\+\)\=\>"
" floating point number, starting with a dot, optional exponent
syn match luaFloat  "\.\d\+\%(e[-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syn match luaFloat  "\<\d\+e[-+]\=\d\+\>"

" hex numbers
if lua_version > 5 || (lua_version == 5 && lua_subversion >= 1)
  syn match luaNumber "\<0x\x\+\>"
endif

" tables
syn region  luaTableBlock transparent matchgroup=luaTable start="{" end="}" contains=ALLBUT,luaTodo,luaSpecial,luaCond,luaCondElseif,luaCondEnd,luaCondStart,luaBlock,luaRepeatBlock,luaRepeat,luaStatement

syn keyword luaFunc TIC SCN OVR
syn keyword luaFunc btn btnp
syn keyword luaFunc clip cls circ circb
syn keyword luaFunc lli ellib exit
syn keyword luaFunc get fset font
syn keyword luaFunc ey keyp line
syn keyword luaFunc ap memcpy memset
syn keyword luaFunc get mset mouse music
syn keyword luaFunc eek peek4 peek1 peek2
syn keyword luaFunc ix pmem
syn keyword luaFunc oke poke4 poke1 poke2
syn keyword luaFunc rint rect rectb reset
syn keyword luaFunc fx spr sync time tstamp
syn keyword luaFunc race tri trib textri


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lua_syntax_inits")
  if version < 508
    let did_lua_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink luaStatement		Statement
  HiLink luaRepeat		Repeat
  HiLink luaString		String
  HiLink luaString2		String
  HiLink luaNumber		Number
  HiLink luaFloat		Float
  HiLink luaOperator		Operator
  HiLink luaConstant		Constant
  HiLink luaCond		Conditional
  HiLink luaFunction		Function
  HiLink luaComment		Comment
  HiLink luaTodo		Todo
  HiLink luaTable		Structure
  HiLink luaError		Error
  HiLink luaSpecial		SpecialChar
  HiLink luaFunc		Identifier

  delcommand HiLink
endif

let b:current_syntax = "lua"

" vim: et ts=8
