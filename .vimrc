filetype plugin indent on
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable
if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')
  Plug 'itchyny/lightline.vim'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'branch': 'release/1.x',
    \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'vue',
      \ 'lua',
      \ 'python',
      \ 'html',
      \ 'swift' ] }
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang support
  Plug 'davidhalter/jedi-vim' " Autocomplete/syntax for python
  Plug 'jmcantrell/vim-virtualenv' " User virtualenv for current python interpretor
  Plug 'mitsuhiko/vim-jinja' " Jinja support for vim
  Plug 'nvie/vim-flake8' " Linter for python code
  Plug 'chr4/nginx.vim' " Nginx hightlighting

call plug#end()

" Prettier options
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'

set encoding=UTF-8

" Folding configs
set foldmethod=syntax
set foldnestmax=5
set foldlevelstart=1

set number " enable showing of numbers
" set relativenumber " relative numbers for better navigation
set directory=~/.vim/backup " Move .swp files to home directory
