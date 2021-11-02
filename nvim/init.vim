"-------------------- Plugin Settings -------------------- {{

so ~/.dotfiles/nvim/plugins.vim

"}}


"-------------------- Editor Settings -------------------- {{

set nu
set background=dark
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set hlsearch
set encoding=UTF-8
set shell=zsh\ -i
set guifont=FiraCode\ Nerd\ Font\ Mono
set textwidth=80

if (has("termguicolors"))
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let mapleader = ','

colorscheme nightfly 

highlight Normal guibg=none
highlight NonText guibg=none

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"}}


"-------------------- Keymap Settings -------------------- {{

au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufWrite * mkview
autocmd BufRead * silent loadview

nmap <Leader>ev :tabedit ~/.dotfiles/nvim/init.vim<cr>
nmap <Leader>ep :tabedit ~/.dotfiles/nvim/plugins.vim<cr>
nmap <Leader>elp :tabedit ~/.dotfiles/nvim/lua/plugins.lua<cr>
nmap <Leader>ec :tabedit ~/.dotfiles/coc/coc-settings.json<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>ef :NERDTreeToggle<cr>
nmap <Leader>ey :%y+<cr>

"}}


"-------------------- Split Settings --------------------- {{

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"}}


"-------------------- Autoload Settings ------------------ {{

augroup autosource
  autocmd!
  autocmd BufWritePost ~/.dotfiles/nvim/init.vim source %
  autocmd TermOpen * setlocal bufhidden=hide
augroup END

"}}


"-------------------- CtrlP Settings ---------------------- {{

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"}}

"-------------------- NerdTree Settings ------------------------ {{

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,.git,node_modules
let g:NERDTreeWinSize = 24
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"}}

"-------------------- Airline Settings -------------------- {{

let g:airline#extensions#clock#format = '%d/%m/%g %I:%M'

"}}

"-------------------- Disable Keys -------------------- {{

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"}}

"-------------------- New Config --------------------- {{

lua << EOF

require('impatient')
require('plugins')

EOF

nnoremap <silent> <C-j> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <cmd>Lspsaga lsp_finder<CR>

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
let g:completion_chain_complete_list = {
        \ 'default' : {
        \   'default': [
        \       {'complete_items': ['lsp', 'snippet', 'path']},
        \       {'mode': '<c-p>'},
        \       {'mode': '<c-n>'}],
        \   'comment': []
        \   }
        \}


nnoremap <silent> ff <cmd>Telescope find_files<cr>
nnoremap <silent> fr <cmd>Telescope live_grep<cr>
nnoremap <silent> fb <cmd>Telescope buffers<cr>
nnoremap <silent> fh <cmd>Telescope help_tags<cr>


"}}


"--------------- Vim Snip ------------------- {{

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'


"}}
