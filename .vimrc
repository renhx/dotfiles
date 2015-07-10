" TODO:
"   Nyanmode.vim ... orz
"   テキスト整形系プラグイン
"   yankround移行
"   tagbar移行
"   vim-ctrlspace
"   ノーマルモード移行時にIMEを英数に切り替え?
"   コンテキストに応じたfiletype (osyo-manga/vim-precious)
"
" Thanks: @alotofwe


"------------------------------------------------
" NeoBundle
"------------------------------------------------
" usage  :NeoBundleInstall
"        :NeoBundleUpdate
"        :NeoBundleClean

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" コマンドの非同期実行, 自動でvimprocのbuildも行う
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


"------------------------------------------------
" Colorschemes
"------------------------------------------------

" NeoBundle 'sickill/vim-monokai'
NeoBundle 'renhx/vim-monokai'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'

"------------------------------------------------
" Plugins
"------------------------------------------------

NeoBundle 'Shougo/neocomplete.vim'                 " 自動補完, lua必要
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'                    " 現在書いているコードを別タブで実行, <Space>q
NeoBundle 'itchyny/lightline.vim'                  " ステータスラインを良い感じにする
NeoBundle 'scrooloose/nerdtree'                    " ディレクトリツリーを固定表示, <Space>n
NeoBundle 'jistr/vim-nerdtree-tabs'                " 複数タブでのnerdtreeの同期
" NeoBundle 'Shougo/unite.vim'                       " 総合インタフェース, 最近開いたファイル一覧とかが見れる
" NeoBundle 'basyura/unite-rails'                    " Rails+Unite統合
NeoBundle 'YankRing.vim'                           " ヤンクの履歴を保存 TODO: yankroundを使用するように切り替える？
NeoBundle 'mattn/sonictemplate-vim'                " ファイルタイプごとのテンプレートを複数設定
NeoBundle 'terryma/vim-multiple-cursors'           " カーソル分身(sublimeライク), C-n
"NeoBundle 'koron/minimap-vim'                     " sublimeライクなminimap, gvimでないと動作しないようであるためコメントアウト
"NeoBundle 'Shougo/vimshell.vim'                   " 
NeoBundle 'vim-scripts/taglist.vim'                " TODO: tagbarの方が良さげ？
" NeoBundle 'majutsushi/tagbar'                      " taglistからの移行
NeoBundle 'kana/vim-smartinput'                    " 対応記号の自動入力(mapするより頭良い)
NeoBundle 'cohama/vim-smartinput-endwise'          " smartinputでdo-endなども対応させる
"NeoBundle 'vim-scripts/Highlight-UnMatched-Brackets'
"NeoBundle 'daylilyfield/sexyscroll.vim'           " yuroyoro/smooth_scroll.vimの代わり(cui macvimでの動作都合)
NeoBundle 'joeytwiddle/sexy_scroller.vim'          " よりスムーズなスクロール
NeoBundle 'AndrewRadev/switch.vim'                 " true<->falseのようなword切り替え, <Space>-
NeoBundle 'tpope/vim-rails'                        " 対応するMVC,test間の簡単移動など
"NeoBundle 'vim-scripts/ruby-matchit'              " => source $VIMRUNTIME/macros/matchit.vim
NeoBundle 'tpope/vim-fugitive'                     " Git wrapper
NeoBundle 'scrooloose/nerdcommenter'               " より良きコメントアウト, C-?
NeoBundle 'mattn/emmet-vim'                        " Emmet(zen-coding)
NeoBundle 'scrooloose/syntastic'                   " 文法チェッカ
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'fundon/vim-mou'                         " Mouで開き直す
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tyru/open-browser.vim'                  " :OpenBrowserで、ブラウザで開く
NeoBundle 'tell-k/vim-browsereload-mac'            " 自動リロード, :ChromeReloadStart -> :w
"NeoBundle 'junegunn/vim-scroll-position'          " scrollbarの表示. 重いので使わない.
NeoBundle 'airblade/vim-gitgutter'                 " git-diffをLineNumの横に表示
NeoBundle 't9md/vim-quickhl'                       " カーソル箇所の単語をハイライト(<Space>h)
NeoBundle 'AndrewRadev/splitjoin.vim'              " (html:1行のタグを複数行に整形したり、複数行を1行にまとめたり), ruby, python
NeoBundle 'AndrewRadev/linediff.vim'               " 行単位diff
NeoBundle 'junegunn/goyo.vim'                      " Distraction-free writing in Vim.
NeoBundle 'junegunn/limelight.vim'                 " Hyperfocus-writing in Vim.
" NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'                     " cs'/, ds'
NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'gabrielelana/vim-markdown'
" NeoBundleLazy 'gabrielelana/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundle 'kannokanno/previm'                      " Realtime Markdown Preview
NeoBundle 'rhysd/clever-f.vim'                     " f{chr}で行を跨いで移動&日本語対応&;は任意の記号 vim-easymotion or sneak.vim or clever-f.vim
NeoBundle 'othree/javascript-libraries-syntax.vim' " local-vimrcと組み合わせ
NeoBundle 'MarcWeber/vim-addon-local-vimrc'        " .local-vimrc, 特定ディレクトリ以下でのみ有効化したい.vimrcがある場合, js-lib-syntaxと組み合わせ
NeoBundle 'kchmck/vim-coffee-script'               " CoffeeScript support for vim. Syntax, indenting, compiling, and more.
NeoBundle 'toyamarinyon/vim-swift'                 " Adds Swift support to vim. It covers syntax, intenting, and more.
NeoBundle 'mrocklin/maude.vim', {'rev' : '9e28f9'} " Maude-Lang, 9e28f9:ファイルタイプ判定付き
NeoBundle 'nathanaelkane/vim-indent-guides'        " インデント可視化
NeoBundle 'dag/vim-fish'                           " Fish Shell
NeoBundle 'thinca/vim-fontzoom'                    " gvim時に `:Fontzoom +10` みたいな感じでフォントサイズ変更
NeoBundle 'zaiste/tmux.vim'                        " .tmux.conf syntax
NeoBundle 'junegunn/vim-emoji'
" NeoBundle 'sophacles/vim-processing'
NeoBundle 'crazymaster/vim-processing', {'rev' : '45123b'}
NeoBundle 'renhx/vim-arduino-syntax'
NeoBundle 'jplaut/vim-arduino-ino'
" NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'hynek/vim-python-pep8-indent'           " 自動でPEP8なインデントにしてくれる
NeoBundle 'mbbill/undotree'                        " <Space>u undotreeの表示, persistent_undoと組み合わせると便利
NeoBundle 'ctrlpvim/ctrlp.vim'                     " <Space>p
NeoBundle 'tacahiroy/ctrlp-funky'                  " <Space>PF 関数をctrlpっぽく検索できる
" NeoBundle 'rhysd/vim-textobj-ruby'                 " r(Ruby Text Object): vir, cir, dir, dar, etc...
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'koron/codic-vim'                        " A plugin of http://codic.jp/ for Vim.
NeoBundle 'cohama/agit.vim'                        " :Agit :AgitFile, A powerful Git log viewer.
NeoBundle 'rhysd/committia.vim'                    " `git commit`からvimが起動した時、diffやstatusが表示されたリッチな画面になる
NeoBundle 'haya14busa/incsearch.vim'               " 検索をリッチに, デフォの/を置き換え, 入力中にC-jC-kで画面外の次のマッチへ, Tab STabで次のマッチへ, 入力中の同時ハイライト(正規表現も)
" NeoBundle 'osyo-manga/vim-anzu'                    " 検索結果の数を表示してくれる, スクロール時にsexy_scrollerが効かないのでdisable
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'mattn/excitetranslate-vim'
" NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'ujihisa/neco-look'                      " 英単語を補完, neocompleteとlookコマンド必要, デフォはmdとかで4字超えると出てくるっぽ
NeoBundle 'matze/vim-move'                         " 選択行を上下に移動(V -> C-h, C-l)
" NeoBundle 'skammer/vim-css-color'
NeoBundle 'jeroenbourgois/vim-actionscript'        " Syntax file for actionscript
NeoBundle 'fatih/vim-go'                           " Go (golang) support for Vim
NeoBundleLazy 'dag/vim2hs', {'autoload': {'filetypes': ['haskell']}}
NeoBundleLazy 'eagletmt/neco-ghc', {'autoload': {'filetypes': ['haskell']}}
NeoBundleLazy 'renhx/ghcmod-vim', {'rev':'issue-66', 'autoload': {'filetypes': ['haskell']}}
" NeoBundle 'moro/vim-review'
NeoBundle 'orangain/vim-review', {'rev' : '17778f'}
NeoBundle 'slim-template/vim-slim'

call neobundle#end()
NeoBundleCheck


"------------------------------------------------
" basic
"------------------------------------------------

" set nocompatible                                  " viとの互換をオフ (http://rbtnn.hateblo.jp/entry/2014/11/30/174749)
filetype indent on                                " ファイルタイプ判定をon
filetype plugin on
syntax on                                         " シンタックスハイライトをつける
set clipboard=unnamed,autoselect                  " clipboard共有を有効にする, +clipboardになっていること
set shell=bash
set pumheight=10                                  " 補完等のポップアップ(pmenu)の最大同時表示数

set autoread                                      " 他で書き換えられたら自動で読み直す
augroup checktime                                 " 書き換えチェックの間隔を短く
  autocmd!
  autocmd BufEnter        * silent! checktime
  autocmd WinEnter        * silent! checktime
  autocmd CursorHold      * silent! checktime
  autocmd CursorHoldI     * silent! checktime
augroup END

set noswapfile                                    " スワップファイル作らない
set backspace=indent,eol,start                    " バックスペースでなんでも消せるように
set notitle                                       " vimを使ってくれてありがとう
set mouse=a                                       " ターミナルでマウスを使用できるようにする
set guioptions+=a
set ttymouse=xterm2
set ttyfast                                       " 高速ターミナル接続を行う
set formatoptions-=ro                             " コメント行からの改行で、次の行頭にコメントが挿入されないように
nnoremap Q <Nop>

set showcmd                                       " 右下にコマンド表示
set nowrap                                        " 行折り返しのoff
set whichwrap=b,s,<,>,[,]                         " 行頭, 行末での左右移動
set scrolloff=3                                   " スクロール時の画面端マージン
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis " 編集前と現時点のdiff http://nanasi.jp/articles/howto/diff/diff-original-file.html

" % でのdo...end移動など対応(標準添付)
source $VIMRUNTIME/macros/matchit.vim

" Undoの永続化
if has('persistent_undo')
  set undodir=$HOME/.vim/undodir/
  set undofile
endif

"Like Tab Editor
"tab sball                                        " 1Buffer == 1Tab ?
"au BufAdd,BufNewFile * nested tab sball
set switchbuf=usetab,newtab                       " Open tab if already file exists

" 挿入モードでカーソル形状を変更する (http://takaaki-kasai-tech.blogspot.jp/2014/03/change-cursor-shape-while-in-insert-mode-in-vim-on-mac.html)
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" let &t_SI = \"\]50;CursorShape=1\x7"
" let &t_EI = \"\]50;CursorShape=0\x7"
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策
" inoremap <ESC> <ESC>


"------------------------------------------------
" indent
"------------------------------------------------

set autoindent                                    " 自動でインデント
set smartindent                                   " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent                                       " Cプログラムファイルの自動インデントを始める
set expandtab                                     " タブ入力を複数の空白入力に置き換える
set tabstop=2                                     " 画面上でタブ文字が占める幅
set shiftwidth=2                                  " 自動インデントでずれる幅
set softtabstop=2                                 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅

set foldenable
set foldmethod=syntax                             " 文法ベースのFolding (zo, zc)
set foldlevelstart=10                             " デフォルトでは開いておく

"------------------------------------------------
" display
"------------------------------------------------

syntax enable                                     " ハイライト on
set number                                        " 行番号をつける
set showmatch                                     " 括弧の対応をハイライト
set matchtime=1                                   " 対応する括弧の表示時間
" set list                                        " 不可視文字表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,eol:$ " 不可視文字の表示形式
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
set cursorline                                    " カーソル行をハイライト
augroup cch                                       " カレントウィンドウにのみ罫線を引く
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END


"------------------------------------------------
" search
"------------------------------------------------

set wrapscan                                      " 最後まで検索したら先頭へ戻る
set ignorecase                                    " 大文字小文字無視
set smartcase                                     " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                                     " インクリメンタルサーチ
set hlsearch                                      " 検索文字をハイライト


"------------------------------------------------
" statusLine
"------------------------------------------------

set laststatus=2                                  " 常にステータスラインを表示
set ruler                                         " カーソルが何行目の何列目に置かれているかを表示する


"------------------------------------------------
" encoding
"------------------------------------------------

set fileformats=unix,dos,mac                              " 改行文字指定
set encoding=utf-8                                " デフォルトエンコーディング指定
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis


"------------------------------------------------
" color
"------------------------------------------------

colorscheme monokai                               " カラースキーマをmonokaiにする
set t_Co=256                                      " 256色にする
set t_Sf=[3%dm
set t_Sb=[4%dm


"------------------------------------------------
" complete
"------------------------------------------------

set wildmenu                                      " コマンド補完を強化
set wildchar=<tab>                                " コマンド補完を開始するキー
set wildmode=list:full                            " リスト表示，最長マッチ
set history=1000                                  " コマンド・検索パターンの履歴数
set complete+=k                                   " 補完に辞書ファイル追加


"------------------------------------------------
" backup
"------------------------------------------------

set nobackup
" set backup
" set backupdir=~/.vim/tmp/


"------------------------------------------------
" mapping
"------------------------------------------------

"Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :noh<CR>

" <C-j>をESCの代わりに
nnoremap <C-j><C-j> :noh<CR>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" カーソル下にNORのまま空行挿入
nnoremap <Space><Space> :<C-u>call append(expand('.'), '')<Cr>j

"JKで上下半画面スクロール
nmap <silent> J <C-d>
nmap <silent> K <C-u>

"<space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" Ex-modeでの<C-p><C-n>をzshのヒストリ補完っぽくする
cnoremap <C-p> <Up>
cnoremap <Up>  <C-p>
cnoremap <C-n> <Down>
cnoremap <Down>  <C-n>

" タブの作成
imap <Space>tt <ESC>:tabnew 
map  <Space>tt :tabnew 
imap <Space>tc <ESC>:tabclose
map  <Space>tc :tabclose

"タブ移動(gT押しにくいので)
map gr gT

"C-a C-aで全選択
inoremap <C-a><C-a> <Esc>ggvG$
nnoremap <C-a><C-a> ggvG$

" 連続インデント
vnoremap < <gv
vnoremap > >gv

" 不可視文字の表示切り替え, インデント付き=> <Space>i|I
noremap <Space>c :set list!<CR>
" wrapの切り替え
noremap <Space>w :set wrap!<CR>

" 行末にセミコロンを付与
nmap <Space>; A;<ESC>
imap <Space>; <ESC>A;

",Tでテンプレート展開、Tabで選択
nnoremap <silent> ,T :<C-u>Template
nnoremap <silent> <Space>T :<C-u>Template

" 現在開いているファイルのFull Pathを表示
command! ShowFullPath echo expand('%:p')

" 括弧などの自動補完 -> vim-smartinputへ移行
"inoremap , ,<Space>
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap ' ''<LEFT>
"inoremap \" \"\"<LEFT> FIXED: escape
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap \" \"zdi^V"<C-R>z^V"<ESC> FIXED: escape
"vnoremap ' "zdi'<C-R>z'<ESC>


"------------------------------------------------
" NeoComplete
"------------------------------------------------

let g:acp_enableAtStartup = 0                                       " AutoComplPopが競合するため無効化する
let g:neocomplete#enable_at_startup = 1                             " neocompleteの自動起動
let g:neocomplete#enable_smart_case = 1                             " smart caseを有効化する, 大文字が入力されるまで大小の区別を無視する
" let g:neocomplcache_enable_camel_case_completion = 1              " camel caseを有効化する, 大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_underbar_completion = 1                  " アンダーバー区切りの保管を有効化
let g:neocomplete#sources#syntax#min_keyword_length = 3             " シンタックスをキャッシュする最小文字長
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'              " neocompleteを自動的にロックするバッファ名, 相性が悪いプラグインを使う時用
let g:neocomplete#force_overwrite_completefunc=1                    " fix conflict : vim-rails

if !exists('g:neocomplete#sources#omni#input_patterns')             " オムニ補完の関数呼び出し, 動作重め
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ファイルタイプ別、使用するdictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'ruby' : $HOME.'/.vim/dict/ruby.dict'
        \ }

augroup neocomplete_config
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS      " Vimに用意されているオムニ補完を有効化
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" C-gで前回行われた補完をキャンセル
inoremap <expr><C-g>     neocomplete#undo_completion()
" C-lで、補完候補の中から共通する部分を補完
inoremap <expr><C-l>     neocomplete#complete_common_string()
"imap <expr><TAB> neocomplete#sources#snippets_complete#expandable() ? “\<Plug>(neocomplcache_snippets_expand)” : pumvisible() ? “\<C-n>” : “\<TAB>”

" ---
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

" function! s:my_cr_function()
  " return neocomplete#smart_close_popup() . \"\<CR>"                  " 確実にポップアップを削除
  " ' return pumvisible() ? neocomplete#close_popup() : \"\<CR>"       " 現在選択している候補を確定
" endfunction
" ---

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplete#smart_close_popup()."<C-h>"       " C-hやBSを押した時に確実にポップアップを削除
"inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" C-hやBSを押した時に確実にポップアップを削除
imap <expr><C-h> neocomplete#smart_close_popup()."\<Plug>(smartinput_BS)"
imap <expr><BS> neocomplete#smart_close_popup()."\<Plug>(smartinput_C-h)"
" imap <expr><C-e> neocomplete#smart_close_popup()

" C-yやC-eを押した時に、現在選択している候補をキャンセルし、ポップアップを閉じる
inoremap <expr><C-y>  neocomplete#smart_close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : \"\<Space>"


"------------------------------------------------
" NeoSnippet
"------------------------------------------------

" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibility = 1
" let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet.vim/autoload/neosnippet/snippets' " 本体に入っているsnippet
let s:my_snippet = '~/.vim/mysnippets'
"let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
let g:neosnippet#snippets_directory = s:my_snippet


"------------------------------------------------
" SexyScroll
"------------------------------------------------

"! let g:sexyscroll_update_display_per_milliseconds = 11
" let g:sexyscroll_map_recommended_settings = 0
"! nnoremap <silent> <buffer> <C-d> :<C-u>call g:sexyscroll('down', &scroll, 150)<CR>
"! nnoremap <silent> <buffer> <C-u> :<C-u>call g:sexyscroll('up', &scroll, 150)<CR>
" noremap <silent> <C-f> :<C-u>call g:sexyscroll('down', &scroll * 2, 200)<CR>
" noremap <silent> <C-b> :<C-u>call g:sexyscroll('up', &scroll * 2, 200)<CR>
"J, Kで半ページ送り
" noremap <silent> J :<C-u>call g:sexyscroll('down', &scroll, 200)<CR>
" noremap <silent> K :<C-u>call g:sexyscroll('up', &scroll, 200)<CR>


"------------------------------------------------
" Sexy_Scroller
"------------------------------------------------
" let g:SexyScroller_ScrollTime = 10
let g:SexyScroller_CursorTime = 8
noremap <Space>ss :SexyScrollerToggle<CR>


"------------------------------------------------
" Switch.vim (true <-> falseを切り替えたりするプラグイン)
"------------------------------------------------

nnoremap <Space>- :Switch<cr>


"------------------------------------------------
" NerdCommenter
"------------------------------------------------

let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle


"------------------------------------------------
" NerdTree
"------------------------------------------------

",nでNERDTree起動
"nnoremap <silent> ,n :<C-u>NERDTree<CR>
map ,n <plug>NERDTreeTabsToggle<CR>
map <Space>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowBookmarks=1
"let NERDTreeMapOpenInTab='<ENTER>'

" ReMapping
let NERDTreeMapJumpNextSibling = 'J'
let NERDTreeMapJumpPrevSibling = 'K'
let NERDTreeMapJumpLastChild = '<C-j>'
let NERDTreeMapJumpFirstChild = '<C-k>'

"------------------------------------------------
" YankRing
"------------------------------------------------

" ,yでyank履歴表示
nnoremap <silent> ,y :<C-u>YRShow<CR>
nnoremap <silent> <Space>y :<C-u>YRShow<CR>
" let g:yankring_history_dir = '~/.vimcache/'
let g:yankring_history_file = '.yankring'


"------------------------------------------------
" vim-smartinput
"------------------------------------------------

call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<BS>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')


"------------------------------------------------
" vim-smartinput-endwise
"------------------------------------------------
call smartinput_endwise#define_default_rules()


"------------------------------------------------
" quickrun
"------------------------------------------------

",qでquickrun起動
nnoremap <silent> ,q :<C-u>QuickRun<CR>
nnoremap <silent> <Space>q :<C-u>QuickRun<CR>

" set splitbelow                                      " 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
" set splitright

" quickrunのオプション設定
" 非同期処理を行い, 実行時間を計測する
let g:quickrun_config = {
\   '_' : {
\       'runner' : 'vimproc',
\       'runner/vimproc/updatetime' : 60,
\       'hook/time/enable' : 1,
\       'outputter/buffer/split' : ':botright 8sp',
\       'outputter/buffer/into' : 1,
\       'outputter/buffer/close_on_empty' : 1
\   },
\   'html' : {
\       'command' : 'open',
\       'exec'    : '%c %s',
\       'outputter' : 'browser',
\       'hook/time/enable' : 0
\   },
\   'processing' : {
\     'command': 'processing-java',
\     'exec': '%c --sketch=%s:p:h/ --output=/tmp/processing_quickrun --run --force'
\   }
\}

"------------------------------------------------
" unite
"------------------------------------------------

nnoremap <silent> ,ub :<C-u>Unite buffer<CR>                                                                  " ,ubでバッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>                                    " ,ufでファイル一覧
nnoremap <silent> ,ug :<C-u>Unite -buffer-name=register register<CR>                                          " ,urでレジスタ一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>                                                                " ,umで最近使用したファイル一覧
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>                                                         " ,uuでバッファと最近使用したファイル一覧
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>           " ,uaで全部乗せ
nnoremap <silent> ,rm :<C-u>Unite rails/model<CR>
nnoremap <silent> ,rv :<C-u>Unite rails/view<CR>
nnoremap <silent> ,rc :<C-u>Unite rails/controller<CR>

"autocmd FileType unite call s:unite_my_settings()                                                             " 以下オリジナル設定
"function! s:unite_my_settings()
"  nmap <silent><buffer> <ESC><ESC> q                                                                          " ESCキーを2回押すと終了する
"  imap <silent><buffer> <ESC><ESC> <ESC>q
"endfunction


"------------------------------------------------
" lightline
"------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified' ],
      \             [ 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }


"------------------------------------------------
" taglist.vim
"------------------------------------------------

"set tags = tags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'    " ctagsのコマンド
let Tlist_Show_One_File = 1                     " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                  " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                   " taglistのウインドウだけならVimを閉じる

" \lでtaglistウインドウを開いたり閉じたり出来るショートカット
map <silent> ,l :TlistToggle<CR>

"let Tlist_Auto_Update = 1
let Tlist_Use_SingleClick = 1
"let Tlist_WinWidth = 30
"let Tlist_Show_Menu = 0
"let Tlist_Display_Tag_Scope = 0
"let Tlist_Display_Prototype = 0
"let Tlist_Compact_Format = 1


"------------------------------------------------
" tagbar
"------------------------------------------------


"------------------------------------------------
" vim-multiple-cursors
"------------------------------------------------
"TODO: C-nからC-mに変える？

"------------------------------------------------
" vim-rails
"------------------------------------------------

let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  "nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<CR>
  nnoremap <buffer><Space>c :Rcontroller<CR>
  nnoremap <buffer><Space>v :Rview<CR>
  "nnoremap <buffer><Space>p :Rpreview<CR>
endfunction
 
aug VimRailsSetup
  au!
  au User Rails call SetUpRailsSetting()
aug END
 
aug VimRailsDictSetting
  au!
aug END

"autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
"autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
"autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
"autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip


"------------------------------------------------
" Emmet
"------------------------------------------------

let g:user_emmet_install_global = 0
augroup emmet_install
  autocmd!
  autocmd FileType html,css,php,eruby EmmetInstall
augroup END

let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_expandabbr_key = '<C-e><C-e>'
let g:user_emmet_mode = 'inv'
let g:user_emmet_settings = {
      \'indentation' : '  ',
      \'lang' : 'ja'
      \}


"------------------------------------------------
" syntastic
"------------------------------------------------

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2 "always:1
" let g:syntastic_always_populate_loc_list = 1
noremap <Space>er :Errors<CR>
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }
" let g:syntastic_go_checkers = ['go', 'golint']


"------------------------------------------------
" Mou
"------------------------------------------------
let g:mou_dir = '/Applications/Mou.app'

"------------------------------------------------
" Vim Browser Reload
"------------------------------------------------
let g:returnApp = 'iTerm'
command! -bar ChromeReload silent !osascript -e 'tell application "Google Chrome" to reload active tab of window 1'

"------------------------------------------------
" vim-gitgutter
"------------------------------------------------
" for performance
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
nnoremap <Space>gg :<C-u>GitGutterToggle<CR>
nnoremap <Space>gs :<C-u>GitGutterSignsToggle<CR>
nnoremap <Space>gh :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <Space>gn :<C-u>GitGutterNextHunk<CR>
nnoremap <Space>gp :<C-u>GitGutterPrevHunk<CR>

" vim-emoji
" silent! if emoji#available()
  " let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  " let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  " let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  " let g:gitgutter_sign_modified_removed = emoji#for('collision')
" endif

"------------------------------------------------
" QuickHL
"------------------------------------------------
nmap <Space>h <Plug>(quickhl-manual-this)
xmap <Space>h <Plug>(quickhl-manual-this)
nmap <Space>H <Plug>(quickhl-manual-reset)
xmap <Space>H <Plug>(quickhl-manual-reset)

"------------------------------------------------
" SplitJoin
"------------------------------------------------
nmap <Space>sjj :SplitjoinJoin<cr>
nmap <Space>sjs :SplitjoinSplit<cr>

"------------------------------------------------
" Goyo
"------------------------------------------------

nmap <Space>goy :Goyo<cr>
nmap <Space>gow :let g:goyo_width=90<cr>
nmap <Space>goW :let g:goyo_width=150<cr>

let g:goyo_width = 90

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  
  NERDTreeClose
  Limelight
  GitGutterDisable
  " call lightline#disable()
  " set statusline=
  " set wrap
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=3
  
  NERDTree
  " Limelight!
  call limelight#execute(1) " E477: No ! allowed
  GitGutterEnable
  " call lightline#enable()
endfunction

augroup goyo_config
  autocmd!
  autocmd! User GoyoEnter
  autocmd! User GoyoLeave
  autocmd  User GoyoEnter nested call <SID>goyo_enter()
  autocmd  User GoyoLeave nested call <SID>goyo_leave()
augroup END


"------------------------------------------------
" limelight.vim
"------------------------------------------------
let g:limelight_default_coefficient = 0.8

"------------------------------------------------
" Markdown
"------------------------------------------------
let g:vim_markdown_folding_disabled=1
" autocmd Filetype mkd nmap <Tab> <S-v>><ESC>
" autocmd Filetype mkd nmap <S-Tab> <S-v><<ESC>
" autocmd Filetype mkd imap <Tab> <ESC><S-v>><ESC>i
" autocmd Filetype mkd imap <S-Tab> <ESC><S-v><<ESC>i
"----
" let g:markdown_enable_mappings = 1
" let g:markdown_enable_insert_mode_mappings = 1
" let g:markdown_enable_folding = 0

"------------------------------------------------
" previm
"------------------------------------------------
noremap <Space>md :PrevimOpen<CR>

"------------------------------------------------
" clever-f
"------------------------------------------------
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_chars_match_any_signs = ';'

"------------------------------------------------
" javascript-libraries-syntax.vim
"------------------------------------------------
let g:used_javascript_libs = 'jquery,angularjs,angularui'
" Usage 
"   $ cat .local-vimrc
"   autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
"   autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
"   autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 0

"------------------------------------------------
" vim-addon-local-vimrc
"------------------------------------------------
let g:local_vimrc = {'names':['.local-vimrc'],'hash_fun':'LVRHashOfFile'}

"------------------------------------------------
" vim-coffee-script
"------------------------------------------------
" 保存時にコンパイル
" autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"------------------------------------------------
" vim-indent-guides
"------------------------------------------------
nnoremap <Space>i :IndentGuidesEnable<CR>:set list<CR>
nnoremap <Space>I :IndentGuidesDisable<CR>:set nolist<CR>

let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_guide_size=1

"------------------------------------------------
" fontzoom
"------------------------------------------------
let g:fontzoom_no_default_key_mappings=1

"------------------------------------------------
" vim-arduino-ino
"------------------------------------------------
let g:vim_arduino_map_keys = 0
let g:vim_arduino_auto_open_serial = 0
nnoremap <Space>ac :call ArduinoCompile()<CR>
nnoremap <Space>ab :call ArduinoCompile()<CR>
nnoremap <Space>ad :call ArduinoDeploy()<CR>
nnoremap <Space>au :call ArduinoDeploy()<CR>
nnoremap <Space>as :call ArduinoSerialMonitor()<CR>

"------------------------------------------------
" undotree
"------------------------------------------------
nnoremap <Space>u :UndotreeToggle<CR>
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=30
let g:undotree_DiffpanelHeight=5
let g:undotree_SetFocusWhenToggle=1

"------------------------------------------------
" ctrlp
"------------------------------------------------
let g:ctrlp_map = '<Space>p'                         " Default: <c-p>
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_use_migemo = 1

" Spaceで新規タブで開く (tmuxとの衝突回避)
let g:ctrlp_prompt_mappings = { 'AcceptSelection("t")': ['<c-t>', '<Space>'] }

function! MigemoMatch(items, str, limit, mmode, ispath, crfile, regex)
  let tmp = tempname()
  try
    if a:str =~? '^\s*$'
      return a:items
    endif
    call writefile(split(iconv(join(a:items, "\n"), &encoding, 'utf-8'), "\n"), tmp)
    return split(iconv(system(
    \  printf('migemogrep %s %s',
    \    shellescape(a:str),
    \    shellescape(tmp))), 'utf-8', &encoding), "\n")
  catch
    return []
  finally
    call delete(tmp)
  endtry
endfunction
" let g:ctrlp_match_func = {'match' : 'MigemoMatch' }

"------------------------------------------------
" ctrlp-funky
"------------------------------------------------
nnoremap <Space>PF :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

"------------------------------------------------
" incsearch.vim
"------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"------------------------------------------------
" vim-anzu
"------------------------------------------------
" map   n <Plug>(incsearch-nohl-n)
" map   N <Plug>(incsearch-nohl-N)
" nmap  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
" nmap  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
" nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

"------------------------------------------------
" googletranslate
"------------------------------------------------
let g:googletranslate_userip = '0.0.0.0'

"------------------------------------------------
" vim-move
"------------------------------------------------
let g:move_map_keys = 0
vmap <C-h> <Plug>MoveBlockUp
vmap <C-l> <Plug>MoveBlockDown
" nmap <A-j> <Plug>MoveLineDown
" nmap <A-k> <Plug>MoveLineUp

"------------------------------------------------
" vim-go
"------------------------------------------------
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0

"------------------------------------------------
" vim2hs
"------------------------------------------------
" let g:haskell_conceal = 0
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync
