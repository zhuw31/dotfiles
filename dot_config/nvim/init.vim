if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
Plug 'shaunsingh/nord.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'digitaltoad/vim-pug'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

let mapleader = ' '
colorscheme tokyonight
set hidden
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set nofoldenable
set matchtime=2
set splitright splitbelow
set ignorecase
set smartcase
set nohlsearch
set switchbuf=useopen,usetab
set updatetime=100
set inccommand=split
set noshowmode
set completeopt=menu,menuone,noselect
set jumpoptions=stack
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set signcolumn=yes:1
set shortmess+=c
set diffopt+=internal,algorithm:patience
set pumheight=20
set list listchars=tab:\|\ ,trail:·
set nobackup
set nowrap
set nowritebackup
set scrolloff=5
set sidescrolloff=5
set guicursor=a:block
setlocal noswapfile

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:mkdp_refresh_slow = 1
let g:vmt_dont_insert_fence = 1
let g:vmt_list_item_char = '-'

let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" resize window
nnoremap <silent> <Leader>= :vert resize +10<CR>
nnoremap <silent> <Leader>- :vert resize -10<CR>

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fl :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>gs :Telescope git_status<CR>

" Better search
nnoremap n nzzzv
nnoremap N Nzzzv
" Window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Yank to the end
nnoremap Y y$
" Move texts
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Enter new line below in insert mode
inoremap <c-j> <ESC>o
inoremap <c-k> <ESC>O

" Mappings for nvim-tree
nnoremap <silent> <Leader>e :NvimTreeToggle<CR>

let g:nvim_tree_icons = {
    \ 'default': '',
    \ }

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" load plugins
lua require'zhuw31'
