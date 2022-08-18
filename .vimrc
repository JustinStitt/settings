map q <Nop>
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
" set t_Co=127
let mapleader='q'
syntax on
hi Visual cterm=bold ctermbg=8 ctermfg=NONE
hi Folded cterm=bold ctermbg=236 ctermfg=NONE term=reverse
hi MatchParen cterm=bold ctermbg=237 ctermfg=None
set colorcolumn=80
map S /
" hide search highlighting on escape
imap <c-b> <right>
imap <c-x> <left>
map <Leader>S :noh<CR>
map P "0p
set t_u7=
set number
set nornu
imap jj <Esc>
imap jk <Esc>
" show file path at bottom
set ignorecase
set smartcase
set laststatus=2
set statusline+=%F
" nmap s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-bd-f)
" map <Leader>w <Plug>(easymotion-w)
" map s <Plug>(easymotion-s)
" nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
map <c-s> <Esc>:w<CR>
imap <c-s> <Esc>:w<CR>
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
hi EasyMotionTarget ctermbg=none ctermfg=white cterm=bold
hi EasyMotionShade ctermbg=none ctermfg=green
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

let g:airline_theme='onehalfdark'
colorscheme onehalfdark
hi Comment ctermfg=8
set undofile
map <c-l> :NERDTreeToggle<CR>
hi LineNr ctermbg=none
hi Visual cterm=bold
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nmap <tab> gt
xmap <tab> gt
let g:ycm_autoclose_preview_window_after_completion=1
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
source /usr/share/doc/fzf/examples/fzf.vim
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
nmap <silent> <C-P> :Files!<CR>
nmap <silent> <C-h> :TagbarOpenAutoClose<CR>
" export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'batcat --color    =always --style=header,grid --line-range :300 {}'"
let g:tagbar_wrap = 1
hi TagbarSignature ctermfg=8
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <S-Tab> gT
xnoremap <S-Tab> gT
let g:rainbow_active=1
let g:ycm_auto_hover=''
nmap <Leader>D <Plug>(YCMHover)
" Bdelete hidden to close buffers not visible or in tab
map <C-j> <C-e>
map <C-k> <C-y>
vmap <space> <Esc>
command Diff :w !git diff --no-index % -
nmap <Leader>l :Lines<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
let g:loaded_youcompleteme = 1
set foldnestmax=1
map <Leader><< :tabm -1<CR>
map <Leader>>> :tabm +1<CR>
map <Leader>+ :tabnew<CR>
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
set shiftwidth=4
" if exists("+showtabline")
"     function! MyTabLine()
"         let s = ''
"         let wn = ''
"         let t = tabpagenr()
"         let i = 1
"         while i <= tabpagenr('$')
"             let buflist = tabpagebuflist(i)
"             let winnr = tabpagewinnr(i)
"             let s .= '%' . i . 'T'
"             let s .= (i == t ? '%1*' : '%2*')
"             let s .= ' '
"             let wn = tabpagewinnr(i,'$')

"             let s .= '%#TabNum#'
"             let s .= i
"             " let s .= '%*'
"             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"             let bufnr = buflist[winnr - 1]
"             let file = bufname(bufnr)
"             let buftype = getbufvar(bufnr, 'buftype')
"             if buftype == 'nofile'
"                 if file =~ '\/.'
"                     let file = substitute(file, '.*\/\ze.', '', '')
"                 endif
"             else
"                 let file = fnamemodify(file, ':p:t')
"             endif
"             if file == ''
"                 let file = '[No Name]'
"             endif
"             let s .= ' ' . file . ' '
"             let i = i + 1
"         endwhile
"         let s .= '%T%#TabLineFill#%='
"         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"         return s
"     endfunction
"     set stal=2
"     set tabline=%!MyTabLine()
"     set showtabline=1
"     highlight link TabNum Special
" endif

hi Folded ctermbg=55 cterm=bold
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>
nmap yr :call system("ssh $machineA_IP pbcopy", @*)<CR>
nmap <Leader>p :set paste!<CR>
nmap <Leader>ds :Gdiffsplit<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <C-q> :q<CR>
" syntax sync fromstart
" set redrawtime=10000
set re=0
set mouse=a
nnoremap <Leader>t :Buffers<CR>
" language server stuff: https://github.com/mattn/vim-lsp-settings
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
hi ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
" let g:workspace_autocreate = 1
let g:workspace_autosave = 0
nnoremap <leader>W :ToggleWorkspace<CR>
