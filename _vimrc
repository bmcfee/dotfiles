version 6.0
iab Ytag <C-R>=strftime("%Y-%m-%d %T by Brian McFee <brian.mcfee@nyu.edu>")<CR>

  set spell

  if has("gui_running")
        colorscheme desert
        set columns=120
        set guioptions=c
        set lines=40
        set mousehide
        set guifont=Source\ Code\ Pro\ 9,Fixed\ 9
  else
        set t_Co=256
        colorscheme zellner
  endif

  set   encoding=utf-8
  set   statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')} 

  set   incsearch
  set   autoindent
  set   smartindent
  set   backspace=indent,eol,start
  set   comments=b:#,:%,fb:-,n:>,n:)
  set	expandtab
  set   helpheight=0
  set   hidden
  set   highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
  set   joinspaces
  set   laststatus=2
  set   magic
  set   nomodeline
  set   number
  set   noautowrite
  set   nobackup
  set   nocompatible
  set   noerrorbells
  set   noesckeys
  set   noicon
  set   noignorecase
  set   noinsertmode
  set   nottybuiltin
  set   nowritebackup
  set   path=.
  set   report=0
  set   ruler
  set   shell=bash
  set   shiftwidth=4
  set   shortmess=at
  set   showcmd
  set   showmatch
  set   showmode
  set	softtabstop=4
  set   suffixes=.bak.swp
  set   tabstop=4
  set   title
  set   ttyfast
  set   visualbell
  set   t_vb=
  set   whichwrap=<,>
  set   wildchar=<TAB>
  set   wrapmargin=1
  nmap Q gq
  vmap Q gq
  map K <C-V>
  noremap <C-^> <C-^>`"
  map :alias map
  map :which map
  cnoremap <C-A> <Home>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <ESC>b <S-Left>
  cnoremap <ESC>f <S-Right>
  cnoremap <ESC><C-H> <C-W>
  map <F4>  :split<C-M>
  map <F5>  :bp<C-M>
  map <F6>  :bn<C-M>
  map <F12> :bd<C-M>
  map <ESC>[19~ :split<C-M>
  map <ESC>[20~ :bp<C-M>
  map <ESC>[23~ :bn<C-M>
  map <ESC>[31~ :bd<C-M>
   map <ESC>OA <Up>
  imap <ESC>OA <Up>
   map <ESC>[A <Up>
  imap <ESC>[A <Up>
   map <ESC>OB <Down>
  imap <ESC>OB <Down>
   map <ESC>[B <Down>
  imap <ESC>[B <Down>
   map <ESC>OC <Right>
  imap <ESC>OC <Right>
   map <ESC>[C <Right>
  imap <ESC>[C <Right>
   map <ESC>OD <Left>
  imap <ESC>OD <Left>
   map <ESC>[D <Left>
  imap <ESC>[D <Left>

   map <C-C> :call EnhancedCommentify('', 'guess')<CR>
  imap <C-C> <ESC>:call EnhancedCommentify('', 'guess')<CR>i

    let g:EnhCommentifyMultiPartBlocks = 'yes'
    let g:EnhCommentifyPretty = 'yes'
    let g:EnhCommentifyAlignRight = 'yes'
    let g:EnhCommentifyUseSyntax = 'yes'

let mapleader = "^C"

map ,Cm <home>OCHANGED: <ESC>CYtag<ESC><C-C>o <ESC><C-C>o<ESC>k<end>gela
map ,Cc <home>OCREATED: <ESC>CYtag<ESC><C-C>o <ESC><C-C>o<ESC>k<end>gela
map ,Cf <home>OFIXME:   <ESC>CYtag<ESC><C-C>o <ESC><C-C>o<ESC>k<end>gela
map ,Ct <home>OTODO:    <ESC>CYtag<ESC><C-C>o <ESC><C-C>o<ESC>k<end>gela
map ,Cx <home>OXXX:     <ESC>CYtag<ESC><C-C>o <ESC><C-C>o<ESC>k<end>gela

map ,s :!echo <cword> \| ispell -a <return>
map ,d :!dict <cword> \| less <return>
map ,m :!man <cword> <CR>
map ,p :!pydoc <cword> <CR>

augroup GPGASCII
	au!
	au BufReadPost *.pgp,*.asc,*.gpg	:%!gpg -q -d
	au BufReadPost *.pgp,*.asc,*.gpg	|redraw
	au FileReadPost *.pgp,*.asc,*.gpg	|redraw
	au BufWritePre *.pgp,*.asc,*.gpg	:%!gpg -q -e -a
	au BufWritePost *.pgp,*.asc,*.gpg	u
	au VimLeave *.pgp,*.asc,*.gpg		:!clear
augroup END

call pathogen#infect()
syntax on
source $VIMRUNTIME/syntax/syntax.vim
syntax sync maxlines=120

