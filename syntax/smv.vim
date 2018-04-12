" SMV syntax file
" Language:   NuSMV
" Maintainer: Camil Staps <info@camilstaps.nl>
" License:    This file is placed in the public domain.

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword smvDecl    MODULE DEFINE MDEFINE CONSTANTS VAR IVAR FROZENVAR INIT
			\ TRANS INVAR SPEC CTLSPEC LTLSPEC PSLSPEC COMPUTE NAME INVARSPEC
			\ FAIRNESS JUSTICE COMPASSION ISA ASSIGN CONSTRAINT SIMPWFF CTLWFF
			\ LTLWFF PSLWFF COMPWFF IN MIN MAX MIRROR PRED PREDICATES
syn keyword smvType    array of boolean integer real word
syn keyword smvCase    case esac
syn keyword smvBuiltin wordl bool signed unsigned extend resize sizeof uwconst
			\ swconst init self count abs max min TRUE FALSE
syn keyword smvOp      EX AX EF AF EG AG E F O G H X Y Z A U S V T BU EBF ABF
			\ EBG ABG next mod union in xor xnor
syn match   smvVar     "[a-zA-Z_][a-zA-Z_0-9$#-]*" display
syn match   smvInteger "[+-~]\?\<\(\d\+\|0[0-7]\+\|0x[0-9A-Fa-f]\+\)\>" display

syn region  smvComment start="/--"      end="--/" contains=smvComment,@Spell
syn region  smvComment start="^\s*/--"  end="--/" contains=smvComment,@Spell fold keepend extend
syn region  smvSingleComment start="--" end="$"   contains=@Spell oneline display

hi def link smvDecl    Label
hi def link smvType    Type
hi def link smvCase    Conditional
hi def link smvBuiltin Keyword
hi def link smvOp      Operator
hi def link smvVar     Identifier
hi def link smvInteger Number
hi def link smvComment Comment
hi def link smvSingleComment Comment

let b:current_syntax = 'smv'

let &cpo = s:cpo_save
unlet s:cpo_save
