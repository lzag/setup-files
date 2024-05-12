"Dependencies to install: git, universal-ctags, nodejs (snap best), ripgrep, nerd fonts, cspell (npm), fd-find
"qneed to install nerd font: download nerd font - unzip to ~/.fonts and run 'fc-cache -fv'
"install coc-phpls and other language servers
"make sure to set alternatives to vim as vim.basic and not vim.gtk, otherwise git freezes
set expandtab
"default indents
set tabstop=2
set shiftwidth=2
set softtabstop=2

"set window title to the name of the file being edited
set title

" rounds indent to shift withd when shifting
set shiftround

set foldmethod=indent
set foldlevel=100

"setting the plugins for specific filetypes
filetype plugin indent on
"indents per file
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType fugitive setlocal nonumber norelativenumber
"set syntax hightligh for rare files
autocmd BufNewFile,BufRead *.lock set syntax=json
autocmd BufNewFile,BufRead *.env.* set syntax=sh

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

"mark max length column
set colorcolumn=121

"enable signcolumn always
set signcolumn=yes

"scroll wihout going to bottom off the screen
set scrolloff=8

"shows command while being typed
set showcmd

"set command line to 2 lines
set cmdheight=2

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

" enable spell checking
set spell spelllang=en_us

"Show invisible characters
set showbreak=↪\  
set list lcs=tab:\>\ ,trail:·

set nohlsearch

" add line numbering and set it to relative numbering
set number relativenumber

" enable autocomplete menu in command line
set wildmenu
set wildmode=longest:full,full

"make sure status line appears with single windows
set laststatus=2

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
"select all
map <c-a> ggVG

"Disables automatic comments on next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"enable automatic visual mode on mouse select
set mouse=a

" automatically show changes if file changes from another place
set autoread

"IndenLine
" show quotes in json files
" let g:vim_json_conceal=0
let g:vim_json_syntax_conceal = 0
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_fileTypeExclude = ['startify', 'tagbar']
nnoremap <leader>m :SClose<CR>

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

"Github Copilot
Plug 'github/copilot.vim'

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
"Dependency - mutache syntax support for VIM
Plug 'tobyS/vmustache'

"Search in files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"add to .bashrc to include the hidden files
" export FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --exclude .git'
" alternative is this one, but it's more basic
"Plug 'ctrlpvim/ctrlp.vim'

"""" CODE QUALITY

"asynchornous liting
Plug 'dense-analysis/ale'

"shows error indicators on the status line
Plug 'maximbaz/lightline-ale'

"xDebug pluging for PHP debugging
Plug 'vim-vdebug/vdebug'

"execute tests from vim
Plug 'vim-test/vim-test'

"universal debugger
Plug 'puremourning/vimspector'

"""" VISUAL

"Colorschemes
Plug 'artanikin/vim-synthwave84'
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'sainnhe/edge'

"shows vertical lines on code indented with spaces
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'

"custom status line
Plug 'itchyny/lightline.vim'
"airline is too heavy
" Plug 'vim-airline/vim-airline'

"file icons for nerdtree
Plug 'ryanoasis/vim-devicons'

"highlight CSV files
Plug 'mechatroner/rainbow_csv'

"highlight for log files
Plug 'mtdl9/vim-log-highlighting'

"""" CONVENIENCE

"prevents from closing the window when exiting buffer
"Plug 'moll/vim-bbye'

"project startup page
Plug 'mhinz/vim-startify'

"session management
"Plug 'thaerkh/vim-workspace'

"file tree navigation
Plug 'preservim/nerdtree'

"Enable multiple cursor editing
Plug 'mg979/vim-visual-multi'

"Flating terminal
Plug 'voldikss/vim-floaterm'

"""" DATABASE

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
"""" SYNTAX SUPPORT

" php syntax support
" Plug 'StanAngeloff/php.vim'

" javascript syntax support
" Plug 'pangloss/vim-javascript'

" typescript syntax support
" Plug 'leafgarland/typescript-vim'

" kotlin syntax support
" Plug 'udalov/kotlin-vim'

" jsx syntax support
" Plug 'maxmellon/vim-jsx-pretty'

"language systax support
Plug 'sheerun/vim-polyglot'

"""" NOTES

Plug 'vimwiki/vimwiki'

call plug#end()

"""""""" Plugin Configuration """"""""""

"pdv
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <silent> <leader>** :call pdv#DocumentWithSnip()<CR>

"Emmet
"let g:user_emmet_leader_key='<Tab>'
"provide a function that shows the current git branch
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
nnoremap <leader>ue :UltiSnipsEdit<CR>

"show hidden files in ctrlp
let g:ctrlp_show_hidden=1

"Vdebug port
let g:vdebug_options = {
  \ 'port' : 9003,
  \ 'watch_window_style': 'compact',
  \ 'path_maps': {'/var/www/html' : '/home/luks/projects/drinks-new-app'},
  \ 'break_on_open' : 0,
  \ }
" the path maps file should define maps for remote debugging like:
" let g:vdebug_options.path_maps : {'/var/www/html' : '/home/user/html'},
runtime .vim_path_maps

""" Vdebug keymaps - deprecated (using vimspector)
" let g:vdebug_keymap = {
" \    "run" : "<C-h>",
" \    "run_to_cursor" : "<leader>dk",
" \    "step_over" : "<C-j>",
" \    "step_into" : "<C-k>",
" \    "step_out" : "<C-l>",
" \    "close" : "<leader>ds",
" \    "detach" : "<leader>di",
" \    "set_breakpoint" : "<leader>dn",
" \    "get_context" : "<leader>dc",
" \    "eval_under_cursor" : "<leader>du",
" \    "eval_visual" : "<leader>de",
" \}
" nnoremap <leader>dl :VdebugEval
" nnoremap <leader>dt :VdebugTrace
" nnoremap <leader>dw :BreakpointWindow<CR>

nnoremap <C-h> <Plug>VimspectorContinue
nnoremap <leader>dk <Plug>VimspectorRunToCursor
nnoremap <leader>dn <Plug>VimspectorToggleBreakpoint
nnoremap <C-j> <Plug>VimspectorStepOver
nnoremap <C-k> <Plug>VimspectorStepInto
nnoremap <C-l> <Plug>VimspectorStepOut
nnoremap <leader>ds :VimspectorReset<CR>
nnoremap <leader>di <Plug>VimspectorStop
nnoremap <leader>dw <Plug>VimspectorBreakpoints

" for normal mode - the word under the cursor
nmap <Leader>du <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>du <Plug>VimspectorBalloonEval

let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir = expand('$HOME/.vim/vimspector')

"Setting colorschemes after they are loaded
"colorscheme synthwave84

"Linting and indentation options
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\ 'typescript': ['eslint'],
\ 'html': ['prettier'],
\ 'json': ['jq'],
\ 'php': ['php_cs_fixer', 'trim_whitespace'],
\ 'smarty': ['prettier'],
\ }
let g:ale_linters = {
\ 'php': ['phpcs'],
\ }
" \ 'php': ['phpcs', 'phpstan', 'psalm', 'phpmd', 'phpactor'],
let g:ale_echo_msg_format = 'Errorr %s'
let g:ale_echo_msg_error_str = 'ERRROR'
let g:ale_virtualtext_cursor = 'current'
let g:ale_virtualtext_prefix = '%comment% [%linter%] %type%:'
let g:ale_linter_aliases = {
\ 'smarty': ['html'],
\ }
" let g:ale_filename_mappings = {
" \   '*': [
" \       ['/home/luks/projects/drinks-new-app', '/var/www/html'],
" \   ],
" \}
nmap <leader>l :ALEFix<CR>
" let g:ale_fix_on_save = 1

" let g:ale_php_phg:ale_use_global_executablespcbf_executable = "vendor/bin/sail bin phpcbf"
let g:ale_command_wrapper = "docker exec -i linters"
let g:ale_use_global_executables = 1
" working
let g:ale_php_phpcs_executable = "phpcs"
let g:ale_php_phan_executable = "phan"
let g:ale_php_phpmd_executable = "phpmd"
let g:ale_php_phpstan_executable = "phpstan"
" language servers
let g:ale_php_phpactor_executable = "phpactor"
let g:ale_php_psalm_executable = "psalm"
" let g:ale_php_psalm_configuration = "psalm.xml"
" let g:ale_php_phpcs_options = "bin phpcs"
" let g:ale_php_psalm_use_global = 1

" let g:ale_php_phpstan_use_global = 1
" let g:ale_php_phpstan_executable = "/home/luks/projects/drinks-new-app/linters/phpstan.sh"
" let g:ale_php_phpstan_executable = "/home/luks/projects/drinks-new-app/linters/phpstan.sh"

"tagbar setup
nmap <leader>g :TagbarToggle<CR>

"setting extra space to the Nerdcommenter comments
let NERDSpaceDelims=1
let g:NERDCompactSexyComs = 0

"Enable syntax highlighting
"let g:rainbow_active = 1

"configured so that gimgutter updates faster
set updatetime=300

"enable indent guides on startup
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 0
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 1

"disable showing the mode, because lightline shows it
set noshowmode

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
let g:lightline.component_function = {
    \   'readonly': 'LightlineReadonly',
    \   'gitbranch': 'FugitiveHead',
    \   'gitstatus': 'GitStatus',
    \   'filetypeicon': 'IconFiletype',
     \ }
let g:lightline.active = {
     \      'left': [ [ 'mode', 'paste' ],
     \             [ 'readonly', 'filename', 'modified', 'gitbranch', 'gitstatus'] ],
     \      'right': [
     \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
     \            [ 'lineinfo' ],
     \            [ 'percent' ],
     \            [ 'fileformat', 'fileencoding', 'filetypeicon'] ]
     \   }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! IconFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

"configure function to show the git branch
function! GitStatus()
  return join(filter(map(['A','M','D'], {i,v -> v.': '.GitGutterGetHunkSummary()[i]}), 'v:val[-1:]'), ' ')
endfunction

"workspace config
"let g:workspace_autocreate = 0
"let g:workspace_session_directory = $HOME . '/.vim/sessions/'
"let g:workspace_create_new_tabs = 0
"let g:workspace_persist_undo_history = 0  " enabled = 1 (default), disabled = 0
"let g:workspace_session_disable_on_args = 0
"let g:workspace_autosave_untrailspaces = 0
"let g:workspace_autosave_untrailtabs = 0
"let g:workspace_autosave = 1
"ignore windows like tagbar or nerdtree
set sessionoptions-=blank

"devicons necessary config
set encoding=UTF-8

"NERDTree
"start NERDTree when starting vim
"autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    " \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
"show hiddenfile by default
let NERDTreeShowHidden=1

"Gutentags config

"config project root markers.
let g:gutentags_project_root = ['.git']

"generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

"disable default key maps, because the conflict with the commenter
let g:gutentags_plus_nomap = 1

let g:gutentags_ctags_exclude = [
\ 'vendor*',
\]

" Startify config
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   -= Sessions =-']       },
      \ { 'type': 'bookmarks', 'header': ['   -= Bookmarks =-']      },
      \ { 'type': 'files',     'header': ['   -= Files =-']            },
      \ { 'type': 'dir',       'header': ['   -= Dir '. getcwd() . ' =-'] },
      \ { 'type': 'commands',  'header': ['   -= Commands =-']       },
      \ ]
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.bash_profile' ]
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header_quotes = [
\ ["Remember that there is no code faster than no code."],
\ ["Deleted code is debugged code."],
\ ["It works on my machine."],
\ ["It's not a bug — it's an undocumented feature."],
\ ["One man's crappy software is another man’s full-time job."],
\ ["There are 10 kinds of people in the world: Those who know binary and those who don't."],
\ ["There are three kinds of lies: lies, damned lies, and benchmarks."],
\ ["A month of programming can often save a day of thought."],
\ ["The only time you can predict the release date of software is after it has happened."],
\ ["Running his code is like plodding over a field of sticky clay after it has rained."],
\ ["Programming is like cycling. Whatever direction you take it is an uphill struggle against the wind."]
\ ]
let g:bb_header = [
\ '      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⢘⠄⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⠀⢀⣆⣤⣦⣇⣠⠀⠀⠀⠀⢐⢡⢤⡐⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⣺⣽⣿⣿⣿⣿⣾⣴⠄⠀⠀⠰⠱⠣⢘⠈⠀⠀⢀⠀⠄⠄⡤⢐⢢⠠⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣷⠄⠀⠑⠄⢠⠊⠀⠀⠐⠤⢡⡑⠆⠈⠂⠈⠂⡀⠈⠢⠀⡀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⡅⡂⠀⠀⢀⠉⠌⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠂⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠠⠂⡂⠀⠀⠈⢌⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠂⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠂⢻⡋⠋⠹⡿⠋⠀⠀⠸⡇⠂⠠⠁⡂⠀⠈⠒⡰⠀⠂⠀⠀⠀⡀⡐⣀⢐⢀⠂⡀⡐⠐⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⠸⡀⠀⠀⡀⠀⠀⡀⠈⡇⠀⡨⢐⠀⠀⠀⠀⠴⠀⠀⠀⠀⠊⠀⠀⠀⠀⠑⡊⠂⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⠀⡇⠀⠀⠁⠀⠌⠀⠀⡖⠠⠂⡂⠀⠀⠀⠀⠬⠀⠀⠀⠀⠅⠀⠀⠀⠀⢀⠂⠄⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⠠⠁⠄⠀⢈⣐⡀⢀⠊⣠⠁⠌⠀⠀⠀⠡⠐⠨⠀⢠⠑⠁⠀⠀⠡⠀⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"' . get(startify#fortune#quote(), 0, '') . '"',
\ '      ⠀⠀⠀⠀⠀⠀⠀⠈⢂⠛⠟⠋⣂⠔⠱⣠⠁⠀⠀⠀⠀⠀⠠⡁⠂⠀⠀⠀⠀⠆⢁⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⠀⠀⣀⢴⢐⣐⡠⠃⠀⠀⠍⠀⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⡄⡔⣄⢲⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⢠⠊⠀⠀⠈⠀⠀⠀⠀⢘⠀⠀⠀⠀⠀⠀⡠⢴⠀⠀⠀⠰⢝⢮⠊⠐⠀⢰⠘⠈⡅⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠀⡋⣺⠀⠀⡎⢲⣵⡆⠀⡊⠀⠀⠀⠀⣰⠉⠀⠀⠉⠉⠑⠢⣀⠠⠑⠠⢈⠄⠔⠈⠀⠀⠀⠀⠀⠀⠀⠀',
\ '      ⠀⠀⠀⠀⠨⢠⢪⠀⠐⠵⠿⠷⠃⠀⡇⠀⠀⠀⡐⠉⡵⡆⢽⠾⠿⠻⠆⡿⢀⠌⠐⠁           ',
\ '=================================================',
\ ]
let g:startify_custom_header = 'startify#pad(g:bb_header)'
nnoremap <leader>s :SSave <CR>

"json formatting
xnoremap <leader>bj <Esc>:'<,'> !jq<CR>
xnoremap <leader>bt <Esc>:'<,'>s/"\([^"]*\)" *: *"\([^"]*\)",\?/'\1' => '\2',/<CR>

""""" KEYBOARD SHORTCUTS
"dealing with floaterm
nnoremap <silent> <leader>ft :FloatermToggle<CR>
tnoremap <silent> <leader>ft <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>fn :FloatermNew<CR>
tnoremap <silent> <leader>fn <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>fl :FloatermNext<CR>
tnoremap <silent> <leader>fl <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>fk :FloatermPrev<CR>
tnoremap <silent> <leader>fk <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>fc :FloatermKIl<CR>
tnoremap <silent> <leader>fc <C-\><C-n>:FloatermKil<CR>
tnoremap <silent> <leader>fe <C-\><C-n>

nmap <silent> <leader>en :TestNearest<CR>
nmap <silent> <leader>ef :TestFile<CR>
nmap <silent> <leader>es :TestSuite<CR>
nmap <silent> <leader>el :TestLast<CR>
nmap <silent> <leader>ev :TestVisit<CR>
let g:test#php#phpunit#executable = 'vendor/bin/phpunit'

" override paratest to run in docker
" let g:test#php#phpunit#executable
function! DockerTransform(cmd) abort
  return  'sail ' . a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
let test#strategy = "vimterminal"

" dealing with tabs
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>td :tab sb<CR>
"close all the tabs on the right
nnoremap <silent> <leader>tr :.+1,$ tabdo :q<CR>
"close all the tabs on the right
nnoremap <silent> <leader>to :tabo<CR>

nnoremap <silent> <leader>no :NERDTreeToggle<CR>
nnoremap <silent> <leader>nh :NERDTreeFocus<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

"coc.vim
noremap <silent> gd <Plug>(coc-definition)
noremap <silent> gi <Plug>(coc-diagnostic-info)
noremap <silent> gi <Plug>(coc-implementation)
noremap <silent> gr <Plug>(coc-references)

"navigate between CoC diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-@> coc#refresh()
" format selected
xmap <leader>fs <Plug>(coc-format-selected)
nmap <leader>fs <Plug>(coc-format-selected)

"configure language servers for CoC
" removed coc-kotlin
let g:coc_global_extensions = ['coc-tsserver', 'coc-yaml', 'coc-json', 'coc-html', 'coc-markdownlint', 'coc-jedi', 'coc-db', 'coc-sql']
let g:coc_filetype_map = {
\ 'mysql': 'sql',
\ }
" check out coc-snippets
" https://github.com/neoclide/coc-html/issues/6

nmap <leader>db :DBUIToggle<CR>

" delegating all the search to FZF
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always -uuu --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <C-p> :Files<CR>
vnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>zf :RG<CR>
vnoremap <silent> <leader>zf :RG<CR>
nnoremap <silent> <leader>zb :Buffers<CR>
vnoremap <silent> <leader>zb :Buffers<CR>
nnoremap <silent> <leader>zw :Windows<CR>
vnoremap <silent> <leader>zw :Windoww<CR>

" commenting
map <C-_> <plug>NERDCommenterInvert

" display session and toggle it on/off
" nnoremap <leader>sd :echo v:this_session<CR>
" nnoremap <leader>st :ToggleWorkspace<CR>

"""" COLORSCHEME SETTINGS
"blend in sing column for a simpler look
let g:gitgutter_override_sign_column_highlight = 1
"define breakpoints so that vdebug doesn't apply standard ones
hi DbgBreakptLine ctermfg=white ctermbg=black guifg=#ffffff guibg=#00ff00
hi DbgBreakptSign ctermfg=White ctermbg=Green guifg=#ffffff guibg=#00ff00
colorscheme gruvbox
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
"set floaterm background to black
hi Floaterm guibg=gray18

"color schemes clear highlights, so need to call this to keep them
" this didn't help in anything
" autocmd ColorScheme * call Highlight()

" function! Highlight() abort
  " hi Conceal ctermfg=239 guifg=#504945
  " hi CocSearch ctermfg=12 guifg=#18A3FF
" endfunction

" autocmd vimenter * ++nested colorscheme gruvbox

" arrow keys resize windows
nnoremap <left> :vertical resize -1<cr>
nnoremap <c-left> :vertical resize -10<cr>
nnoremap <right> :vertical resize +1<cr>
nnoremap <c-right> :vertical resize +10<cr>
nnoremap <up> :resize -1<cr>
nnoremap <c-up> :resize -10<cr>
nnoremap <down> :resize +1<cr>
nnoremap <c-down> :resize +10<cr>

nnoremap <leader>re :tabnew $MYVIMRC<cr>
nnoremap <leader>rs :so $MYVIMRC<cr>

" quit window
nnoremap <leader>wq :q<cr>
vnoremap <leader>wq :q<cr>
" quit all other split files
nnoremap <leader>wo :only<cr>
vnoremap <leader>wo :only<cr>
inoremap <leader>wo :only<cr>

" vimwiki alternative mappings

nmap <leader>wb <Plug>VimwikiGoBackLink`

" copying and pasting
" copy filename to clipboard
nmap <leader>cf :let @+=@%<cr>
" repeat last run command
nmap <leader>rl @:
" paste yanked text
nmap <leader>vl "0p
" paste last inserted text
nmap <leader>vi ".p
" replace last searched text
" nmap <leader>rr :%s/<Ctrl-r />/mustache/g

"copilot settings
imap <silent><script><expr> <leader>y copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
