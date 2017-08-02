"vimrc
"2012-14 tiagobrait
" (with some stuff borrowed from https://github.com/haridas/Dotfiles)

"ok, let's organize this stuff now


"-VIM-PLUG----------------------------------------------------------------------
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
"Plug 'garbas/vim-snipmate' | Plug 'honza/vim-snippets' | Plug 'tomtom/tlib_vim' | Plug 'marcweber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/echodoc.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'dietsche/vim-lastplace'
"Plug 'mtth/scratch.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
"---------------------------------------------------------------------------->PY
Plug 'klen/python-mode', { 'for': 'python' }
"---------------------------------------------------------------------------->JS
Plug 'matthewsimo/angular-vim-snippets', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'benjie/neomake-local-eslint.vim', { 'for': 'javascript' }
"---------------------------------------------------------------------------->GO
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
"---------------------------------------------------------------------------->RB
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
"---------------------------------------------------------------------------->NG
Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
"---------------------------------------------------------------------------->HT
Plug 'gregsexton/MatchTag', { 'for': 'html' }
"-----------------------------------------------------------------------LOADLAST
Plug 'ryanoasis/vim-devicons'

"custom stuff
Plug '~/.config/nvim/custom-tiagobrait'
call plug#end()

"-------------------------------------------------------------------------------

"UNITE CALLS--------------------------------------------------------------------
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"NOTE TO SELF: do not use this, globs are slow as fuck. Use good old regex.
"call unite#custom#source('file_rec/async,file_mru,file,buffer,grep', 'ignore_globs', ['**/bower_components/', 'node_modules/'] + split(&wildignore, ','))
call unite#custom#source('file,file_rec,file_rec/async,file_rec/git', 'ignore_pattern', 'node_modules\|bower_components')
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

"-OPTIONS-----------------------------------------------------------------------
set shell=/bin/bash
set cursorline
set title
set autoindent
"don't show what mode we're in, let airline take care of it
set noshowmode
"show command in the last line
set showcmd
"hide buffers
set hidden
"show 'line,column percetage' in the statusline
set ruler
"show linenumber
set number
"but not relative numbers though
set relativenumber
"do not redraw when running automatic stuff
set lazyredraw
"go back to a matching bracket for a bit
set showmatch
"everyone has a mouse these days...
"nice searching options
set ignorecase
set smartcase
set incsearch
set hlsearch
"line wrapping
set wrap
"disable those annoying backups
set nobackup
"where to start wrapping (# of chars from right margin)
"we don't want linebreaks...
set nolinebreak
"don't wait too much to complete when reading keycodes
set list
" always show a statusline
set laststatus=2
"we can backspace over everything in insert mode
set backspace=indent,eol,start
"disable modelines (yuck!)
set modelines=0
"much better identation settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf8
set shell=/bin/bash
set matchtime=3
set dictionary=/usr/share/dict/words
"shortcut key to toggle pasting mode
set pastetoggle=<F3>
set backupskip=/tmp/*,/private/tmp/*
"show next 3 lines below the current one when scrolling
set scrolloff=3
set mouse=a
"wrapping limit
set textwidth=0
"highlight column 81
set colorcolumn=81
"formatting stuff, go see the online help
set formatoptions+=rqn1
"set clipboard
set clipboard=unnamed
set ttimeoutlen=20
set wrapmargin=0
set listchars=tab:↹·,eol:↵,trail:♦,nbsp:·
set clipboard=unnamedplus
set completeopt-=preview
set splitbelow
set termguicolors
"and what a nice statusline
"set statusline=%1*[%n]%<%f\ %r%m                           "buffn,name,RO,change
"set statusline+=%2*%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]     "type,format,encoding
"set statusline+=%6*%=                                      "L/R separator
"set statusline+=%3*[ln:\ %l\ of\ %L\ (%3p%%)]%4*[cl:\ %c] "lines and columns
"set statusline+=%5*[%P]%*                                  "percent
if has('gui_running')
  set guifont=DejaVuSansMonoForPowerline\ Nerd\ Font\ 10
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=F
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  let g:airline_powerline_fonts = 1
  let base16colorspace = 256
  let g:airline_theme = 'base16color'
  colorscheme base16-default-dark
  set background=dark
else
  if $TERM == 'linux'
    let g:airline_left_sep = '|'
    let g:airline_right_sep = '|'
    let g:airline_theme = 'base16_default'
  else
    let g:airline_powerline_fonts = 1
    let base16colorspace = 256
    let g:airline_theme = 'base16color'
    colorscheme base16-default-dark
    set background=dark
  endif
endif
"-------------------------------------------------------------------------------
"-HIGHLIGHTS--------------------------------------------------------------------
hi IndentGuidesOdd ctermbg=19 guibg=#303030
hi IndentGuidesEven ctermbg=238 guibg=#444444

"UserX highligths for statusbar
hi User1 ctermfg=Yellow ctermbg=DarkRed cterm=bold guifg=Yellow guibg=DarkRed gui=bold
hi User2 ctermfg=White ctermbg=DarkYellow cterm=bold guifg=White guibg=#B26818 gui=bold
hi User3 ctermfg=White ctermbg=DarkBlue cterm=bold guifg=White guibg=DarkBlue gui=bold
hi User4 ctermfg=White ctermbg=DarkMagenta cterm=bold guifg=White guibg=DarkMagenta gui=bold
hi User5 ctermfg=White ctermbg=DarkGreen cterm=bold guifg=White guibg=DarkGreen gui=bold
hi User6 guifg=White ctermbg=DarkGrey cterm=bold guifg=White guibg=DarkGrey gui=bold
"hi User7 guifg=White ctermbg=DarkGrey cterm=bold
"hi User8 ctermfg=White ctermbg=DarkGrey cterm=bold
"hi User9 ctermfg=White ctermbg=DarkGrey cterm=bold
"hi ColorColumn ctermbg=LightGray ctermfg=DarkRed guibg=LightGray guifg=DarkRed
"-------------------------------------------------------------------------------

"-MAPPINGS----------------------------------------------------------------------
"TODO: add smarter functions so we can use snippets with tab too!
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><return> pumvisible() ? "\<c-y>" : "\<return>"

nnoremap <leader>p <ESC>:call TogglePrevWin()<return>
"sweet mother of unite
nnoremap <leader>uf <ESC>:<C-u>Unite -start-insert -prompt=▶ -force-redraw -wipe -buffer-name=files_fa file_rec/neovim<cr>
nnoremap <leader>ug <ESC>:<C-u>Unite -start-insert -prompt=▶ -force-redraw -wipe -buffer-name=file_ga file_rec/git<cr>
nnoremap <leader>ub <ESC>:<C-u>Unite -start-insert -prompt=▶ -force-redraw -wipe -buffer-name=bufferlist buffer<cr>
nnoremap <leader>uy <ESC>:<C-u>Unite -start-insert -prompt=▶  -force-redraw -wipe -buffer-name=yankhist history/yank<cr>
nnoremap <leader>um <ESC>:<C-u>Unite -start-insert -prompt=▶  -force-redraw -wipe -buffer-name=MRU file_mru<cr>
nmap <leader>l :set list!<CR>
"turn off highlighting
nnoremap <leader><space> <ESC>:<C-u>noh<cr>
nnoremap <tab> %
nnoremap g; g;zz
nnoremap / /\v
vnoremap / /\v
"tagbar
nmap <leader>T :TagbarToggle<CR>
imap <leader>T <ESC>:TagbarToggle<CR>i
" <leader>ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ie <ESC>:e $MYVIMRC<CR>
vnoremap <tab> %
"navigating through buffers with a little more ease
nmap <leader>] :bnext<CR>
nmap <leader>[ :bprevious<CR>
nmap <leader>t :enew<CR>
nmap <leader>tc :bp <BAR> :bd #<CR>
nmap <leader>tq :bp <BAR> :bd! #<CR>
"quick and dirty way to remove trailing spaces (a little better than the
nmap <leader>S :let __ls=@/ <BAR> :%s#\s\+$##g <BAR> :let @/=__ls <BAR> :noh <CR>
nmap <leader>E :Vexplore<CR>
"nmap <leader>r :Scratch<CR>
"open help in a new tab
nmap <F1> :tab h<CR>
"quit (abort)
nmap <leader>a :qa!<CR>
imap <leader>a <ESC>:qa!<CR>
"save and quit
nmap <leader>q :wqa<CR>
imap <leader>q <ESC>:wqa<CR>
"save
nmap <leader>s :w<CR>
imap <leader>s <ESC>:w<CR>i
"save all
nmap <leader>sa :wa<CR>
imap <leader>sa <ESC>:wa<CR>i
map <c-n> <esc>:NERDTreeToggle<cr>

let g:UltiSnipsExpandTrigger = '<C-A>'
let g:UltiSnipsJumpForwardTrigger = "<C-A>"
let g:UltiSnipsJumpBackwardTrigger = "<C-S>"
let g:UltiSnipsListSnippets = "<C-D>"
"-------------------------------------------------------------------------------

"-FUNCTIONS---------------------------------------------------------------------
"enable correct js linter
fun! SetJSLinter()
  let path = expand('%:p:h')
  while 1
    if path == '/'
      "let g:neomake_javascript_enabled_makers = ['xo']
      break
    endif
    if !empty(glob(path . '/.eslintrc')) || !empty(glob(path . '/.eslintrc.*'))
      let g:neomake_javascript_enabled_makers = ['eslint']
      break
    elseif !empty(glob(path . '/.jshintrc'))
      let g:neomake_javascript_enabled_makers = ['jshint']
      break
    endif
    let path = resolve(path . "/..")
  endw
endf

fun! TogglePrevWin()
  if &completeopt =~ 'preview'
    set completeopt-=preview
    echo 'Preview window disabled'
  else
    echo 'Preview window: enabled'
    set completeopt+=preview
  endif
endf
"-------------------------------------------------------------------------------
"-AUTOCOMMANDS------------------------------------------------------------------

au CompleteDone * pclose!
au BufWritePost,BufEnter * Neomake
au VimResized * :wincmd=
au BufEnter * if &previewwindow | setlocal nonumber norelativenumber nolist |  endif
au Filetype javascript call SetJSLinter()

" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
""------------------------------------------------------------------------------

"-VARS--------------------------------------------------------------------------
"gocompletion
let g:deoplete#sources#go#gocode_binary = '/usr/bin/gocode'
let g:neomake_go_enabled_makers = ['golint']
let g:NERDSpaceDelims=1
let g:echodoc_enable_at_startup=1
"let g:airline_exclude_preview=1
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
"completion stuff
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 2
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"enable indent guides plugin at startup
"let g:indent_guides_enable_on_vim_startup = 1
"indent guides filetype exclusion list
let g:indent_guides_exclude_filetypes = ['help']
"disable autocolors for indent guides
let g:indent_guides_auto_colors = 0
"indent guide width
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"unite stuff
let g:unite_source_history_yank_enable = 1
"let b:javascript_fold = 'true'
let g:angular_filename_convention = 'camelcased'
let g:netrw_liststyle = 3
"set terminal an gui stuff
"not check on wq
"let g:syntastic_check_on_wq = 0
"set specific linters
"let g:syntastic_javascript_checkers = ["eslint","jshint"]
"let g:syntastic_css_checkers = ["csslint"]
"let g:syntastic_html_checkers = ["tidy"]
"disable Syntastic active checking for python:
"let g:syntastic_mode_map = { 'mode': 'active','passive_filetypes': ['python'] }
"disable python-mode folding
let g:pymode_folding = 0
"don't show buffer names in commandline, let airline take care of it
let g:bufferline_echo = 0
let g:lastplace_ignore = "gitcommit"
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_mode_map = {
      \'__' : '-',
      \'n' : 'N',
      \'i' : 'I',
      \'R' : 'R',
      \'v' : 'V',
      \'V' : 'VL',
      \'' : 'VB',
      \'c' : 'C',
      \'s' : 'S',
      \'S' : 'SL',
      \'' : 'SB',
      \}
"let g:airline_exclude_filenames = ["__Scratch__"]
"javascript plugin stuff
let g:used_javascript_libs = 'angularjs,angularui,react'
"snippets information
let g:snips_author = 'Tiago Polizelli Brait'
let g:snips_company = 'Levus LTDA'
let g:snips_email = 'tiagobrait@gmail.com'
let g:snips_github = 'https://github.com/tiagobrait'
let g:snips_nick = 'tiagobrait'
let g:author = 'Tiago Polizelli Brait'
let g:company = 'Levus LTDA'
let g:email = 'tiagobrait@gmail.com'
let g:github = 'https://github.com/tiagobrait'

"-------------------------------------------------------------------------------
