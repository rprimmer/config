set shell=/usr/local/bin/bash
set dictionary=/usr/share/dict/words
set expandtab                   " convert tabs to spaces
"set smarttab                   " tabs are used for indentation only (requires ctab package)
set softtabstop=4               " set tab stop width
set shiftwidth=4                " set number of charcaters for indentation
set autoindent                  " copies indentation from previous line
set smartindent                 " automatically inserts a level of indentation in some cases
set cindent                     " special intentation for C/C++ code
set selectmode=mouse            " allow mouse to select an area
set mouse=a                     " use mouse for all modes
set showcmd                     " show uncompleted command
set showmatch                   " show matching braces    
set showmode                    " show mode in command screen
set ruler                       " show line and column info
set number                      " show line numbers
set more                        " use a pager for long lines
set backupext=~                 " use ~ for backup files
set history=200                 " saved lines of command history
set ttyfast                     " better scrolling
set splitbelow                  " split window at bottom (othr opiton is splitright)
set wrap                        " soft wrap long lines
set linebreak                   " breakup text lines sensibly
set nolist                      " don't insert linebreaks except when CR explicity entered
set textwidth=0                 " prevent vim from automatically entering linebreaks for new text
set wrapmargin=0                " used in concert with textwidth=0 for same reason
set showbreak=++++              " chars to indicate a line break
set hlsearch                    " enable search highlighting (:noh to turn off hightlights)
set backspace=indent,eol,start  " allow backspacing overy everything in insert mode
set wildmenu                    " display completion matches in a status line
set ttimeout                    " time out for key codes
set ttimeoutlen=100             " wait up to 100ms after Esc for special key
set display=truncate            " show @@@ in the last line if it is truncated

syntax on                       " use syntax highlighting

" Turn on spellcheck for markdown docs
autocmd BufRead,BufNewFile *.md setlocal spell

" Wrap text for LaTeX for regular text files
autocmd BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
