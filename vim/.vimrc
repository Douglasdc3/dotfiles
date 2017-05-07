set nocompatible              " be iMproved, required
syntax enable

so ~/.vim/plugins.vim

set backspace=indent,eol,start					" Make backspace behave like every other editor"
let mapleader = ','								" Default leader is \, but a comma is much better
set relativenumber 
set number   									" Activate line numbers
set noerrorbells visualbell t_vb=               " No damn bells!
set complete=.,w,b,u 							" Set our desired autocompletion matching.
set autowriteall                                " Automatically write the file when switching buffers.
"set autochdir	                                " Change working directory to open buffer

let @a= "yiw^[/}^MO$this->^[pa = $^[pa;^[?construct^MOprotected $^[pa;^M^[/construct^M/^R\", <80>kb<80>kb^M, "

"-------------------Visual---------------------"
colorscheme atom-dark
set t_CO=256												"Force 256 colors in Terminal Vim
set guifont=Fira_Code:h17
set linespace=15											"Macvim-specific line-height

set guioptions-=e											"Disable gui tabs

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"Fake custom left padding
hi LineNR guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split border
hi vertsplit guifg=bg guibg=bg

"-------------------GIT------------------------"
":highlight DiffAdd ctermfg=253 ctermbg=237 guifg=#dadada guibg=#3a3a3a
hi! DiffAdd      guibg=#003300
hi! DiffChange   guibg=#003300
hi! DiffDelete   guifg=#330000 guibg=#330000
hi! DiffText     guibg=#990000    

"-------------------Search---------------------"
set hlsearch
set incsearch


"------------------ Fuzy Search-----------------"
set path+=**
set wildmenu 


"-------------------Split Management-----------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"-------------------Mappings-------------------"

"Make it easy to edit Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>is :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <Leader><Tab> :NERDTreeToggle<cr>

"Browse methods (tags)
nmap <C-R> :CtrlPBufTag<cr>
nmap <D-R> :CtrlPBufTag<cr>

"Most recently used files
nmap <C-E> :CtrlPMRUFiles<cr>
nmap <D-E> :CtrlPMRUFiles<cr>

"Map CMD-P to ctrl plugin
nmap <D-p> :CtrlP<cr>

"find ctags quickly
nmap <Leader>f :tag<space>

"Generate ctags
nmap <Leader>t :!ctags -R<cr><cr>

"jump to defintion
nmap <Leader>d <C-]>



"-------------Coding-style---------"
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set smartindent


"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ NERDTree
"/
set grepprg=ag						"Use Ag for search.
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ PHP namespace
"/
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>fn <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"Set php cs fixer default
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pvd
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ulti snippet 
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/ Ctags for namespacing
"/
set tags+=tags,tags.vendors

"-------------------Laravel specific-----------"
nmap <Leader>lm :!php artisan make:
nmap <Leader>lr :e app/Http/routes.php<cr>


"-------------------Auto-Commands--------------"

"Automatically source the Vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab



" Notes and Tips
"  - Press 'zz' to center in the middle of the screen
"  - 
