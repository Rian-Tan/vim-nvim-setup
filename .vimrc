set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'sheerun/vim-polyglot'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'vim-airline/vim-airline'
Plugin 'karb94/neoscroll.nvim'
Plugin 'BurntSushi/ripgrep'
Plugin 'sharkdp/fd'
" Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/sonokai'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'nvim-tree/nvim-tree.lua'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'neovim/nvim-lspconfig'
"Plugin 'hrsh7th/cmp-nvim-lsp'
"Plugin 'hrsh7th/cmp-buffer'
"Plugin 'hrsh7th/cmp-path'
"Plugin 'hrsh7th/cmp-cmdline'
"Plugin 'hrsh7th/nvim-cmp'
"Plugin 'onsails/lspkind.nvim'
Plugin 'numToStr/FTerm.nvim'
Plugin 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}
Plugin 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
" set number
set relativenumber
"autocmd vimenter * ++nested colorscheme gruvbox
autocmd vimenter * ++nested colorscheme sonokai
"vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
"vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
map <Leader>to :FTermToggle<CR>
map <Leader>bed :Telescope find_files<CR>
map <Leader>tt :NvimTreeToggle<CR>
map <Leader>sf :source%<CR>
map <Leader>lldb :LLDB<CR>
map <Leader>git :Lazygit<CR>

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

lua << EOF
require("luasnip.loaders.from_vscode").lazy_load()
EOF

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

lua << EOF 

vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

EOF 

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
	  mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

lua << EOF
vim.api.nvim_create_user_command('LLDB', function()
  require('FTerm').scratch({ cmd = {'lldb', '--debug', '--file', os.getenv("target_file")}})
end, { bang = true })
EOF

lua << EOF
vim.api.nvim_create_user_command('Lazygit', function()
  require('FTerm').scratch({ cmd = {'lazygit'}})
end, { bang = true })
EOF
