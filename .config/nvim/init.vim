" My Neovim Settings "

" Source plugins config

source $HOME/.config/nvim/plugins.vim

" Remap leader key
let g:mapleader=','

" no compatibility with vi
set nocompatible

" no backup files
set nobackup
set noswapfile
set nowritebackup

" Create the `tags` file
command! MakeTags !ctags -R .

" hide buffers
set hidden

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" update time
set updatetime=300

" Mouse support
set mouse=a
set mousemodel=popup

" syntax enable and plugin
syntax enable
filetype plugin on
filetype indent on
set autoindent
set smartindent

" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,list:full
set path+=**

" Set typing behaviour
set backspace=indent,eol,start
set showmatch
set matchpairs+=<:>,「:」

" Spaces, Tab and format config
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set wrap
set linebreak
set completeopt=menu,preview
set list
set list listchars=tab:»·,trail:·,nbsp:·
set showbreak=↪
set showbreak=...

" Searching config
set incsearch
set hlsearch
set ignorecase
set smartcase

" Misc
set autowrite
set autoread
set history=100
set foldenable
set foldlevelstart=20
set foldnestmax=20
set foldmethod=indent
set ttyfast
set shell=$SHELL
set textwidth=80
set colorcolumn=+1
set undofile undodir=~/.config/nvim/undo undolevels=9999
set complete=.,b,u,]
set modelines=0
set nomodeline
set nojoinspaces
set diffopt+=vertical
let no_buffers_menu=1

au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3


"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details

function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

function! s:custom_jarvis_colors()
  " coc.nvim color changes
  hi link CocErrorSign WarningMsg
  hi link CocWarningSign Number
  hi link CocInfoSign Type

  " Make background transparent for many things
  hi Normal ctermbg=NONE guibg=NONE
  hi NonText ctermbg=NONE guibg=NONE
  hi LineNr ctermfg=NONE guibg=NONE
  hi SignColumn ctermfg=NONE guibg=NONE
  hi StatusLine guifg=#D8DEE9 guibg=#4C566A
  hi StatusLineNC guifg=#2E3440 guibg=#2E3440

  " Try to hide vertical spit and end of buffer symbol
  hi VertSplit gui=NONE guifg=#17252c guibg=#17252c
  hi EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

  " Customize NERDTree directory
  hi NERDTreeCWD guifg=#8FBCBB

  " Make background color transparent for git changes
  hi SignifySignAdd guibg=NONE
  hi SignifySignDelete guibg=NONE
  hi SignifySignChange guibg=NONE

  " Highlight git change signs
  hi SignifySignAdd guifg=#8FBCBB
  hi SignifySignDelete guifg=#BF616A
  hi SignifySignChange guifg=#B48EAD
endfunction

autocmd! ColorScheme * call TrailingSpaceHighlights()
autocmd! ColorScheme nord call s:custom_jarvis_colors()

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" UI
" Editor theme
set background=dark
try
  colorscheme deus
catch
  colorscheme slate
endtry

let no_buffers_menu=1
set guioptions=egmrti
set number
set relativenumber
set numberwidth=5
set ruler
set showcmd
set lazyredraw
set signcolumn=yes
set laststatus=2
set cmdheight=1
set shortmess+=c
set splitright
set splitbelow
set scrolloff=999
set t_Co=256
set termguicolors

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=80
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Lang settings
"*****************************************************************************

" javascript/typescript/react/web-dev
let g:javascript_enable_domhtmlcss = 1

autocmd FileType scss setl iskeyword+=@-@

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .{prettier,eslint}rc set filetype=json
au BufNewFile,BufRead *.prisma setfiletype graphql

" set filetypes as javascriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" syntax highlight for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

augroup vimrc-web
  autocmd!
  autocmd FileType javascript,typescript,json,javascriptreact,typescriptreact,html,css,scss,yaml setlocal tabstop=2 shiftwidth=2 shiftround expandtab softtabstop=2
augroup END

" Javascript/Typescript/React configs

" tsx highlight configs
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2f
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66


"*****************************************************************************
"" Default mappings - without plugins mappings
"*****************************************************************************

" terminal emulation
nnoremap <silent> <Leader>sh :terminal<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"Move Around Panels
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
