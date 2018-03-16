version 6.0
iab Ytag <C-R>=strftime("%Y-%m-%d %T by Brian McFee <brian.mcfee@nyu.edu>")<CR>

set spell

colorscheme zellner
if has("gui_running")
    colorscheme desert
    set columns=120
    set guioptions=c
    set lines=40
    set mousehide
    "set guifont=Source\ Code\ Pro\ 10,Fixed\ 10
    set guifont=Sauce\ Code\ Powerline\ 10,Fixed\ 10
else
    set t_Co=8
endif
if !has("nvim")
    set     highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
    set     nottybuiltin
endif

set     encoding=utf-8
set     incsearch
set     autoindent
set     smartindent
set     backspace=indent,eol,start
set     comments=b:#,:%,fb:-,n:>,n:)
set     expandtab
set     helpheight=0
set     hidden
set     joinspaces
set     laststatus=2
set     magic
set     nomodeline
set     number
set     noautowrite
set     nobackup
set     nocompatible
set     noerrorbells
"set     noesckeys
set     noicon
set     noignorecase
set     noinsertmode
set     nowritebackup
set     path=.
set     report=0
set     ruler
set     shell=bash
set     shiftwidth=4
set     shortmess=at
set     showcmd
set     showmatch
set     showmode
set     softtabstop=4
set     suffixes=.bak.swp
set     tabstop=4
set     title
set     ttyfast
set     visualbell
set     t_vb=
set     whichwrap=<,>
set     wildchar=<TAB>
set     wrapmargin=1
nmap    Q gq
vmap    Q gq
map     K <C-V>
noremap <C-^> <C-^>`"
map     :alias map
map     :which map
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <ESC>b <S-Left>
cnoremap <ESC>f <S-Right>
cnoremap <ESC><C-H> <C-W>
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

let mapleader=","

filetype plugin indent on
 


map <leader>Cm <home>OCHANGED: <ESC>CYtag<ESC>,c<space>o <ESC><C-C>o<ESC>k<end>gela
map <leader>Cc <home>OCREATED: <ESC>CYtag<ESC>,c<space>o <ESC><C-C>o<ESC>k<end>gela
map <leader>Cf <home>OFIXME:   <ESC>CYtag<ESC>,c<space>o <ESC><C-C>o<ESC>k<end>gela
map <leader>Ct <home>OTODO:    <ESC>CYtag<ESC>,c<space>o <ESC><C-C>o<ESC>k<end>gela
map <leader>Cx <home>OXXX:     <ESC>CYtag<ESC>,c<space>o <ESC><C-C>o<ESC>k<end>gela

map <leader>Cs :!echo <cword> \| ispell -a <return>
map <leader>Cd :!dict <cword> <return>
map <leader>Cm :!man <cword> <CR>
map <leader>Cp :!pydoc <cword> <CR>

augroup GPGASCII
	au!
	au BufReadPost *.pgp,*.asc,*.gpg	:%!gpg -q -d
	au BufReadPost *.pgp,*.asc,*.gpg	|redraw
	au FileReadPost *.pgp,*.asc,*.gpg	|redraw
	au BufWritePre *.pgp,*.asc,*.gpg	:%!gpg -q -e -a
	au BufWritePost *.pgp,*.asc,*.gpg	u
	au VimLeave *.pgp,*.asc,*.gpg		:!clear
augroup END

let g:airline_powerline_fonts = 1

"if !has("nvim")
    call pathogen#infect()
"endif

syntax on
source $VIMRUNTIME/syntax/syntax.vim
syntax sync maxlines=120

set statusline+=%#warningmsg#
set statusline+=%*

autocmd BufNewFile,BufRead *.tex set nolinebreak wrap textwidth=0 wrapmargin=0

let g:tex_conceal = ""

function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors solarized
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
