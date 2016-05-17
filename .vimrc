"=========================================
"    Description: .vimrc
"         Author: ryo nakamura
"  Last Modified: 2014-03-26 07:03
"        Version: 2.01
"=========================================
set nocompatible
let $RUNTIME = $HOME.'/.vim'


"----------------------------------------
" 日本語入力対応
"----------------------------------------
" 挿入モード切替時、前回のIMEを復元
"set t_SI+=[<r
" 挿入モード終了時、IMEを保存
"set t_EI+=[<s[<0t
"vim 終了時。IMEを無効にし、状態保存
"set t_te+=[<0t[<s
"set ttimeoutlen=100

" ESC でIME をoff
inoremap <ESC> <ESC>:set iminsert=0<CR>
"----------------------------------------
" File Encoding
"----------------------------------------
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac
"----------------------------------------
" System Settings
"----------------------------------------
" not make  backupfile, swapfile, viminfo
set nowritebackup
set nobackup
set noswapfile
set viminfo=

"mouse mode a:all, v:visual
"if has('mouse')
"  "set mouse=a
"  set mouse=v
"endif

" sharing clipboard
" #on ubuntu
set clipboard=unnamedplus
" #on otherUnix/Linux
"set clipboard+=unnamed,autoselect

" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100
" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
" history line capacity
set history=3000
" in join, non <Space> between japanese characters
set formatoptions+=mM
" Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

set undodir=$RUNTIME.'\undo'
" □や○の文字があってもカーソル位置がずれないようにする
"set ambiwidth=double
" コマンドライン補完するときに強化されたものを使う
set wildmenu

"----------------------------------------
" Print Settings
"----------------------------------------
"
set printheader=%<%f%h%=\ %N
"set printheader=%t                                       " ファイル名
"set printheader=%F                                       " ファイル名（パス含む）
"set printheader=%t\ -%N-                                  " ファイル名 -ページ-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " 最終印刷日時
"set printheader=山田\ 太郎                               " 最終保存者、作成者
"set printheader=山田\ 太郎\ %N\ %{strftime('%Y/%m/%d')}  " 作成者 ページ 日付

"set printoptions+=header:1  " ヘッダー、本文間にスペースを空けない
"set printoptions+=header:2   " ヘッダー、本文間に1行入れる
"
"
"----------------------------------------
" Search
"----------------------------------------
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
" incremental search
set incsearch
" highlight search
set hlsearch
" w,bの移動で認識する文字
set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep をデフォルトのgrepとする場合internal
set grepprg=internal

"----------------------------------------
" View Settings
"----------------------------------------
" not show splash message
set shortmess+=I

" non beep
set noerrorbells
set novisualbell
set visualbell t_vb=

" show column number
set number

set ruler
set cursorline

" 括弧の対応表示時間
set showmatch matchtime=1
" tab size
set ts=2 sw=2 sts=2

set autoindent
" C indent settings
set cinoptions+=:0

set title
" show command in status
set showcmd
" command line height
set cmdheight=1
" status line height
set laststatus=2

" 画面最後の行をできる限り表示する
set display=lastline
" not return text at line length
set nowrap

" show tab, trail, eol
set list
"set listchars=tab:▸\ ,trail:_,eol:⇃
set listchars=tab:▸\ ,trail:▹
set tabstop=2
set autoindent
set expandtab

"----------------------------------------
" Keybind
"----------------------------------------
"括弧の補完
"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
nnoremap ; :
nnoremap : ;
nnoremap <silent> <C-W>\ :vs<CR>
nnoremap <silent> <C-W>- :split<CR>

" ヘルプ検'索
" 'nnoremap <F1> K
" 現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
" 強制全保存終了を無効化
nnoremap ZZ <Nop>
" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv
nnoremap <C-@> <ESC>
nnoremap ,tg :!ctags -R<CR>
nnoremap <Leader>tt :TagbarToggle<Enter>

nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

"----------------------------------------
" Binary Mode
"----------------------------------------
" binary-modeの設定
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

"----------------------------------------
" Plugin
"----------------------------------------
" pluginを使用可能にする
filetype plugin indent on

" NeoBundle

if has("vim_starting")
  set runtimepath+=$RUNTIME/neobundle/neobundle.vim/
endif

call neobundle#begin(expand($RUNTIME.'/neobundle'))
"set showtabline=2
"set guioptions-=e
"wombat,  solarized
"NeoBundle 'ryanoasis/vim-devicons'

"let g:webdevicons_enable = 1
"let g:webdevicons_enable_airline_statusline = 0
"let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
"let g:webdevicons_enable_airline_tabline = 0
"let g:webdevicons_enable_ctrlp = 0
"let g:webdevicons_enable_flagship_statusline = 0
"let g:webdevicons_enable_flagship_statusline_fileformat_symbols = 0
"let g:webdevicons_enable_nerdtree = 0
"let g:webdevicons_enable_unite = 1
"let g:webdevicons_enable_vimfiler = 1

"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = "\ue7c5"
"let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = "\ue7c5"

NeoBundle 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"":""}',
"      \ },
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' }
"      \ }
"
"colorscheme : default ,wombat ,jellybeans, ...etc

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left':  [[ 'mode', 'paste' ],[ 'filename' ],['filetype']],
        \   'right': [['percent' ],['lineinfo'],['charcode','encoding']]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'charcode': 'MyCharCode',
        \   'encoding': 'Myencoding',
        \   'filename': 'MyFilename',
        \   'filetype': 'MyFiletype',
        \   'linedata': 'MyLineinfo',
        \   'mode': 'MyMode'
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! Myencoding()
  "return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc.WebDevIconsGetFileFormatSymbol() : &enc.WebDevIconsGetFileFormatSymbol()) : ''
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc: &enc) : ''
endfunction

function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol(). &filetype  : '') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype  : '') : ''
endfunction

function! MyMode()
  return   &ft == 'vimfiler' ? 'EXPLORER' :
        \  &ft == 'unite' ? 'UNITE' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif
  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END
  if match(ascii, 'NUL') != -1
    return '[null]'
  endif
  " Zero pad hex values
  let nrformat = '%02x'
  let encoding = (&fenc == '' ? &enc : &fenc)
  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = ' %04x'
  endif
  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')
  " Format the numeric value
  let nr = printf(nrformat, nr)
  return "[". char . nr ."]"
endfunction

""Unite
NeoBundleLazy 'Shougo/unite.vim.git', {"autoload": {"insert": 1,}}
let s:bundle = neobundle#get("unite.vim")
function! s:bundle.hooks.on_source(bundle)
    let g:unite_source_history_yank_enable =1
    let g:unite_source_file_mru_limit = 200
    let g:unite_force_overwrite_statusline=0
    let g:unite_kind_jump_list_after_jump_scroll=0
    nnoremap <silent> Y :<C-u>Unite history/yank<CR>
    nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
    nnoremap <silent> ,b :<C-u>Unite buffer<CR>
    nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
    call unite#custom_default_action('directory' , 'tabvimfiler')
    call unite#custom_default_action("directory_mru", "vimfiler")
endfunction
unlet s:bundle

"  vimfiler
NeoBundleLazy 'Shougo/vimfiler', {'depends' : ["Shougo/unite.vim"],
\   'autoload' : {'commands':["VimFilerTab", "VimFiler", "VimFilerExplorer","VimFilerBufferFiler",],
\   "mappings": ['<Plug>(vimfiler_switch)'], "explorer": 1,}}
    nnoremap <Leader>e :VimFilerExplorer<CR>
    nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
    nnoremap <silent>fp :bprevious<CR>
    nnoremap <silent>fn :bnext<CR>
    nnoremap <silent>fb :b#<CR>
    nnoremap <C-z> :VimFiler -buffer-name=explorer -split -winwidth=35 -simple -toggle -no-quit<CR><CR>
    command VF VimFiler -buffer-name=explorer -split -winwidth=35 -simple -toggle -no-quit
    let s:bundle = neobundle#get("vimfiler")
function! s:bundle.hooks.on_source(bundle)
    let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"
    let g:vimfiler_safe_mode_by_default=0
    let g:unite_kind_file_use_trashbox = 1
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1
    "let g:vimfiler_split_rule="botright"
    let g:vimfiler_force_overwrite_statusline = 0
endfunction
unlet s:bundle

if has('lua') && v:version >= 703 && has('patch885')
    NeoBundleLazy "Shougo/neocomplete.vim", {"autoload": {"insert": 1,}}
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'scala' : $RUNTIME.'/data/scala.dict',
      \ }
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplet#enable_smart_case = 1
        " NeoCompleteを有効化
        " NeoCompleteEnable
    endfunction
else
    NeoBundleLazy "Shougo/neocomplcache.vim", {"autoload": {"insert": 1,}}
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'scala' : $RUNTIME.'/data/scala.dict',
      \ }
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
        " NeoComplCacheを有効化
    endfunction
endif

NeoBundleLazy 'honza/vim-snippets', {"autoload": {"insert": 1,}}
NeoBundleLazy "Shougo/neosnippet-snippets", {"autoload": {"insert": 1,}}
NeoBundleLazy "Shougo/neosnippet.vim", {"depends":["honza/vim-snippets"],"autoload":{"insert": 1,}}
let s:hooks = neobundle#get_hooks("neosnippet.vim")
function! s:hooks.on_source(bundle)
  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory=$RUNTIME.'/neobundle/vim-snippets/snippets'
endfunction

NeoBundleLazy 'vim-scripts/Align',{"autoload":{'commands':['Align']}}
"NeoBundleLazy 'chrisbra/csv.vim', {"autoload": {"filetypes": ['csv']}}
NeoBundleLazy 'mattn/emmet-vim', {"autoload": {"filetypes": ['html','xml','css']}}
NeoBundleLazy 'derekwyatt/vim-scala',{"autoload": {"filetypes": ['scala']}}
let s:hooks = neobundle#get_hooks("vim-scala.vim")
function! s:hooks.on_source(bundle)
	set tags +=$RUNTIME.'/data/scala/tags'
endfunction

NeoBundleLazy 'majutsushi/tagbar',{'autoload':{'commands':['TagbarToggle']}}
let s:hooks = neobundle#get_hooks("tagbar.vim")
function! s:hooks.on_source(bundle)
    let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1', 'V:values', 'v:variables',
        \ 'T:types', 't:traits', 'o:objects',
        \ 'a:aclasses', 'c:classes', 'r:cclasses',
        \ 'm:methods'
    \ ]}
endfunction

"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/matrix.vim--Yang'
"NeoBundle 'croaker/mustang-vim'
"NeoBundle 'jeffreyiacono/vim-colors-wombat'
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'vim-scripts/Lucius'
"NeoBundle 'vim-scripts/Zenburn'
"NeoBundle 'mrkn/mrkn256.vim'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
"NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

filetype plugin indent on
syntax on

"===========================
" ColorScheme Settings
"===========================
"
"colorscheme jellybeans
"colorscheme hybrid
"colorscheme molokai
"colorscheme mustang
colorscheme molokai
"let solarized_italic =0
"colorscheme solarized
"set background=light
"set background=dark

set t_Co=256
" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

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

hi MatchParen ctermbg=none ctermfg=Red
