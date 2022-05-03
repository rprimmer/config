set shell=/usr/local/bin/bash
set dictionary=/usr/share/dict/words
set spell spelllang=en_us          " set language for spellcheck 
set spellcapcheck=                 " don't indicate a spelling error for non-capitalized words
highlight clear SpellBad           " turn off highlighting for mispelled words
highlight SpellBad cterm=underline " use underline for mispelled words (not highlighting) on terminals
highlight SpellBad gui=undercurl   " use squiglly lines on gui version of vim
highlight clear SpellRare          " ditto for all spelling isses 
highlight SpellRare cterm=underline 
highlight SpellRare gui=undercurl
highlight clear SpellLocal
highlight SpellLocal cterm=underline
highlight SpellLocal gui=undercurl
set nocompatible                " don't try to be compatible with vi
filetype plugin on              " allow ftp 
set expandtab                   " convert tabs to spaces
"set smarttab                   " tabs are used for indentation only (requires ctab package)
set softtabstop=4               " set tab stop width
set shiftwidth=4                " set number of charcaters for indentation
set autoindent                  " copies indentation from previous line
set smartindent                 " automatically inserts a level of indentation in some cases
set cindent                     " special intentation for C/C++ code
set selectmode=mouse            " allow mouse to select an area
set mouse=a                     " use mouse for all modes
set showcmd                     " show partical command in last line of screen
set showmatch                   " show matching braces    
set showmode                    " show mode in command screen
set ruler                       " show line and column info
set number                      " show line numbers
set more                        " use a pager for long lines
set backupext=~                 " use ~ for backup files
set history=30                  " saved lines of command history
set ttyfast                     " better scrolling 
set splitbelow                  " split window at bottom (the other opiton is splitright)
set wrap                        " soft wrap long lines
set linebreak                   " don't softwrap in the middle of a word
set whichwrap+=<,>,[,]          " allow left and right arrow keys to move to previous/next lines at EOL
set nolist                      " don't insert linebreaks except when CR explicity entered
set textwidth=0                 " prevent vim from automatically entering linebreaks <br> after a newline
set wrapmargin=0                " used in concert with textwidth=0 for same reason
set showbreak=++++              " chars to indicate a line break
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set wildmenu                    " display completion matches in a status line
set wildmode=longest,list       " have wildmode behave like bash 
set ttimeout                    " time out for key codes
set ttimeoutlen=100             " wait up to 100ms after Esc for special key
set display=truncate            " show @@@ in the last line if it is truncated

syntax on                       " use syntax highlighting
"set hlsearch                   " enable search highlighting (:noh to turn off hightlights)

" Turn on spellcheck for markdown docs
autocmd BufRead,BufNewFile *.md setlocal spell

" Wrap text for LaTeX for regular text files
autocmd BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"