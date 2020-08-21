set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cursorline          " highlight current line

syntax on

set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set clipboard=unnamedplus

set t_Co=256

if &term =~ "^xterm\\|rxvt-unicode-256color"
  let &t_RS = "\<ESC>[5 q"
  let &t_SI .= "\<ESC>[6 q"
  let &t_EI .= "\<ESC>[2 q"
  " 1 or 0 -> blinking block
  " 2      -> solid block
  " 3      -> blinking underscore
  " 4      -> solid underscore
  " 5      -> blinking vertical bar
  " 6      -> solid vertical bar
endif
