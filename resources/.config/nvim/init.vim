set nocompatible

set encoding=utf-8

set autoindent
set backspace=indent,eol,start
set backup
set clipboard=unnamed
set colorcolumn=80
set cursorline
set expandtab
set gdefault
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linespace=0
set list
set magic
set noerrorbells
set nojoinspaces
set nowrap
set number
set relativenumber
set scrolljump=5
set scrolloff=3
set shiftwidth=2
set showmatch
set showmode
set smartcase
set spell spelllang=en_us
set tabstop=2
set textwidth=0
set softtabstop=2
set wildmenu
set wildmode=list:longest,full

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/vader.vim'

  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'inside/vim-grep-operator'
  Plug 'junegunn/vim-plug'
  Plug 'kana/vim-textobj-user'
  Plug 'kien/ctrlp.vim'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-surround'

  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'

  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-endwise'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'tpope/vim-fugitive'

  Plug 'hail2u/vim-css3-syntax'

  Plug 'ekalinin/Dockerfile.vim'

  Plug 'elixir-lang/vim-elixir'

  Plug 'fatih/vim-go'

  Plug 'mattn/emmet-vim'

  Plug 'kchmck/vim-coffee-script'
  Plug 'leafgarland/typescript-vim'

  Plug 'StanAngeloff/php.vim'

  Plug 'gabebw/vim-spec-runner'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'ngmy/vim-rubocop'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-liquid'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rails'
  Plug 'rainerborene/vim-reek'

  Plug 'christoomey/vim-tmux-runner'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'edkolev/tmuxline.vim'
call plug#end()

" Search buffer for word under cursor
nmap // viwy/<c-r>"<cr>" <F37>

" clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Moving around
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_

" Replace all occurrences of word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Break comma delimited strings to newline at cursor
nmap <silent> <Leader>br :s/, /\=",\r " . substitute(substitute(getline('.'), " :.*$", "", "g"), ".", " ", "g")/g<CR>"

" Make splits a bit more manageable.
nnoremap <Leader>1 :vs<CR><C-w>l
nnoremap <Leader>2 :split<CR><C-w>j
nnoremap <C-Up> :bn<CR>
nnoremap <C-Down> :bp<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Rubocop
let g:vimrubocop_config = '~/.rubocop.yml'

let g:syntastic_ignore_files=['\.html$', '\c\.h$', '\.css$']

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamecollapse=1
" let g:airline#extensions#tabline#enabled = 1

let g:spec_runner_dispatcher = 'call VtrSendCommand("bundle exec {command}")'
let g:VtrClearSequence = 'clear'

map <leader>t <plug>RunCurrentSpecFile
map <leader>s <plug>RunFocusedSpec
map <leader>l <plug>RunMostRecentSpec

" VtrRunner
nmap <leader>p :VtrKillRunner<CR>
nmap <leader>o :VtrOpenRunner({'orientation': 'h', 'percentage': 30})<CR>

set grepprg=git\ grep\ -n\ $*

let g:grep_operator = 'Ag'

nmap <Leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <Leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <Leader><Leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <Leader><Leader>g <Plug>GrepOperatorWithFilenamePrompt

" Reek `:RunReek`
let g:reek_always_show = 1
let g:reek_line_limit = 1000

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Open file menu
nnoremap <Leader>m :CtrlP<CR>

" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>

" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path=0

if executable('ag')
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

let g:netrw_liststyle=3

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.map
set wildignore+=*/doc/*,*/public/assets/*

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.nvim'
  let dir_list = {
                  \ 'backup': 'backupdir',
                  \ 'views': 'viewdir',
                  \ 'swap': 'directory' }

  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif

    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction

call InitializeDirectories()

map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

let NERDTreeIgnore=['\.git$', '\.DS_Store']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Comment blocks from visual mode
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

" Tab/Shift+Tab blocks in visual mode
vnoremap <Tab> >
vnoremap <S-Tab> <

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                            \ --ignore .git
                            \ --ignore .svn
                            \ --ignore .hg
                            \ --ignore .DS_Store
                            \ -g ""'

" set background=dark
colorscheme Tomorrow-Night

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

hi SpellBad  cterm=undercurl  gui=undercurl
