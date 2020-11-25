let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')
" colorscheme
Plug 'arcticicestudio/nord-vim'

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Auto close brackets and HTML tags
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Brackets colorize and lua colorizer
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " Git status in NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install
