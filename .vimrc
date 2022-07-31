"Dependencies to install: git, ctags, nodejs, ripgrep
"
set expandtab
"default indents
set tabstop=2
set shiftwidth=2
set softtabstop=2

"set foldmethod=syntax

"setting the plugins for specific filetypes
filetype plugin indent on
"indents per file
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

set autoindent
"set smartindent
set showmatch

"Search settings
set incsearch
set ignorecase
set smartcase

"Enable 256 colors
set t_Co=256
"colorscheme darkblue
set termguicolors

"scroll wihout going to bottom off the screen
set scrolloff=5

"Add line numbering
set number

"shows command while being typed
set showcmd

"Set system clipboard as default clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamed
endif

"Netrw explorer specific settings
let g:netrw_keepdir=0
let g:netrw_winsize = 80
let g:netrw_altv=1
let g:netrw_browse_split = 4

"Enable per project vimrc configuration
set exrc
set secure

"Show invisible characters
set showbreak=↪\  
set list lcs=tab:\>\ ,trail:·

set nohlsearch

set number relativenumber

"customize spelling mistakes appearance

"hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
"hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
"hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
"hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

"normal mode: save
nnoremap <c-s> :w<CR>
"insert mode: escape to normal and save
inoremap <c-s> <Esc>:w<CR>
"visual mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR>

"Disables automatic comments on next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"enable automatic visual mode on mouse select
set mouse=a

"Add underline and blink cursor on input mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"""""""" Enable Plugins  """"""""""
" install plug if not existing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"""" TAG MANAGEMENT AND AUTOCOMPLETION

"manage ctags generation
Plug 'ludovicchabant/vim-gutentags'

"manages autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"tags sidewindow
Plug 'preservim/tagbar'

"""" VERSION CONTROL

"git integration plugin
Plug 'tpope/vim-fugitive'

"showing gimgutter
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'

"""" SHORTCUTS

"Snippets integration
Plug 'SirVer/ultisnips'
"Snippets collection
Plug 'honza/vim-snippets'

"commenting stuff
Plug 'preservim/nerdcommenter'

"closing quotes and parentesis
Plug 'Raimondi/delimitMate'

"Emmet
Plug 'mattn/emmet-vim'

"surrounding stuff
Plug 'tpope/vim-surround'

"PhpDocumentor
Plug 'tobyS/pdv'

"Fuzzy files finder
Plug 'ctrlpvim/ctrlp.vim'

"Search in files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Mutache syntax support for VIM
"Plug 'tobyS/vmustache'

"""" CODE QUALITY

"asynchornous liting
Plug 'dense-analysis/ale'

"shows error indicators on the status line
Plug 'maximbaz/lightline-ale'

"Universal debugger
Plug 'vim-vdebug/vdebug'

"""" VISUAL

"Colorscheme
Plug 'artanikin/vim-synthwave84'

"shows vertical lines on code indented with spaces
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'

"custom status line
Plug 'itchyny/lightline.vim'
"airline is too heavy
" Plug 'vim-airline/vim-airline'

"""" CONVENIENCE

"prevents from closing the window when exiting buffer
"Plug 'moll/vim-bbye'

"project startup page
Plug 'mhinz/vim-startify'

"session management
Plug 'thaerkh/vim-workspace'

call plug#end()

"""""""" Plugin Configuration """"""""""

"pdv
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
"nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

"Emmet
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"Utilsnips
"Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"show hidden files in ctrlp
let g:ctrlp_show_hidden=1

"Vdebug port
let g:vdebug_options = {
  \ 'port' : 9003
  \ }

"Setting synthwave colors after plugin is loaded
colorscheme synthwave84

"Linting and indentation options 
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'html': ['prettier'],
\ 'php': ['php_cs_fixer'],
\ 'smarty': ['prettier'],
\ }
let g:ale_liters = {
\ 'php': ['phpcs', 'phpstan'],
\ }
let g:ale_linter_aliases = {
\ 'smarty': ['html'],
\ }
"let g:ale_fix_on_save = 1

"tagbar setup
nmap <F8> :TagbarToggle<CR>

"setting extra space to the Nerdcommenter comments
let NERDSpaceDelims=1
let g:NERDCompactSexyComs = 0

"Enable syntax highlighting
"let g:rainbow_active = 1

"configured so that gimgutter updates faster
set updatetime=500

"enable indent guides on startup
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 0
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 1

"ale-lightline configs
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
     \            [ 'percent' ],
     \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

"workspace config
let g:workspace_autocreate = 1
