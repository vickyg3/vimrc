set nocompatible              " be iMproved, required
filetype off                  " required

" Begin Vundle stuff. To install vundle and plugins for first time:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins from github
Plugin 'Lokaltog/powerline'
Plugin 'majutsushi/tagbar'
Plugin 'mkitt/tabline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/Tabmerge'
Plugin 'Valloric/YouCompleteMe'
" youcompleteme needs one more step:
" cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
Plugin 'flazz/vim-colorschemes'

" plugins from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder' " this needs: sudo gem install fuzzy_file_finder

" All of your Plugins must be added before the following line
call vundle#end()            " required

"End vundle stuff.

" You complete me settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:EclimCompletionMethod = 'omnifunc' " for android development

colorscheme solarized

set autoindent
set nu
set smartindent
set showmatch
set textwidth=80
set title
set incsearch
set hlsearch
set ic
set modeline
set ls=2
set tags=tags
set mouse=a " just so you could click once in a while
set ruler
set colorcolumn=80
set history=1000

" Map F4 to open NERDTreeToggle
map <silent> <F4> :NERDTreeToggle <cr>
" Map Ctrl-r to NERDTreeFind
nnoremap <silent> <C-R> :NERDTreeFind <cr>

" Map F2, F3 to previous tab and next tab
map <silent> <F2> :tabp <cr>
map <silent> <F3> :tabn <cr>

" Map F6 to fuzzy finder
" From the list of files, Use Ctrl+L to open in new tab.
map <silent> <F6> :FufFile <cr>

" Map F8 to Tagbar Outline viewer
nmap <F8> :TagbarToggle<CR>

" Map F10 to save
imap <F10> :w<CR>
map <F10> :w<CR>

" Map F5 to Build and install android apk.
imap <F5> :!ant debug install <cr>
map <F5> :!ant debug install <cr>

" Map buffer switching away from C-W (for chromebooks).
map <C-b> <C-W><C-W>

" Open new buffer on the right
nmap <leader>s :rightbelow vnew<cr>

" Highlight trailing whitespace with bright red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:NERDTreeWinSize = 25
let g:lasttab = 1

" Map Ctrl+L to navigate to last tab
nmap <C-L> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" tabline config
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

syntax on
filetype plugin indent on " this should always be in the last line
