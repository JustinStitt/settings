" Setting some decent VIM settings for programming
" This source file comes from git-for-windows build-extra repository (git-extra/vimrc)

" set colorcolumn=80
set expandtab

au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

ru! defaults.vim                " Use Enhanced Vim defaults
set mouse=                      " Reset the mouse setting from defaults
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)
set ts=4
set ai                          " set auto-indenting on for programming
set number
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set wildmode=list:longest,longest:full   " Better command line completion

" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage
set hlsearch
set t_Co=127
syntax on
hi Visual cterm=bold ctermbg=236 ctermfg=NONE
hi Folded cterm=bold ctermbg=236 ctermfg=NONE term=reverse
hi MatchParen cterm=bold ctermbg=237 ctermfg=None  
set colorcolumn=80
map s /
map P "0p
set t_u7=
set number
set nornu
imap jj <Esc>
" show file path at bottom
set laststatus=2
set statusline+=%
