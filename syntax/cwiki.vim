" Vim syntax file
" Language:     CWiki
" Maintainer:   chrysplusplus
" Filenames:    cwiki plugin files

if exists("b:current_syntax")
  finish
endif

syntax sync minlines=50 linebreaks=1
syntax case ignore
setlocal conceallevel=2

syntax match cwikiLineStart "^" nextgroup=@cwikiBlock

syntax cluster cwikiBlock contains=cwikiH1,cwikiH2,cwikiH3,cwikiH4,cwikiH5,cwikiH6,cwikiUL,cwikiOL,cwikiCodeBlock
syntax cluster cwikiInline contains=cwikiLineBreak,cwikiImportant,cwikiBold,cwikiItalic

syntax match cwikiH1 "^.\+\n=\+$" contained contains=cwikiHeadingRule
syntax match cwikiH2 "^.\+\n-\+$" contained contains=cwikiHeadingRule

syntax match cwikiHeadingRule "^[=-]\+$" contained

syntax region cwikiH1 matchgroup=cwikiH1Delimiter start=" \{,3}#\s"      end="#*\s*$" keepend display oneline contained
syntax region cwikiH2 matchgroup=cwikiH2Delimiter start=" \{,3}##\s"     end="#*\s*$" keepend display oneline contained
syntax region cwikiH3 matchgroup=cwikiH3Delimiter start=" \{,3}###\s"    end="#*\s*$" keepend display oneline contained
syntax region cwikiH4 matchgroup=cwikiH4Delimiter start=" \{,3}####\s"   end="#*\s*$" keepend display oneline contained
syntax region cwikiH5 matchgroup=cwikiH5Delimiter start=" \{,3}#####\s"  end="#*\s*$" keepend display oneline contained
syntax region cwikiH6 matchgroup=cwikiH6Delimiter start=" \{,3}######\s" end="#*\s*$" keepend display oneline contained

syntax match cwikiLineBreak "<br>$" display contains=@NoSpell
syntax match cwikiLineBreak "\\$" display
syntax match cwikiLineBreak " \{2,}$" display

syntax match cwikiUL "\%(\t\| \{0,4}\)[-*+] " display contained contains=cwikiBullet
syntax match cwikiOL "\%(\t\| \{0,4}\)\<\d\+.\s\+" display contained

syntax match cwikiBullet "[-*+]" display contained conceal cchar=•

syntax match cwikiLink "\\\@<!\[[^][]*\]([^][()]*)" display contains=cwikiLinkText
syntax region cwikiLinkText matchgroup=cwikiLink start="\[" end="\]" nextgroup=cwikiLinkURI keepend display contained concealends
syntax region cwikiLinkURI matchgroup=cwikiLink start="(" end=")" keepend display contained transparent conceal contains=@NoSpell

syntax region cwikiItalic matchgroup=cwikiHiddenDelimiter start="\*\S\@=" end="\S\@<=\*\|^$" skip="\\\*" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiItalic matchgroup=cwikiHiddenDelimiter start="\w\@<!_\S\@=" end="\S\@<=_\w\@!\|^$" skip="\\_" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiBold matchgroup=cwikiHiddenDelimiter start="\*\*\S\@=" end="\S\@<=\*\*\|^$" skip="\\\*" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiBold matchgroup=cwikiHiddenDelimiter start="\w\@<!__\S\@=" end="\S\@<=__\w\@!\|^$" skip="\\_" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiImportant matchgroup=cwikiHiddenDelimiter start="\*\*\*\S\@=" end="\S\@<=\*\*\*\|^$" skip="\\\*" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiImportant matchgroup=cwikiHiddenDelimiter start="\w\@<!___\S\@=" end="\S\@<=___\w\@!\|^$" skip="\\_" contains=cwikiLineStart,cwikiEscaped concealends
syntax region cwikiCode matchgroup=cwikiCodeDelimiter start="`\S\@=" end="\S\@<=`\|^$" skip="\\`" keepend concealends contains=cwikiLineStart,cwikiEscaped,@NoSpell

syntax match cwikiDate "\<\%(\d\{4}\|\d\{2}\)-\d\d-\d\d\>" display

syntax match cwikiHznRule "^\*\{3,}$" display
syntax match cwikiHznRule "^-\{3,}$" display

syntax region cwikiCodeBlock matchgroup=cwikiCodeDelimiter start="^```$" end="^```$" keepend contains=@NoSpell

syntax region cwikiYamlHeader matchgroup=cwikiYamlHeader start="\%^---.*$" end="^\.\.\.\s*$" keepend contains=cwikiDate,@NoSpell

syntax match cwikiEscaped "\\[[*_`]" transparent contains=cwikiEscapeDelimiter
syntax match cwikiEscapeDelimiter "\\" transparent contained conceal

highlight default link cwikiH1                Title
highlight default link cwikiH2                Title
highlight default link cwikiH3                Title
highlight default link cwikiH4                Title
highlight default link cwikiH5                Title
highlight default link cwikiH6                Title
highlight default link cwikiHeadingRule       NonText
highlight default link cwikiH1Delimiter       cwikiHeadingDelimiter
highlight default link cwikiH2Delimiter       cwikiHeadingDelimiter
highlight default link cwikiH3Delimiter       cwikiHeadingDelimiter
highlight default link cwikiH4Delimiter       cwikiHeadingDelimiter
highlight default link cwikiH5Delimiter       cwikiHeadingDelimiter
highlight default link cwikiH6Delimiter       cwikiHeadingDelimiter
highlight default link cwikiHeadingDelimiter  NonText
highlight default link cwikiHznRule           Identifier
highlight default link cwikiHiddenDelimiter   Comment
highlight default link cwikiYamlHeader        Comment
highlight default link cwikiLinkText          cwikiLink

highlight default link cwikiCodeBlock         cwikiCode
highlight default link cwikiCodeDelimiter     cwikiCode
highlight default link cwikiCode              PreProc
highlight default link cwikiLineBreak         NonText
highlight default link cwikiUL                Identifier
highlight default link cwikiOL                Identifier
highlight default link cwikiBullet            Identifier
highlight default link cwikiDate              PreProc

highlight default cwikiItalic     cterm=italic gui=italic
highlight default cwikiBold       cterm=bold gui=bold
highlight default cwikiImportant  cterm=bold,italic gui=bold,italic
highlight default cwikiLink       cterm=underline gui=underline

let b:current_syntax = "cwiki"

