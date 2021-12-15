if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
Plug 'shaunsingh/nord.nvim'
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'digitaltoad/vim-pug'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

let mapleader = ' '
colorscheme nord
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
set completeopt=menu
set jumpoptions=stack
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set formatexpr=CocActionAsync('formatSelected')
set tagfunc=CocTagFunc
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

let g:coc_global_extensions = [
      \'coc-css',
      \'coc-stylelint',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-go',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-marketplace',
      \'coc-pairs',
      \'coc-prettier',
      \'coc-snippets',
      \'coc-sh',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \'coc-xml',
      \'coc-yaml',
      \'coc-docthis',
      \]

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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" trigger completion menu
inoremap <silent><expr> <c-h> coc#refresh()
" hide completion menu
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap gd <Plug>(coc-definition)
nmap gD <Plug>(coc-declaration)
nmap gm <Plug>(coc-implementation)
nmap gy <Plug>(coc-type-definition)
nmap gr <Plug>(coc-references-used)
nmap gn <Plug>(coc-rename)
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
nmap <leader>ca <Plug>(coc-codeaction)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.{go,ts,js,jsx,tsx,vue}, :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>

" Mappings for nvim-tree
nnoremap <silent> <Leader>e :NvimTreeToggle<CR>

let g:nvim_tree_icons = {
    \ 'default': '',
    \ }

lua <<EOF
-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}

-- lualine
require('lualine').setup {
  options = {
    theme = 'nord',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diff', 'g:coc_status' },
    lualine_x = {
      'fileformat',
      { 'o:encoding', upper = true },
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {
    lualine_a = { 'filename' },
  },
}

-- telescope
local actions = require "telescope.actions"
require'telescope'.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    }
}

-- gitsigns
require'gitsigns'.setup {
    current_line_blame = true,
}

-- nvim-tree
require'nvim-tree'.setup()
EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
