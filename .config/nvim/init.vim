call plug#begin('~/local/share/nvim/plugged')

" Color themes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'w0ng/vim-hybrid'

" Essentials
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Extras
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"set keymap=russian-jcukenwin

"set background=dark
"colorscheme gruvbox
set termguicolors
colorscheme codedark

let g:lightline = { 'colorscheme': 'seoul256' }

set clipboard+=unnamedplus
set nocompatible

syntax on

set number
set relativenumber
filetype plugin indent on

set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

set mouse=a mousemodel=popup

set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Cursor line
set cursorline
"set cursorcolumn

" Nerd Tree config
map <C-f> :NERDTreeToggle<CR>
let NERDTreeMenuUp='i'
let NERDTreeMenuDown='k'
let NERDTreeMapOpenSplit='y'

" UltiSnips config
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

:so $HOME/.config/nvim/ErgoVim.vim
:so $HOME/.config/nvim/Ru.vim


"~~~~~~~~~~~~~~~~~~~ Coc config ~~~~~~~~~~~~~~~~~~~
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-prettier',
\ 'coc-html',
\ 'coc-css',
\ 'coc-json',
\ 'coc-vimtex',
\ 'coc-python'
\ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" insert a new line after pressing enter in brackets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Use <Leader><Leader>K to show documentation in preview window
nnoremap <silent> <Leader><Leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <leader><S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <Leader><Leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <Leader><Leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <Leader><Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <Leader><Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <Leader><Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader><Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader><Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <Leader><Leader>p  :<C-u>CocListResume<CR>
"
" end of coc config 

