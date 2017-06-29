" ==================================
" general
" ==================================
set nowrap
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set backspace=indent,eol,start
set completeopt-=preview
set laststatus=2
set hidden
set wildignore+=*/vendor/*,*/bin/*,*/pkg/*,*.a,*.swp,*/node_modules/*
set nohlsearch
set clipboard=unnamed
set mouse=a
set diffopt+=vertical
set splitright
set termguicolors
filetype on
syntax on
colorscheme molokai

" ==================================
" mappings
" ==================================
let mapleader = ","

map <C-n> :NERDTreeToggle<CR>
nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader>z <Plug>(easymotion-sn)
nmap <leader>. gg=G''
command Greview :Git! diff --staged
nnoremap <leader>gr :Greview<cr>

au FileType go nmap <Leader>, <Plug>(go-info)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>q <Plug>(go-coverage-clear)
au FileType go nmap <leader>f <Plug>(go-def)
au FileType go nmap <Leader>i <Plug>(go-imports)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>x <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>m <Plug>(go-metalinter)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <leader>d :GoDescribe<CR>
au FileType go nmap <leader>s :GoReferrers<CR>
au FileType go nmap <leader>l :GoDecls<CR>
au FileType go nmap <leader>e :SyntasticCheck<CR>
au FileType javascript nmap <leader>, :TernType<CR>
au FileType javascript nmap <leader>f :TernDef<CR>
au FileType javascript nmap <leader>r :TernRename<CR>
au FileType javascript nmap <leader>s :TernRefs<CR>

" ==================================
" vim-plug
" https://github.com/junegunn/vim-plug
" ==================================
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'stephpy/vim-yaml'
Plug 'vim-scripts/dbext.vim'
Plug 'Raimondi/delimitMate'
Plug 'lifepillar/pgsql.vim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'mxw/vim-jsx'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

" ==================================
" ctrlp
" https://github.com/kien/ctrlp.vim
" ==================================
"let g:ctrlp_cmd = 'CtrlPMRU'

" ==================================
" vim-airline
" https://github.com/vim-airline/vim-airline.vim
" ==================================
let g:airline_theme='molokai'

" ==================================
" syntastic
" https://github.com/scrooloose/syntastic
" ==================================
let g:syntastic_check_on_wq = 0 
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" ==================================
" youcompleteme
" https://github.com/Valloric/YouCompleteMe
" ==================================
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers = {
\    'html': ['<', '/'],
\    'css': ['re!^\s{2}', 're!^\s{4}', 're!:\s+']
\}

" ==================================
" supertab
" https://github.com/ervandew/supertab
" ==================================
let g:SuperTabDefaultCompletionType = '<C-n>'

" ==================================
" ultisnips
" https://github.com/SirVer/ultisnips
" ==================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==================================
" vim-go 
" https://github.com/fatih/vim-go
" ==================================
let g:go_auto_type_info = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"
let g:go_metalinter_enabled = ['vet', 'vetshadow', 'gotype', 'deadcode', 'gocyclo', 'varcheck', 'structcheck', 'aligncheck', 'errcheck', 'ineffassign', 'interfacer', 'unconvert', 'goconst', 'gosimple', 'staticcheck']

" ==================================
" tagbar
" https://github.com/majutsushi/tagbar
" ==================================
"autocmd FileType go nested :TagbarOpen
"let g:tagbar_left = 1
let g:tagbar_width = 50
let g:tagbar_singleclick = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ==================================
" nerdtree
" https://github.com/scrooloose/nerdtree
" ==================================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==================================
" easymotion
" https://github.com/easymotion/vim-easymotion
" ==================================
let g:EasyMotion_smartcase = 1

" ==================================
" vim-json
" https://github.com/elzr/vim-json
" ==================================
let g:vim_json_syntax_conceal = 0

" ==================================
" emmet-vim
" https://github.com/mattn/emmet-vim
" ==================================
autocmd FileType html,css EmmetInstall
autocmd BufReadPost *.tmpl EmmetInstall
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0

" ==================================
" delimitMate
" https://github.com/Raimondi/delimitMate
" ==================================
let delimitMate_expand_cr = 1

" ==================================
" pgsql
" https://github.com/lifepillar/pgsql.vim
" ==================================
let g:sql_type_default = 'pgsql'

" ==================================
" jsx
" https://github.com/mxw/vim-jsx
" ==================================
 let g:jsx_ext_required = 0

" ==================================
" vim-markdown
" https://github.com/plasticboy/vim-markdown
" ==================================
let g:vim_markdown_folding_disabled = 1
