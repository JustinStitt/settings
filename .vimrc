scriptencoding utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'https://github.com/VundleVim/Vundle.vim.git'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'neoclide/coc.nvim'
Plugin 'psf/black'
Plugin 'rhysd/vim-clang-format'
Plugin 'junegunn/vim-peekaboo'
Plugin 'dense-analysis/ale'
" Plugin 'evanleck/vim-svelte'
Plugin 'pangloss/vim-javascript'
Plugin 'leafOfTree/vim-svelte-plugin'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'chrisbra/csv.vim'
" Plugin 'othree/html5.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'evanleck/vim-svelte', {'branch': 'main'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map q <Nop>
let g:ale_python_black_options='--line-length=80'
silent! stty -ixon
map <C-q> :q<CR>
" set colorcolumn=80
set expandtab

" au BufWinLeave ?* mkview
" au BufWinEnter ?* silent loadview

ru! defaults.vim                " Use Enhanced Vim defaults
set mouse=                      " Reset the mouse setting from defaults
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)
set ts=2
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
" source /usr/share/doc/fzf/examples/fzf.vim
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
set rtp+=~/.fzf
set encoding=utf-8
let g:coc_disable_startup_warning = 1
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
let g:lsp_diagnostics_echo_cursor = 1
" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()
autocmd BufWritePre *.py Black
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
set shiftwidth=2
" turn on auto formatting for clang-format
autocmd FileType c ClangFormatAutoEnable
" nnoremap <leader>r :<C-u>registers<CR>:put<Space>
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
" ALE airline integration
let g:airline#extensions#ale#enabled = 1
nnoremap <leader>w :ALENext<CR>
let g:vim_svelte_plugin_load_full_syntax = 1
packloadall
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
highlight CocHintFloat ctermfg=Blue guifg=#0000ff
highlight CocFloating ctermfg=Blue guifg=#0000ff
highlight CocErrorFloat ctermfg=Blue guifg=#0000ff
" set undodir="/home/jstitt/Documents/.undodir"
set undodir=~/.vim/undodir
filetype plugin on
nnoremap <leader>n :Git add <C-r>%<CR>
set shiftwidth=2
map <leader>( ysiw)
map <leader>{ ysiw}
map <leader>[ ysiw]
map <leader>1 <C-x>
map <leader>2 <C-a>
set shortmess-=S
nnoremap _x :normal j<CR>
