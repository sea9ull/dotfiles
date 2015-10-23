set nocompatible
filetype plugin indent on
colorscheme molokai

syntax on
set cursorline
set guifont=Ricty\ 12
set noerrorbells
set novisualbell
set visualbell t_vb=
set hidden

set virtualedit+=block
set guioptions-=T
set guioptions-=m
set modeline
set laststatus=2
set cmdheight=1
set nowrap

if !has('gui_running')
	augroup seiya
		autocmd!
		autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
		autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
		autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
		autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
		autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
	augroup END
endif
