
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype off
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
if !empty(system('which opam'))
  let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']

  let s:reasondir=substitute(system('opam config var share'),'\n$','','') . "/reason"
  execute "set rtp+=".s:reasondir."/editorSupport/VimReason"
  let g:syntastic_reason_checkers=['merlin']
else

endif

" Plugin Settings
let g:pymode_lint_ignore="E501,E303,E302,W0612"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'MartinLafreniere/vim-PairTools'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'tmhedberg/SimpylFold'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()
filetype plugin indent on
 
" Enable syntax highlighting
syntax on
set t_Co=256
colorscheme elflord 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Enable Folding
set foldmethod=indent
set foldlevel=99
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
call togglebg#map("<F5>")
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" nnoremap <C-L> :nohl<CR><C-L>


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 

"------------------------------------------------------------
" Commands {{{1
"
" Useful Commands

" Clear search highlight
nnoremap <C-c> :let @/ = ""

" Display Current Time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>


autocmd FileType reason let g:pairtools_reason_pairclamp = 1
autocmd FileType reason let g:pairtools_reason_tagwrench = 0
autocmd FileType reason let g:pairtools_reason_jigsaw    = 1
autocmd FileType reason let g:pairtools_reason_autoclose  = 1
autocmd FileType reason let g:pairtools_reason_forcepairs = 0
autocmd FileType reason let g:pairtools_reason_closepairs = "(:),[:],{:}" . ',":"'
autocmd FileType reason let g:pairtools_reason_smartclose = 1
autocmd FileType reason let g:pairtools_reason_smartcloserules = '\w,(,&,\*'
autocmd FileType reason let g:pairtools_reason_antimagic  = 1
autocmd FileType reason let g:pairtools_reason_antimagicfield  = "Comment,String,Special"
autocmd FileType reason let g:pairtools_reason_pcexpander = 1
autocmd FileType reason let g:pairtools_reason_pceraser   = 1
autocmd FileType reason let g:pairtools_reason_tagwrenchhook = 'tagwrench#BuiltinNoHook'
autocmd FileType reason let g:pairtools_reason_twexpander = 0
autocmd FileType reason let g:pairtools_reason_tweraser   = 0
autocmd FileType reason let g:pairtools_reason_apostrophe = 0
