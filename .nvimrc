set nocompatible   " must be first line

let mapleader=','

set encoding=utf-8
scriptencoding utf-8

set autoindent                 " Indent at the same level of the previous line
set backspace=indent,eol,start " Backspace for dummies
set backup                     " Backups are nice ...
set colorcolumn=80             " Show 80th column.
set cursorline                 " Highlight current line
set esckeys                    " Allow cursor keys in insert mode
set expandtab                  " Tabs are spaces, not tabs
set gdefault                   " Global search by default
set hidden                     " Allow leaving modified buffers
set history=100                " Store lotsof history (default is 20)
set hlsearch                   " Highlight search terms
set ignorecase                 " Case insensitive search by default
set incsearch                  " Highlight search text as it is typed
set laststatus=2               " Always show the status
set linespace=0                " No extra spaces between rows
set list                       " Displays whitespace
set listchars=tab:``,trail:`,space:.,extends:#,nbsp:`
set magic                      " Allows pattern matching with special characters
set noerrorbells               " Disable error bells
set nojoinspaces               " Do not join lines with a space
set nowrap                     " No wraping long lines
set number                     " Line numbers
set relativenumber             " Relative line numbers
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor
set shiftwidth=2               " Use indents of 2 spaces
set showmatch                  " Highlight the matching bracket or brace
set showmode                   " Display the current mode
set smartcase                  " Case sensitive when uc present
set spell spelllang=en_us      " Spell checking
set tabstop=2                  " Indentation every 2 columns
set textwidth=0                " No linewrapping
set softtabstop=2              " Let backspace delete indent
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.

if has('persistent_undo')
  set undofile       "Persistent undo
  set undolevels=500 " Maximum number of changes that can be undone
  set undoreload=500 " Maximum number lines to save for undo on a buffer reload
endif

call plug#begin('~/.nvim/bundle')
  " Functionality
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'inside/vim-grep-operator'
  Plug 'junegunn/vim-plug'
  Plug 'kana/vim-textobj-user'
  Plug 'kien/ctrlp.vim'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-surround'

  " UI
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'

  " General
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-endwise'

  " Git
  Plug 'tpope/vim-fugitive'

  " CSS
  Plug 'hail2u/vim-css3-syntax'

  " Docker

  " Elixir
  Plug 'elixir-lang/vim-elixir'

  " Go
  Plug 'fatih/vim-go'

  " HTML
  Plug 'mattn/emmet-vim'

  " Javascript
  Plug 'kchmck/vim-coffee-script'

  " PHP
  Plug 'StanAngeloff/php.vim'

  " Ruby
  Plug 'gabebw/vim-spec-runner'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'ngmy/vim-rubocop'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-liquid'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rails'

  " tmux
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

let NERDTreeIgnore=['\.git$']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                            \ --ignore .git
                            \ --ignore .svn
                            \ --ignore .hg
                            \ --ignore .DS_Store
                            \ -g ""'

" let base16colorspace=256
colorscheme Tomorrow-Night

let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

hi SpellBad  cterm=undercurl  gui=undercurl

hi ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
