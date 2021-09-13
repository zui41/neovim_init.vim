"For python3 neovim
let g:python3_host_prog=$PYENV_ROOT.'~/.pyenv/versions/neovim-3/bin/python'

call plug#begin('~/.config/nvim/plugins')

Plug 'nanotech/jellybeans.vim'

Plug 'cocopon/iceberg.vim'
Plug 'tomasr/molokai'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()



"--------------------------------------
map <C-n> :NERDTreeToggle<CR>
"--------------------------------------

"--------------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"--------------------------------------


set title
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=4          "タブを何文字の空白に変換するか
set shiftwidth=4       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls
set binary noeol       "\ No newline at end of fileの修正

set completeopt-=preview

inoremap <silent> jj <ESC>:<C-u>w<CR>
tnoremap <silent> <ESC> <C-\><C-n>

" 行頭へ移動
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
" 行末へ移動
cnoremap <C-e> <End>
inoremap <C-e> <End>

" Exコマンドを実装する関数を定義
function! ExecExCommand(cmd)
  silent exec a:cmd
  return ''
endfunction

" 補完せず補完ウィンドウを閉じてから移動
inoremap <silent> <expr> <C-b> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal h')<CR>" : "<C-r>=ExecExCommand('normal h')<CR>"
inoremap <silent> <expr> <C-f> pumvisible() ? "<C-e><C-r>=ExecExCommand('normal l')<CR>" : "<C-r>=ExecExCommand('normal l')<CR>"

colorscheme iceberg
" let g:lightline = {'colorscheme': 'jellybeans'}

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
