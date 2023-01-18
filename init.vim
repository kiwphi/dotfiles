call plug#begin()
" GRUVBOX
Plug 'morhetz/gruvbox'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UTILS
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

" GRUVBOX
autocmd vimenter * ++nested colorscheme gruvbox

" FZF
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
let $FZF_DEFAULT_OPTS="--bind \"ctrl-d:preview-down,ctrl-u:preview-up\""
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles!?<CR>
nnoremap <C-f> :Rg!<space>

" COC
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-tsserver', 'coc-json']
let g:coc_user_config = {'diagnostic.checkCurrentLine' : 1}
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
inoremap <expr><C-j> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" NETRW
nnoremap - :Ex<CR>
let g:netrw_banner=0

" SETS
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set number
set relativenumber
set ignorecase
set smartcase
set nowrap
set mouse=
set expandtab
