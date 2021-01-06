" My Neovim Settings "

" Source plugins config

source $HOME/.config/nvim/plugins.vim

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

" Remap leader key
let g:mapleader=','

" Clipboard config
set clipboard=unnamedplus

" update time
set updatetime=100

" Mouse support
set mouse=a

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" syntax enable and plugin
syntax enable
filetype plugin on
filetype indent on
set autoindent
set smartindent

" UI
set background=dark
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

" vim-gitgutter configs
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

let g:airline_powerline_fonts = 1

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

" Editor theme
set background=dark
try
  colorscheme nord
catch
  colorscheme slate
endtry

" Display all matching files when we tab complete
set wildmenu
set wildmode=longest,list:longest
set path+=**

" Set typing behaviour
set backspace=indent,eol,start
set showmatch
set matchpairs+=<:>,「:」

" Spaces, Tab and format config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set completeopt=menu,preview
set list
set list listchars=tab:»·,trail:·,nbsp:·
set showbreak=↪
set showbreak=...

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.ts, *.tsx, *.jsx, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

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
set foldlevelstart=10
set foldnestmax=10
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

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Use mouse to select and resize windows, etc.
if has('mouse')
    set mouse=nv  " Enable mouse in several mode
    set mousemodel=popup  " Set the behaviour of mouse
endif

" Key Mappings and plugins settings

" Move Around Panels
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" === vim-better-whitespace === "
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_verbosity=1
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Nerdtree shorcuts and settings === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeMapOpenSplit='<F3>'
let g:NERDTreeMapPreview='<F4>'
let g:plug_window = 'noautocmd vertical topleft new'
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Colorize Brackets
let g:rainbow_active = 1

" Highlight python code
let python_highlight_all=1

" lua colorizer
lua require'plug-colorizer'

" fugitive.git
" ========================================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>
" The tree buffer makes it easy to drill down through the directories of your
" git repository, but it’s not obvious how you could go up a level to the
" parent directory. Here’s a mapping of .. to the above command, but
" only for buffers containing a git blob or tree
autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Every time you open a git object using fugitive it creates a new buffer.
" This means that your buffer listing can quickly become swamped with
" fugitive buffers. This prevents this from becomming an issue:

autocmd BufReadPost fugitive://* set bufhidden=delete

" closetags plugin config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']

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
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" set filetypes as javascriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" syntax highlight for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:javascript_plugin_jsdoc = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:typescript_indent_disable = 1

let g:vim_jsx_pretty_disable_tsx = 1

" Coc settings
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-styled-components']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" show documentation for the word under the cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
